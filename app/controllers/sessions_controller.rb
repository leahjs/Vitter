class SessionsController < ApplicationController

	def new

		# redirect_to users_index_path
	end

	def create
		auth = request.env["omniauth.auth"]
		user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)
		session[:user_id] = user.id
		# redirect_to new_tweet_path
		redirect_to root_url, :notice => "Signed in!"
  end

  def destroy
    session[:user_id] = nil
		# redirect_to '' # Iam not sure what I want the root to be
    redirect_to root_url, :notice => "Signed out!"
  end
end
