require 'sinatra'
require 'sinatra/reloader' if development?
require 'pg'
require_relative './models/user.rb'
require_relative './models/color.rb'
require_relative './controllers/users_controller.rb'
require_relative './controllers/colors_controller.rb'
require_relative './controllers/static_controller.rb'

use Rack::Reloader

use Rack::MethodOverride

run Rack::Cascade.new([
  UsersController,
  ColorsController,
  StaticController
])
