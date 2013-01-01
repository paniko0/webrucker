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
    "New Event mano: #{params[:login]}, #{User.find_by_login(params[:login]).response}"
  end

  post :new, :with => :login do
    logger.info("Read: #{request.body.read}")
    logger.info("String: #{request.body.string}")

    user = User.find_by_login(params[:login])

    if user.nil?
      user = User.new(:login => params[:login])
    end
    
    user.response.push(request.body.string)
    user.save!
  end

end
