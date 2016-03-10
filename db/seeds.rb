# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# create members
Member.create(
	email:'davidbliu@gmail.com',
	name: 'David Liu',
	position: 'admin', 
	phone: '(714) 299-1786')
Member.create(
	email:'chenallen2012@gmail.com',
	name: 'Allen Chen',
	position: 'tutor', 
	phone: '(123) 456-7890')
Member.create(
	email:'edward@gmail.com',
	name:'Edward Smith',
	position: 'scholar')
Member.create(
	email:'julian@gmail.com',
	name:'Julian Doe',
	position: 'scholar')

# create dummy events
e1 = Event.create(title: 'USF Visit', 
	description: 'Visiting USF Campus',
	time: 1.day.from_now,
	organizer: 'davidbliu@gmail.com',
	location: '123 Main Street, San Francisco, CA')
e2 = Event.create(title: 'Volunteer @ Glide', 
	description: 'Come volunteer at glide and teach kids math',
	time: 2.days.from_now,
	organizer: 'chenallen2012@gmail.com')
Event.create(title: 'Food Bank Teaching', 
	description: 'teaching how to cook',
	time: 3.day.from_now,
	organizer: 'asdf@gmail.com')
Event.create(title: 'Berkeley Visit', 
	description: 'Visiting berkeley Campus',
	time: 4.day.from_now,
	organizer: 'davidbliu@gmail.com')
Event.create(title: 'Event 5', 
	description: 'description 5',
	time: 5.day.from_now,
	organizer: 'davidbliu@gmail.com')

# dummy brags
Brag.create(
	author: 'davidbliu@gmail.com',
	title: 'Great Job Edward',
	body: 'Edward showed focus and determination and raised his grade from C- to a B+ in math!',
	subject: 'edward@gmail.com'
	)

Brag.create(
	author: 'chenallen2012@gmail.com',
	title: 'Julian got into a great high school',
	body: 'Julian has been working hard and finally got into Harvard High School!',
	subject: 'julian@gmail.com'
	)

# photo
photos = []
Photo.create(
	object_type:'event',
	object_id: e1.id,
	url: 'https://scontent-sjc2-1.xx.fbcdn.net/hphotos-xpt1/t31.0-0/p640x640/12829159_974829552570131_3139526372410727349_o.jpg')