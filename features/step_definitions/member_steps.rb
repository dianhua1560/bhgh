Given(/^the following members exist:$/) do |table|
	table.hashes.each do |member|
		puts member
		Member.create(
			name: member[:name],
			email: member[:email],
			position: member[:position]
		)
	end
end

Given(/^that I am logged in as "(.*)"$/) do |myEmail|
	create_cookie('email', myEmail)
end