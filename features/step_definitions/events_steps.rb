World(ShowMeTheCookies)

Given /the following events exist/ do |events_table|
  events_table.hashes.each do |event|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    puts event[:title]
    Event.create(
      title: event[:title],
      description: event[:description],
      time: event[:time],
      location: '123 main street',
      organizer: 'davidbliu@gmail.com')
  end
end

Given /I get delete event "(.*)"/ do |title|
  Capybara.current_session.driver.header 'Referer', '/'
  visit '/events/delete/'+Event.find_by_title(title).id.to_s
end

Given /I test google_callback/ do
  page.driver.get('/auth/google_oauth2/callback')
end

Given(/^I post a sample event$/) do
  params = {event:
    {
    title: 'sample_event',
    time: 'May 3, 2016',
    location: '123 main street',
    organizer: 'davidbliu@gmail.com',
    description: 'random desc'
  }}
  page.driver.post('/events/create_form', params)
end

Given(/^I post a bad sample event$/) do
  params = {event:{
    time: 'May 3, 2016',
    location: '123 main street'
  }}
  page.driver.post('/events/create_form', params)
end

Then /there should be "(.*)" events/ do |num|
  Event.all.length.should == num.to_i
end

Given /I can post "(.*)" to "(.*)"/ do |response, title|
  e = Event.where(title: title).first
  params = {response: response}
  page.driver.post('/events/respond/'+e.id.to_s, params)
  er = EventResponse.where(event_id: e.id)
  expect er.length > 0
end

Given /I can request the events list/ do
  page.driver.get('/events/list')
end

Then /"(.*)" should be "(.*)" to (".*")/ do |email, response, title|
  e = Event.where(title: title).first
  EventResponse.where(event_id: e.id).where(email: email).first.response.should == response 
end

Given /^I update "(.*)" with "(.*)"/ do |title, params|
  params = eval(params)
  e = Event.find_by_title(title)
  page.driver.post('/events/update/'+e.id.to_s, params)
end

Then /^there should be an event "(.*)"/ do |title|
  expect Event.where(title: title).length > 0
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
  e = Event.find_by_title(title)
  page.driver.post('/events/delete/'+e.id.to_s)
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