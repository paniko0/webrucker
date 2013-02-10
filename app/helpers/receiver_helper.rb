# -*- coding: utf-8 -*-
# Helper methods defined here can be accessed in any controller or view in the application

Webrucker.helpers do
  # def simple_helper_method
  #  ...
  # end
  def request_headers
    env.inject({}){|acc, (k,v)| acc[$1.downcase] = v if k =~ /^http_(.*)/i; acc}
  end

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
