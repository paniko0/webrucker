# -*- coding: utf-8 -*-
Webrucker.controllers :receiver do

  enable :sessions

  helpers do

    def protected! user
      unless authorized? user
        response['WWW-Authenticate'] = %(Basic realm="Restricted Area")
        throw(:halt, [401, "Not authorized\n"])
      end
    end

    def authorized? user
      @auth ||=  Rack::Auth::Basic::Request.new(request.env)
      @auth.provided? && @auth.basic? && ("'#{@auth.credentials[0]}'" == "'#{user.login.to_s}'" && "'#{@auth.credentials[1]}'" == "'#{user.response.first["header"]["authorization"]}'")
    end

  end

  get :index, :with => :login do
    @users = User.find_by(login: params[:login])
    protected! @users
    render 'receiver/list'
  end

  post :new, :with => :login do
    user = User.find_or_initialize_by(login: params[:login])
    user.push(:response, :json => request.body.read.force_encoding('UTF-8'), :received_date => Time.now, :header => request_headers)
    user.save!
  end

end
