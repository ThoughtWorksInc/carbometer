class SessionsController < ApplicationController
  skip_authorization_check
  skip_before_filter :verify_authenticity_token
  
  def create
    auth = request.env['omniauth.auth']
    if @auth = Authentication.find_from_hash(auth)
      # Log the authorizing user in.
      self.current_user = @auth.user
      render :text => "Welcome, #{current_user.name}."
    else
      render :text => "Not authorized"
    end
  end
end
