class SessionsController < ApplicationController

	def create
    	user = User.find_by_email(params[:session][:email].downcase)
  		if user && user.authenticate(params[:session][:password])
   			sign_in user
        p 'redirect back or'
      	redirect_back_or user
  		else
    		flash.now[:error] = 'Invalid email/password combination' # Not quite right!
  		end
  	end

  	def destroy
    	sign_out
    	redirect_to root_url
  	end

end
