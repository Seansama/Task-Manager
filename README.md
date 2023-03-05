# TASK MANAGER

### Project Description
Keeping track of your day-to-day tasks can be daunting and tiring. This project aims to do away with that hassle by helping you keep organised.

### Client side live link and repo
- **Live-link** - https://task-manager-react-seven.vercel.app/
- **Repository** - https://github.com/Seansama/task-manager-React

### Setup

1. Clone this project by typing in `git@github.com:Seansama/Task-Manager.git` into a bash terminal.
2. Navigate into the project folder.
3. Install the dependencies in the Gemfile by typing `bundle install` into the command line.
4. Run rackup `config.ru` to start up the backend.
5. Then open the front end [here](https://task-manager-react-seven.vercel.app/)

### File structure

#### Config => Contains the project's configuration files

- **database.yml** - Dictates how a database will be created upon a migration.
- **environment.rb** - Contains all file requirements for bundler and rack.

#### db => Contains all migration files and databases.

- **development.sqlite3** - Contains the project tables in SQL format. Autogenerated upon running a migration.
- **schema.rb** - An auto generated file upon running a migration using `bundle exec rake db:migrate`. Serves as a representation of the migrated tables in ruby syntax.
- **seeds.rb** - Contains seed data used to populate the database tables in ruby format. The population is done using `bundle exec rake db:seed`.

###### Migrate => Contains the necessary files for creation of database tables

- **20230228105510_create_tasks.rb** - Contains code that is migrated to create the users table using `bundle exec rake db:migrate`.
- **20230303072548_create_users.rb** - Contains code that is migrated to create the Tasks table using `bundle exec rake db:migrate`.

#### App/Models => Contains all the classes

- **task.rb** - Contains the Task class and associated methods and associations.
- **user.rb** - Contains the User class and associated methods and associations.

#### App/controllers => Contains all the classes

-**application_controller.rb** - Contains all sinatra routes to be run by config.ru

#### Root directory(Task_manager) - Contains the dependencies necessary for the project

- **Gemfile** - Contains the gems necessary to make the project come together.
- **Gemfile.lock** - Autogenerated upon execution of `bundle install`.
- **Rakefile** - Contains tasks that can be executed using `bundle exec rake 'task-name'`.
- **LICENCE** - An open source MIT licence.
- **config.ru** - Runs the Application controller.
- **README.md** - This README.



_This project has been done by_:

Shaun Mwangi

_**This project is open source under an MIT open source licence.**_


