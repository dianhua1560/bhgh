Given /I should see the admin page/ do 
	visit '/admin'
end
 

Given /I visit the admin page/ do 
	visit '/admin'
end

Given /I delete member "(.*)"/ do |name|
	visit "/delete_member/#{Member.find_by_name(name).id}"
end