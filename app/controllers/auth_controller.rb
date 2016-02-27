class AuthController < ApplicationController
    def google_callback
        authentication_info = request.env["omniauth.auth"]
        # save email in cookie
        cookies[:email] = authentication_info['info']['email']
        puts 'this is the email'
        puts authentication_info['info']['email']
        # redirect to original route
        if session[:auth_redirect] != nil
          redirect_to session[:auth_redirect]
        else
          redirect_to '/'
        end
    end
    def logout
        cookies[:email] = nil
        redirect_to "https://accounts.google.com/logout"
    end
end
