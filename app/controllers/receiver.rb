# encoding: UTF-8
Webrucker.controllers :receiver do

  get :index do
    "Hello Webrucker"
  end

  get :index, :with => :login do
    @users = User.find_by(login: params[:login])
    logger.info @users.response[0]
    @authorization_header = @users["header"].nil? ? "NoAuth" : @users["header"]["authorization"]
    render 'receiver/list'
  end

  post :new, :with => :login do
    user = User.find_or_initialize_by(login: params[:login])
    user.push(:response, :json => request.body.read, :datetime => Time.now, :header => request_headers)
    user.save!
  end

end
