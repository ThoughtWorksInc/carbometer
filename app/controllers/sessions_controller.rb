class SessionsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  
  def create
    auth = request.env['rack.auth']
    unless @auth = Authentication.find_from_hash(auth)
      # Create a new user or add an auth to existing user, depending on
      # whether there is already a user signed in.
      @auth = Authentication.create_from_hash(auth, current_user)
    end
    # Log the authorizing user in.
    self.current_user = @auth.user

    render :text => "Welcome, #{current_user.name}."
  end
end
