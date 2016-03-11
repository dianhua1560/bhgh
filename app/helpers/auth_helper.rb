module AuthHelper
    def myEmail
    	return 'chenallen2012@gmail.com'
        cookies[:email] ? cookies[:email] : nil
    end

    def current_member
    	Member.where(email: myEmail).first
    end
end
