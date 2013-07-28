
require 'sinatra'
require 'slim'

get '/' do
  'Hello world!'
end

get '/login' do
  slim :login
end

get '/zhis' do
  erb :zhis
end
