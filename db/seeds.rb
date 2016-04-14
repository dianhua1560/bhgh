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

# create dummy events
Event.create(title: 'USF Visit', 
	description: 'Visiting USF Campus',
	time: 1.day.from_now,
	organizer: 'davidbliu@gmail.com',
	location: '123 Main Street, San Francisco, CA')
Event.create(title: 'Volunteer @ Glide', 
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
photos = [
'https://scontent.fsnc1-1.fna.fbcdn.net/hphotos-xfp1/t31.0-8/12715865_814793751980494_182109926343872031_o.jpg',
'https://scontent.fsnc1-1.fna.fbcdn.net/hphotos-xla1/t31.0-8/10365333_814793748647161_6223780491860330863_o.jpg',
'https://scontent.fsnc1-1.fna.fbcdn.net/hphotos-xpl1/t31.0-8/12419301_807455669380969_7734389728992320353_o.jpg',
'https://scontent.fsnc1-1.fna.fbcdn.net/hphotos-xlp1/t31.0-8/12633504_804217996371403_1693490407123982532_o.jpg',
'https://scontent.fsnc1-1.fna.fbcdn.net/hphotos-xpf1/v/t1.0-9/12540971_802356836557519_6133796907546944636_n.png?oh=6b99ade88ad3d2925130bbbf72a6bf64&oe=5750F051',
'https://scontent.fsnc1-1.fna.fbcdn.net/hphotos-xal1/t31.0-8/12622417_800933333366536_8564312578282761370_o.jpg',
'https://scontent.fsnc1-1.fna.fbcdn.net/hphotos-xap1/v/t1.0-9/20381_677901052336432_2254843787346279099_n.jpg?oh=be70757d0d9a88be4b4d1296af5dd895&oe=575683B9',
'https://scontent.fsnc1-1.fna.fbcdn.net/hphotos-prn2/t31.0-8/10704426_570103306449541_7283717196481443134_o.jpg',
'https://scontent.fsnc1-1.fna.fbcdn.net/hphotos-xtf1/v/t1.0-9/10433888_562104743916064_5763499246334048714_n.jpg?oh=b452a7ec10fdcaf3bf1f79ee34363ede&oe=5795AF4B'
]
photos.each do |url|
	event = Event.all.sample
	Photo.create(object_type:'event',
		object_id: event.id,
		url: url)
end

#dummy posts
Post.create(
	title: 'Title1',
	author: 'chenallen2012@gmail.com'
	)
Post.create(
	title: 'Title2',
	author: 'chenallen2012@gmail.com'
	)
Post.create(
	title: 'Title3',
	author: 'mwan2013@berkeley.edu'
	)