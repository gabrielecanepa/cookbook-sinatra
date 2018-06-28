require "sinatra"
require "sinatra/reloader" if development?
require "pry-byebug"
require "better_errors"

set :bind, '0.0.0.0'

configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = File.expand_path('..', __FILE__)
end

get '/' do # Router
  erb :index # Controller
end

get '/team' do
  erb :'team/index'
end

get '/deployment' do
  erb :deployment
end

get '/team/:username' do
  @usernames = ['ssaunier', 'Papillard']
  erb :'team/show'
end
