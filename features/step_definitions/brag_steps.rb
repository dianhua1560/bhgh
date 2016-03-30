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

