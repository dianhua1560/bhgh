class Member < ActiveRecord::Base
	def admin?
		position == 'admin'
	end

	def self.is_admin_email(email)
		return Member.where(position: 'admin').pluck(:email).include?(email)
	end

	def self.is_email(string)
		email_set = [".edu", ".com", ".org", ".net"]
		if string == nil
			return false
		elsif string == ''
			return false
		else
			return email_set.include? string[-4..-1]
		end
	end
end
