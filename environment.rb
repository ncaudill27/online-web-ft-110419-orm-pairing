require 'sqlite3'
require 'pry'

DB = SQLite3::Database.new('tweets_users_orm.db')
DB.results_as_hash = true

require_relative 'user.rb'

User.setup_table
