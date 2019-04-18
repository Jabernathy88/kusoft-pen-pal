create repo, etc.

rails new . --api --database=postgresql -T --no-rdoc --no-ri

rails db:create

rails g scaffold User first_name last_name email_address

gem foreman

gem 'rack-cors'
```
config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins '*'
    resource(
      '*',
      headers: :any,
      methods: [:get, :patch, :put, :delete, :post, :options]
    )
  end
end
```

configure cors

configure routes

configure controller

	look here: 
	https://medium.com/@bruno_boehm/reactjs-ruby-on-rails-api-heroku-app-2645c93f0814

procfile
```
api: PORT=3001 && bundle exec rails s
web: bundle exec rails s
```

configure basic seeds

get fancy gitignore

heroku create

heroku buildpacks:add heroku/ruby

 --- 2 --- 

test crud first model postman on deployed

rails g model Language name average_proficiency:float

rails g model Proficiency level:int

rails g model Message text:text

configure routes above

rails g migration add_user_and_language_ref_to_proficiencies
 - User (foreign key)
 - Language (foreign key)

rails g migration add_users_and_language_ref_to_messages
 - User who sent the message (foreign key)
 - User who received the message (foreign key)
 - Language the message is in (foreign key)

message model method - compare proficiency levels

proficiency model on save - update average level on language model

refactor for style, o.o. design

update and share postman documentation

update readme

