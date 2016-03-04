World(ShowMeTheCookies)

Given /the following events exist/ do |events_table|
  events_table.hashes.each do |event|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    puts event[:title]
    Event.create(
      title: event[:title],
      description: event[:description],
      time: event[:time])
  end
end

Then(/^I should see all the events$/) do
  Event.all.each do |event|
  	step "I should see \"#{event.title}\""
  end
end