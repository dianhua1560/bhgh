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

Given(/I edit brag "(.*)"$/) do |arg|
	@brag = Brag.where(title: arg).first
	visit "/brags/edit/#{@brag.id}"
end

Given(/I delete brag "(.*)"$/) do |arg|
	@brag = Brag.where(title: arg).first
	page.find('#delete-brag-'+@brag.id.to_s).click
end