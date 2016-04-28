# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# create members
admins = {
	'davidbliu@gmail.com' => 'David Liu',
	'chenallen2012@gmail.com' => 'Allen Chen',
	'suzezhang1113@berkeley.edu' => 'Jack Zhang'
}
scholars = {
	'edward@gmail.com'=> 'Edward Smith',
	'julian@gmail.com'=> 'Julian Doe'
}

phone = '(123) 456-7890'
admins.keys.each do |email|
	Member.create(
		email: email,
		name: admins[email],
		position: 'admin',
		phone: phone)
end
scholars.keys.each do |email|
	Member.create(
		email: email,
		name: scholars[email],
		position: 'scholar')
end

# create 10 dummy events
Event.create(title: 'USF Visit', 
	description: 'Visiting USF Campus',
	time: 1.day.from_now,
	organizer: 'davidbliu@gmail.com',
	location: '123 Main Street, San Francisco, CA')

Event.create(title: 'Volunteer @ Glide', 
	description: 'Come volunteer at glide and teach kids math',
	time: 2.days.from_now,
	organizer: 'chenallen2012@gmail.com',
	location: '12345 Center Street, Berkeley, CA')

Event.create(title: 'Food Bank Teaching', 
	description: 'teaching how to cook',
	time: 3.day.from_now,
	organizer: 'chenallen2012@gmail.com',
	location: 'Berkeley Marina')

Event.create(title: 'UC Berkeley Visit', 
	description: 'Visiting berkeley Campus',
	time: 4.day.from_now,
	organizer: 'davidbliu@gmail.com',
	location: 'UC Berkeley')

Event.create(title: 'Park Cleanup', 
	description: 'Come help out clean up the park! Will be giving volunteer hours',
	time: 5.day.from_now,
	organizer: 'davidbliu@gmail.com',
	location: 'Williard Park, Berkeley')

Event.create(title: 'Extra Tutoring Session', 
	description: 'If anyone needs extra help, come to our extra tutoring session',
	time: 6.day.from_now,
	organizer: 'davidbliu@gmail.com',
	location: '123 Main Street, San Francisco, CA')

Event.create(title: 'Volunteer @ Food Bank', 
	description: 'Come volunteer at the food bank',
	time: 7.days.from_now,
	organizer: 'chenallen2012@gmail.com',
	location: '334 Market Street, San Francisco, CA')

Event.create(title: 'Stanford Visit', 
	description: 'I guess we should visit Stanford as well',
	time: 8.day.from_now,
	organizer: 'davidbliu@gmail.com',
	location: 'Stanford')

Event.create(title: 'Picnic at the Park', 
	description: 'Lets get together and have a nice picnic! Bring some yummy foods',
	time: 9.day.from_now,
	organizer: 'davidbliu@gmail.com',
	location: 'Golden Gate Park')

Event.create(title: 'Lunch With Tutors', 
	description: 'Come get lunch with your tutor!',
	time: 10.day.from_now,
	organizer: 'davidbliu@gmail.com',
	location: '123 Main Street, Berkeley, CA')

# create 10 dummy brags
#1
Brag.create(
	author: 'davidbliu@gmail.com',
	title: 'Great Job Edward',
	body: 'Edward showed focus and determination and raised his grade from C- to a B+ in math!',
	subject: 'edward@gmail.com'
	)
#2
Brag.create(
	author: 'chenallen2012@gmail.com',
	title: 'Julian got into a great high school',
	body: 'Julian has been working hard and finally got into Harvard High School!',
	subject: 'julian@gmail.com'
	)
#3
Brag.create(
	author: 'davidbliu@gmail.com',
	title: 'Julie finished her essay',
	body: 'Julie spent 3 days writing her first short story, and she just finished! You should ask her to read it to all of us.',
	subject: 'julie@gmail.com'
	)
#4
Brag.create(
	author: 'chenallen2012@gmail.com',
	title: 'Bob got a great score',
	body: 'Bob got an A in his English class!',
	subject: 'bob@gmail.com'
	)
#5
Brag.create(
	author: 'davidbliu@gmail.com',
	title: 'Great Job George',
	body: 'George showed focus and determination and raised his grade from C- to a B+ in science!',
	subject: 'george@gmail.com'
	)
#6
Brag.create(
	author: 'chenallen2012@gmail.com',
	title: 'Jerry got into UC Berkeley',
	body: 'Jerry has been working hard and finally got into Berkeley!',
	subject: 'jerry@gmail.com'
	)
#7
Brag.create(
	author: 'davidbliu@gmail.com',
	title: 'MVP at volunteer event: David',
	body: 'David really stood out at the volunteer event yesterday, and event the event host congratulated him for working so hard!',
	subject: 'david@gmail.com'
	)
#8
Brag.create(
	author: 'chenallen2012@gmail.com',
	title: 'Mike is smart',
	body: 'Mike studied really hard for his test and he scored the highest grade in his class!',
	subject: 'mike@gmail.com'
	)
#9
Brag.create(
	author: 'davidbliu@gmail.com',
	title: 'Allen helped out at the networking event',
	body: 'Allen volunteered to help out at the event last night! Big thanks!',
	subject: 'allen@gmail.com'
	)
#10
Brag.create(
	author: 'chenallen2012@gmail.com',
	title: 'Thank you Maria',
	body: 'Everybody, thank Maria for bringing cookies to last nights tutoring session! Yummy!',
	subject: 'maria@gmail.com'
	)


#create 10 dummy posts
p1 = Post.create(
	title: 'College Essays',
	author: 'scholar1@gmail.com',
	body: 'Should I talk about my elementary school experiences in my college essays?'
	)
p2 = Post.create(
	title: 'What are my chances of getting into Berkeley?',
	author: 'scholar2@gmail.com',
	body: 'I have a 3.9 GPA and I really want to go to UC Berkeley because my older brother goes there. What are my chances of getting in and what should I do to increase my chances?'
	)
p3 = Post.create(
	title: 'How do I get financial aid?',
	author: 'scholar3@gmail.com',
	body: 'Who should I talk to about getting financial aid?'
	)
p4 = Post.create(
	title: 'What is college life like?',
	author: 'scholar4@gmail.com',
	body: 'Im worried that I wont like college life. Does anyone have experience/stories?'
	)
p5 = Post.create(
	title: 'International School',
	author: 'scholar5@gmail.com',
	body: 'Im thinking about going to an international high school. Does anybody have any advice?'
	)
p6 = Post.create(
	title: 'SAT Prep',
	author: 'scholar6@gmail.com',
	body: 'What are some good preparation books for the SAT?'
	)
p7 = Post.create(
	title: 'What should I major in?',
	author: 'scholar7@gmail.com',
	body: 'I dont really know what I want to study in college. I really like math but I dont want to be a math major. Are there any other options?'
	)
p8 = Post.create(
	title: 'Summer school',
	author: 'scholar8@gmail.com',
	body: 'Im thinking about taking extra summer classes to prepare for college. What classes should I take?'
	)
p9 = Post.create(
	title: 'What do you think about home schooling?',
	author: 'scholar9@gmail.com',
	body: 'My mom wants to home school me. What are the disadvantages of being home schooled?'
	)
p10 = Post.create(
	title: 'High School vs College',
	author: 'scholar10@gmail.com',
	body: 'Whats the biggest difference between high school life and college life? Im excited to go to college but also a little bit scared..' 
	)

#dummy 2 post responses per pose
PostResponse.create(
	post_id: p1.id, 
	author: 'chenallen2012@gmail.com',
	body: 'Yeah, definitely! Admissions offices want to know everything about you!'
	)
PostResponse.create(
	post_id: p1.id, 
	author: 'chenallen2012@gmail.com',
	body: 'Maybe focus more on your later experiences, such as in high school.'
	)

PostResponse.create(
	post_id: p2.id, 
	author: 'mwan2013@berkeley.edu',
	body: 'You have really good chances!! Try doing more extra curricular activities'
	)
PostResponse.create(
	post_id: p2.id, 
	author: 'davidbliu@gmail.com',
	body: 'My GPA was only 3.3 and I got into Berkeley, so youre looking good!'
	)

PostResponse.create(
	post_id: p3.id, 
	author: 'davidbliu@gmail.com',
	body: 'Try talking to your advisor!'
	)
PostResponse.create(
	post_id: p3.id, 
	author: 'davidbliu@berkeley.edu',
	body: 'Check out this link: www.financialaid.com'
	)

PostResponse.create(
	post_id: p4.id, 
	author: 'chenallen2012@gmail.com',
	body: 'A lot of all-nighters..'
	)
PostResponse.create(
	post_id: p4.id, 
	author: 'chenallen2012@gmail.com',
	body: 'Youre going to love it! Dont worry'
	)

PostResponse.create(
	post_id: p5.id, 
	author: 'mwan2013@berkeley.edu',
	body: 'Seems like a fun opportunity!'
	)
PostResponse.create(
	post_id: p5.id, 
	author: 'davidbliu@gmail.com',
	body: 'I went to international school in London! Lets grab food sometime and Ill tell you all about it'
	)

PostResponse.create(
	post_id: p6.id, 
	author: 'davidbliu@gmail.com',
	body: 'I used Barrons'
	)
PostResponse.create(
	post_id: p6.id, 
	author: 'davidbliu@berkeley.edu',
	body: 'I used College Board'
	)

PostResponse.create(
	post_id: p7.id, 
	author: 'chenallen2012@gmail.com',
	body: 'Youll discover what you like to study eventually after you take a few classes. Dont feel rushed'
	)
PostResponse.create(
	post_id: p7.id, 
	author: 'chenallen2012@gmail.com',
	body: 'Computer Science!!! Its awesome'
	)

PostResponse.create(
	post_id: p8.id, 
	author: 'mwan2013@berkeley.edu',
	body: 'Try taking some math classes'
	)
PostResponse.create(
	post_id: p8.id, 
	author: 'davidbliu@gmail.com',
	body: 'Get your GE classes out of the way'
	)

PostResponse.create(
	post_id: p9.id, 
	author: 'davidbliu@gmail.com',
	body: 'You wont meet as many friends :('
	)
PostResponse.create(
	post_id: p9.id, 
	author: 'davidbliu@berkeley.edu',
	body: 'Youll definitely learn more'
	)

PostResponse.create(
	post_id: p10.id, 
	author: 'davidbliu@gmail.com',
	body: 'No more curfew!!!!'
	)
PostResponse.create(
	post_id: p10.id, 
	author: 'davidbliu@berkeley.edu',
	body: 'College is so fun, dont worry about a thing! Youll get used to being alone and doing whatever you want!'
	)