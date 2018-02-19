class ColorsController < Sinatra::Base

  # sets root as the parent-directory of the current file
  set :root, File.join(File.dirname(__FILE__), '..')

  # sets the view directory correctly
  set :views, Proc.new { File.join(root, "views") }

  # Turn on Sinatra Reloader
  configure :development do
      register Sinatra::Reloader
  end

  get '/colors' do

      @title = "Color Index"

      @colors = Color.all

      erb :'colors/index'

  end

  get '/colors/new'  do

    # create an empty color
    @color = Color.new

    erb :'colors/new'

  end

  get '/colors/:id' do

    # get the ID and turn it in to an integer
    id = params[:id].to_i

    # make a single color object available in the template
    # @color = $colors[id]
    @color = Color.find id

    erb :'colors/show'

  end

  post '/colors' do

    color = Color.new

    # bind the values
    color.favourite_colour = params[:favourite_colour]

    # save the color
    color.save

    redirect "/colors"

  end

  put '/colors/:id'  do

    # data is gathered in the params object
    id = params[:id].to_i

    # load the object with the id
    color = Color.find id

    # update the values
    color.favourite_colour = params[:favourite_colour]

    # save the color
    color.save

    # redirect the color to a GET route. We'll go back to the INDEX.
    redirect "/colors";

  end

  delete '/colors/:id'  do

    # get the ID
    id = params[:id].to_i

    # delete the color from the database
    # $colors.delete_at(id)
    Color.destroy id

    # redirect back to the homepage
    redirect "/colors"

  end

  get '/colors/:id/edit'  do

    # get the ID and turn it in to an integer
    id = params[:id].to_i

    # make a single color object available in the template
    # @color = $colors[id]
    @color = Color.find id

    erb :'colors/edit'

  end

end
