Webrucker.controllers :receiver do
  # get :index, :map => "/foo/bar" do
  #   session[:foo] = "bar"
  #   render 'index'
  # end

  # get :sample, :map => "/sample/url", :provides => [:any, :js] do
  #   case content_type
  #     when :js then ...
  #     else ...
  # end

  # get :foo, :with => :id do
  #   "Maps to url '/foo/#{params[:id]}'"
  # end

  # get "/example" do
  #   "Hello world!"
  # end

  get :index do
    "Hello Webrucker"
  end

  get :new, :with => :login do
    @users = User.find_by_login(params[:login])
    render 'receiver/list'
  end

  post :new, :with => :login do
    # logger.info("Read: #{request.body.read}")
    # logger.info("String: #{request.body.string}")

    user = User.find_by_login(params[:login])
    json = JSON.parse(request.body.string)

    if user.nil?
      user = User.new(:login => params[:login])
    end
    
    user.response.push(json.to_s)
    user.save!
  end

end
