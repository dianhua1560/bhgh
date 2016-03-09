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

