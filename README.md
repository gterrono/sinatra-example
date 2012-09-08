PennApps Sinatra
=============

About
-----
This is a little webapp designed to show how to win PennApps with some classy web-development (using Sinatra). This app is live at http://pennapps-sinatra.herokuapp.com.

Setup
-----
* Install Ruby 1.9.3
* Install the heroku toolbelt: https://toolbelt.heroku.com
* Install dm-sqlite-adapter and dm-postgres-adapter
  * Check http://datamapper.org/getting-started.html under "Installing an Adapter" for instructions
* Run `bundle install`

You also may have to install gcc and g++

Running the app
---------------
* Run `foreman start` in the same directory as sample_app.rb
* The app can be viewed in a browser at localhost:5000


Libraries Used
--------------
* Sinatra (http://sinatrarb.com)
* DataMapper (http://datamapper.org)
* HTML5 Boilerplate (http://html5boilerplate.com)
* Twitter Bootstrap (http://twitter.github.com/bootstrap)
