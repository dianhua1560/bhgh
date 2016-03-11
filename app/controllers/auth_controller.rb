require 'openssl'
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

class AuthController < ApplicationController
    def google_callback
        authentication_info = request.env["omniauth.auth"]
        cookies[:email] = authentication_info['info']['email']
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
