CarboMeter
==========

Goal: information radiator -- get interesting information in front of everybody.

TeamCity:
    http://teamcity.carbonfive.com/project.html?projectId=project29&tab=projectOverview

Tracker project: 
    https://www.pivotaltracker.com/projects/202009

Heroku site:
    http://carbometer.herokuapp.com
    Owned by the Carbon Five account.

Contributors
------------
* Rob
* Jared
* Jonah
* Sean
* Winston
    

Install Dev Environment
-----------------------
* Have RVM installed
* git clone git@github.com:carbonfive/carbometer.git
* cd carbometer # RVM should create 'carbometer' gemset
* gem install bundler
* bundle install

Running locally
---------------
CarboMeter uses oauth to authenticate github users. In order to run the app locally you need to authenticate with a registered oauth app which redirects to `localhost` rather than `carbometer.herokuapp.com`.

Project contributors have apps registered with github which you can use or you can setup your own:

1. Go to https://github.com/account/applications
2. Register a new application
3. Set the application's URL to `http://localhost:3000`
4. Set the application's callback URL to `http://localhost:3000/auth/github/callback`
5. Submit the form.

Now you can run CarboMeter locally:
`GITHUB_KEY={the github Client ID for your app} GITHUB_SECRET={the github Secret for your app} rails s`

Displaying Data
---------------
View templates can be rendered using http://slim-lang.com/docs.html

For now carbometer renders a single static page so add your content to views/dashboards/index.