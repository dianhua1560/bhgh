# Getting set up
```
git clone https://github.com/dianhua1560/bhgh.git
bundle install
rake db:migrate
rake db:seed
source setenv.sh
rails s
```
visit localhost:3000 and verify that everything is working

# Setting environment variables
run `source setenv.sh` before running `rails s`. This will set your environment variables with the correct GOOGLE_CLIENT_ID and GOOGLE_CLIENT_SECRET

to do this on heroku run `sh heroku_deploy.sh`

# Authentication
* there is a `before_filter` placed on all controller actions that checks if the user is signed in. if not, redirect to google.
  * a google callback in `auth_controller` saves the users email in a cookie
* `myEmail` in `auth_helper` gets the users email

__relevant files__
* `controllers/application_controller`
* `controllers/auth_controller`
* `helpers/auth_helper`
* and the google omniauth setup `config/initializers/omniauth.rb`

# Models
check out `/db/schema.rb`

__Proposed Models__
```
Members
  basic information: email, name, phone, position (admin/scholar/tutor)
  profile: TODO
Event
  title, time, description, organizer
  photos can be added via Photo model
EventResponse
  email, event_id, response (Going, Not Going, Interested)
Photo
  object_id, object_type, photo_url
Brag
  author, title, body, subject
  photos added thru Photo
BragLike
  email, brag_id
```
We will use emails to join models (ie event organizer --> member, brag author --> member)

TODO: post, comments, page view tracking

# Iteration 1-2 (Deadline 3/11)
Complete the four events features (see pbl.link/169-tracker)

progress here: <a href = 'http://pbl.link/169-site'>pbl.link/169-site</a>

TODO: finish tests, finish implementing event responses, improve UI
