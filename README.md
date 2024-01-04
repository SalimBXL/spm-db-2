# README

# BLANK


BLANK is template for Ruby On Rails projects.

## Versions
* Ruby 3.2.2
* Rails 7.1.2

## Fork the project
```
...
```

## Database
Database is Postgresql.

### Database configuration
The database configuration is stored into a Yaml type file at the root of the project. This file must be into the .gitignore file!
```
touch ./.env.yml
echo 'DATABASE_PROD: "BLANK_DATABASE"' >> ./.env.yml
echo 'DATABASE_DEV: "BLANK_DATABASE_dev"' >> ./.env.yml
echo 'DATABASE_TEST: "BLANK_DATABASE_test"' >> ./.env.yml
echo 'DATABASE_PORT: "5432"' >> ./.env.yml
echo 'DATABASE_HOST: "localhost"' >> ./.env.yml
echo 'DATABASE_USERNAME: "[USERNAME]"' >> ./.env.yml
echo 'DATABASE_PASSWORD: "[PASSWORD]"' >> ./.env.yml
```
### Database initialisation
```
rails db:create
rails db:migrate
rails db:seed
```

### Theme personalisation
The default theme is grey. You can personalise it by adding a color into the .env.yml file.
```
echo 'THEME_COLOR: "[COLOR]"' >> ./.env.yml
```

## Run the test suite
### Test the models
```
rails test test/models
```
### Test the controllers
```
rails test test/controllers
```

## Log in the app
