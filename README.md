# Cars API

The objective of this project is the implementation of some endpoints to manage brands and models of cars. With this development I want to show some of my skills as a software engineer.

For the implementation I used Ruby on Rails configured only as an API.

The API consists of the following endpoints:
- GET /brands
- POST /brands
- GET /models
- PUT /models/:id
- GET /brands/:id/models
- POST /brands/:id/models

### Prerequisites

- Ruby 3.1.3
- Bundler 2.4.7
- PostgreSQL 14

### Check out the repository

```bash
$ git clone https://github.com/anmacagno/cars-api.git
```

### Install the dependencies

```bash
$ bundle install
```

### Setup the database

Important: postgres will use the default role. This is the same name as the operating system user that initialized the database.

```bash
$ rails db:setup
```

### Run the test suite

```bash
$ rails rspec
```

### Run the linter

```bash
$ rails rubocop
```

### Run the server

```bash
$ rails server
```

### Test an endpoint

If you are testing in the local environment the base url for the endpoints is http://localhost:3000/api/v1.

```bash
$ curl http://localhost:3000/api/v1/brands
```

### Added gems

These are the gems that I added to the project (development and test):

- factory_bot_rails
- rspec-rails
- rubocop
- rubocop-performance
- rubocop-rails
- rubocop-rake
- rubocop-rspec
- shoulda-matchers
- simplecov
- database_consistency

Also, to render JSON as response from the endpoints, I use the [jbuilder](https://github.com/rails/jbuilder) gem.

### Project structure overview

These are the important folders and files. Don't forget to look at the tests in the spec folder.

Where to start? Look at the file **app/controllers/api/v1/brands_controller.rb**.

```
├── app
│   ├── controllers
│   │   ├── api
│   │   │   └── v1
│   │   │       ├── brands
│   │   │       │   └── models_controller.rb
│   │   │       ├── brands_controller.rb
│   │   │       └── models_controller.rb
│   │   └── application_controller.rb
│   ├── models
│   │   ├── brand.rb
│   │   └── model.rb
│   └── views
│       └── api
│           └── *
├── config
│   └── routes.rb
├── db
│   ├── migrate
│   │   └── 20230307222005_create_brands.rb
│   │   └── 20230307222015_create_models.rb
│   ├── schema.rb
│   └── seeds.rb
├── spec
│   └── *
└── Gemfile
```
