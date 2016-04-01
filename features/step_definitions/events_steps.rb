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

Given /the following event photos exist/ do |table|
  table.hashes.each do |row|
    event = Event.where(title: row[:title]).first
    p = Photo.new(
      object_type: 'event',
      object_id: event.id,
      url: row[:url])
    p.save!
  end
end

When(/^I delete "([^"]*)"$/) do |title|
  event = Event.where(title: title).first
  click_link("delete-#{event.id}")
end

When(/^I edit "([^"]*)"$/) do |title|
  event = Event.where(title: title).first
  click_link("edit-#{event.id}")
end

Then(/^I should see all the events$/) do
  Event.all.each do |event|
  	step "I should see \"#{event.title}\""
  end
end

Given(/^I respond "([^"]*)" on "([^"]*)"$/) do |response, title|
  response = response.downcase
  response.gsub! " ", "-"
  event = Event.where(title: title).first
  click_on("#{response}-#{event.id}")
end

Given(/^I delete my response on "([^"]*)"$/) do |title|
  event = Event.where(title: title).first
  response = EventResponse.where(event_id: event.id).first
  click_on("undo-#{response.id}")
end