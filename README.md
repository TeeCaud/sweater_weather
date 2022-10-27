# Sweater Weather
## 🌨 Table of Contents 🌨
* [Introduction](#Introduction)
* [API Endpoints](#API-Endpoints)
* [Database Schema](#Database-Schema)
* [Technologies and Tools](#Technologies-and-Tools)
* [Set Up](#Set-Up)
* [Contributors](#Contributors)
* [Sources](#Sources)
* [Project Specs](#Project-Specs)

### Introduction
* Welcome to Sweater Weather, an API-only application consuming and exposing different API endpoints to get weather for your upcoming road trip.

* Access free API keys from the following sites:
- https://www.mapquestapi.com
- https://api.openweathermap.org
- https://openlibrary.org

* Review the docs to consume various endpoints

### API Endpoints
* POST http://localhost:3000/api/v1/sign-up

* api_key = parsed_user[:data][:attributes][:api_key]

```JSON
                  {
                  "start_city": "Denver, CO",
                  "end_city": "Chicago, IL",
                  "api_key": api_key
                  }
```

### Database Schema
```Ruby
create_table "users", force: :cascade do |t|
  t.string "email"
  t.string "password_digest"
  t.datetime "created_at", null: false
  t.datetime "updated_at", null: false
  t.string "api_key"
end
```

### Technologies and Tools
* ![Ruby](https://img.shields.io/badge/Ruby-CC342D?style=for-the-badge&logo=ruby&logoColor=white)
* ![Rails](https://img.shields.io/badge/Ruby_on_Rails-CC0000?style=for-the-badge&logo=ruby-on-rails&logoColor=white)
* ![SQL](https://img.shields.io/badge/GIT-E44C30?style=for-the-badge&logo=git&logoColor=white)
* ![GitHub](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)
* ![Postgres](https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white)
* ![Postman](https://img.shields.io/badge/Postman-FF6C37?style=for-the-badge&logo=Postman&logoColor=white)
* ![RESTful API](https://img.shields.io/badge/RESTful%20API-%E2%8E%94-brightgreen)
* ![GitHub Projects](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)
* ![GitHub Issues](https://img.shields.io/badge/GitHub%20Projects-%F0%9F%92%BB-lightgrey)
* ![JSON](https://img.shields.io/badge/json-5E5C5C?style=for-the-badge&logo=json&logoColor=white)
* ![VS](https://img.shields.io/badge/Visual_Studio_Code-0078D4?style=for-the-badge&logo=visual%20studio%20code&logoColor=white)

### Set Up

This application runs on:
* Ruby 2.7.2
* Rails 5.2.8

#### Local Setup Instructions:

* Fork and Clone the repo
* Install gem packages: bundle install
* Setup the database: rake db:{drop,create,migrate,seed} (must have Postgres installed)
* Create a user to obtain a unique API key to use for requests.

#### Test Suite

To run the test suit, simply run:
```Ruby
bundle exec rspec spec
```

Simplecov will display total test coverage when running the test suite. You can find a more detailed report by running:  open coverage/index.html

#### Contributors
Tyler Caudill  
[![Linkedin Badge](https://img.shields.io/badge/-LinkedIn-blue?style=flat&logo=Linkedin&logoColor=white)](https://www.linkedin.com/in/tyler-caudill-75885b240/)  [![GitHub Badge](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/TeeCaud)


### Sources
* [Postman](https://learning.postman.com/docs/getting-started/introduction/)
* [Stack Overflow](https://stackoverflow.com/)
* [Rails](https://guides.rubyonrails.org/v5.0/active_job_basics.html)
* [Heroku](https://devcenter.heroku.com)
* [Shoulda Matchers](https://github.com/thoughtbot/shoulda-matchers)

### Project Specs
The project spec & rubric can be found [here](https://backend.turing.edu/module3/projects/sweater_weather/)
