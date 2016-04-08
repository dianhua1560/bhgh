module AuthHelper
    def myEmail
	return 'suzezhang1113@berkeley.edu'
        cookies[:email] ? cookies[:email] : nil
    end

    def current_member
    	Member.where(email: myEmail).first
    end
end
