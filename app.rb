require "sinatra"
require "sinatra/reloader"
require "sinatra/activerecord"
#ActiveRecord::Base.establish_connection(adapter: "sqlite3", database: "mydb.db")
set :database, { adapter: "sqlite3", database: "mydb.db" }

require './models/user'

get '/' do   #display display the list of user names and emails using user_list.erb. 
  #use the Active Record method of selecting all users, that being @users=User.all
  @users_array = User.all  #similar to SELECT * FROM USERS and assigning it to an array
  erb :user_list
end

get '/new' do    #should display user_form.erb which should provide a form for entering the user name and email.
    erb :user_form
end

get '/remove' do  # should display user_delete.erb which should provide a form for specifying the name of the user to be deleted.
    erb :user_delete
end

post '/create' do #should add the user returned by user_form and put up a confirmation message.  
                     #Here you would use the Active Record means of inserting a record.
  user = User.new
  user.email = params[:email]
  user.name = params[:name]
  user.save 
  "User created. User-id= #{user.id} User-name= #{user.name} User-email= #{user.email}"

end

post '/delete' do #comes back after user delete
  users = User.find_by(name: params[:name]) #users is a record that contains the one row that meets criteria
  if !users.nil? #name of method .nil? (if we found th erecord)
      users.destroy
     "user #{params[:name]} has been erased"
  else
     "user #{params[:name]} does not exist"
  end
end