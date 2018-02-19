class UsersController < Sinatra::Base

  # sets root as the parent-directory of the current file
  set :root, File.join(File.dirname(__FILE__), '..')

  # sets the view directory correctly
  set :views, Proc.new { File.join(root, "views") }

  # Turn on Sinatra Reloader
  configure :development do
      register Sinatra::Reloader
  end

  get '/users' do

      @title = "User Index"

      @users = User.all

      erb :'users/index'

  end

  get '/users/new'  do

    # create an empty user
    @user = User.new

    erb :'users/new'

  end

  get '/users/:id' do

    # get the ID and turn it in to an integer
    id = params[:id].to_i

    # make a single user object available in the template
    # @user = $users[id]
    @user = User.find id

    erb :'users/show'

  end

  post '/users' do

    user = User.new

    # bind the values
    user.first_name = params[:first_name]
    user.last_name = params[:last_name]
    user.email = params[:email]

    # save the user
    user.save

    redirect "/users"

  end

  put '/users/:id'  do

    # data is gathered in the params object
    id = params[:id].to_i

    # load the object with the id
    user = User.find id

    # update the values
    user.first_name = params[:first_name]
    user.last_name = params[:last_name]
    user.email = params[:email]

    # save the user
    user.save

    # redirect the user to a GET route. We'll go back to the INDEX.
    redirect "/users";

  end

  delete '/users/:id'  do

    # get the ID
    id = params[:id].to_i

    # delete the user from the database
    # $users.delete_at(id)
    User.destroy id

    # redirect back to the homepage
    redirect "/users"

  end

  get '/users/:id/edit'  do

    # get the ID and turn it in to an integer
    id = params[:id].to_i

    # make a single user object available in the template
    # @user = $users[id]
    @user = User.find id

    erb :'users/edit'

  end

end
