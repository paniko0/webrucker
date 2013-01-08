# encoding: UTF-8
Webrucker.controllers :receiver do

  get :index do
    "Hello Webrucker"
  end

  get :index, :with => :login do
    # user = User.where(:login => params[:login]).sort(:datetime.desc)
    # @users = user[0]
    @users = User.find_by_login(params[:login])
    # @users = User.all(:login => params[:login])

    render 'receiver/list'
  end

  post :new, :with => :login do
    user = User.find_by_login(params[:login])
    json = JSON.parse(request.body.read)

    json["resource"]["status"]["description"] = ""

    if user.nil?
      user = User.new(:login => params[:login])
    end

    user.response.push(:json => json, :datetime => Time.now.getlocal, :header => request_headers)
    user.save!
  end

end
