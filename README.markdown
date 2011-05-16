# Welcome to Nautilus

This Shell program is meant to be a template to get a team up and started
as soon as possible.


## Getting Started

1. Export the Project

2. bundle install

3. rake db:create:all

4. rake db:migrate

2. Start Coding

## Configurations To Be Mindful

Change the following when starting the application

### AWS SES Settings

* `application.rb` or specific environment file

```ruby
config.action_mailer.delivery_method = :ses
config.action_mailer.default_url_options = { :host => 'localhost:3000' }
```

* `config/initializers/amazone_ses_config.rb` for credentials (default set the ENV vars)

```ruby 
ActionMailer::Base.add_delivery_method :ses, AWS::SES::Base,
  :access_key_id     => ENV['AMAZON_ACCESS_KEY'],
  :secret_access_key => ENV['AMAZON_SECRET_KEY']
```

* Amazon SES will not send emails unless it is from an authorized "from", remember to 
set up the mailer_sender in `config/initializers/clearance.rb`

### Clearance Overrides

Clearance is used as the base user admin module.  Some overrides have been supplied:
* `routes.rb`
* `config/initializers/admin_authentication.rb`

A default admin user id has been provided as: 
* id: `admin@example.com`
* pw: `abc123`

Change this after first time install!!


# Standards
In order to facilitate rapid development we use the following standards:

* HTML/CSS/JavaScript for UI
* Authentication:  thoughtbot/clearance
* CSS is based on blueprint-css as a framework for developers. Designers to code in this context
* Charting: Javascript SVG Based and Open Source
  * Raphel based
    * https://github.com/uiteoi/ico
    * http://g.raphaeljs.com
  * Others:
    * http://code.google.com/p/flot/
    * http://vis.stanford.edu/protovis/
    * http://thejit.org/demos/
