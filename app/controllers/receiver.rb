# encoding: UTF-8
Webrucker.controllers :receiver do

  get :index do
    "Hello Webrucker"
  end

  get :index, :with => :login do
    @users = User.find_by(login: params[:login])
    render 'receiver/list'
  end

  post :new, :with => :login do
    user = User.find_or_initialize_by(login: params[:login])
    user.push(:response, :json => request.body.read.force_encoding('UTF-8'), :datetime => Time.now, :header => request_headers)
    user.save!
  end

end
