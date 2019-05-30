class SessionsController < ApplicationController
  def new
    user = User.find(session["warden.user.user.key"][1][0])
		@current_user = user
  end
end
