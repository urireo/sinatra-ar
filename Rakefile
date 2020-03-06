require "sinatra/activerecord"
require "sinatra/activerecord/rake"

namespace :ctd do
  desc "Greet to CTD"
  task :greet do
    puts "Welcome to Code the Dream"
  end
end

  
namespace :db do
  task :load_config do
    require "./app"      # loads our sinatra app to configure opening the database
  end
end

