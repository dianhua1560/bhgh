module AuthHelper
    def myEmail
        return "mgandhi93@berkeley.edu"
        #[:email] ? cookies[:email] : nil
    end

    def current_member
    	Member.where(email: myEmail).first
    end
end
