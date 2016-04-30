module AuthHelper
    def myEmail
    	# return "scholar@gmail.com"
            return 'davidbliu@gmail.com'
    	# return "chenallen2012@gmail.com"
        cookies[:email] ? cookies[:email] : nil
    end

    def current_member
    	Member.where(email: myEmail).first
    end
end
