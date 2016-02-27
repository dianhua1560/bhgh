class TestController < ApplicationController
    def index
        render json: "you are logged in with email: #{myEmail}"
    end
end
