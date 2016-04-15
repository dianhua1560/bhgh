Given(/^the following brags exist:$/) do |table|
	table.hashes.each do |row|
		b = Brag.new(
			title: row[:title],
			author: row[:author],
			subject: row[:subject],
			body: row[:body]
			)
		b.save!
	end
end

Given(/there should be "(.*)" brags/) do |num|
	Brag.all.length.should == num.to_i
end

Given /I update brag "(.*)" with "(.*)"/ do |title, params|
	params = eval(params)
	brag = Brag.find_by_title(title)
	page.driver.post('/brags/update/'+brag.id.to_s, params)
end

Then /there should be a brag with title "(.*)" and body "(.*)"/ do |title, body|
	brag = Brag.find_by_title(title)
	expect brag.body == body
end

Given /I delete brag "(.*)"/ do |title|
	brag = Brag.find_by_title(title)
	page.driver.post('/brags/delete/'+brag.id.to_s)
end

Then /I can request the brags list/ do 
	page.driver.get('/brags/list')
end

Given /I like "(.*)"/ do |title|
	brag = Brag.find_by_title(title)
	page.driver.post('/brags/like/'+brag.id.to_s)
end

Given /I unlike "(.*)"/ do |title|
	page.driver.post('/brags/unlike/'+Brag.find_by_title(title).id.to_s)
end

Then /there should be "(.*)" brag likes/ do |num|
	expect BragLike.all.length == num.to_i
end