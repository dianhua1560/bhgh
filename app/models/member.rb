class Member < ActiveRecord::Base
	def admin?
		position == 'admin'
	end
end
