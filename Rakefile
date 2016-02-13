ENV["SINATRA_ENV"] ||= "development"

require_relative './config/environment'
require 'sinatra/activerecord/rake'

task :environment do
  connection_details = YAML::load(File.open('config/database.yml'))
  ActiveRecord::Base.establish_connection(connection_details)
  require_relative './config/environment.rb'
end


# Type `rake -T` on your command line to see the available rake tasks.

task :console => :environment do
  Pry.start
end