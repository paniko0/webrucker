# Helper methods defined here can be accessed in any controller or view in the application

Webrucker.helpers do
  # def simple_helper_method
  #  ...
  # end

  def request_headers
    env.inject({}){|acc, (k,v)| acc[$1.downcase] = v if k =~ /^http_(.*)/i; acc}
  end 
end
