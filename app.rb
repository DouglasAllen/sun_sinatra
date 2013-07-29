require 'sinatra'
require 'slim'
require './models'

enable :sessions

#set :root, File.expand_path('../', __FILE__)
set(:auth) do |*roles|   # <- notice the splat here
  condition do
    unless current_user && roles.any? {|role| current_user.in_role? role }
      redirect "/login", 303
    end
  end
end

before do 
  if request.path != '/login' && !current_user
    redirect "/login", 303
  end
end

def current_user
  @current_user ||= User.new 
end

get "/about_me", :auth => [:user, :admin] do
  "Your Account Details"
end

get "/admin", :auth => :admin do
  "Only admins are allowed here!"
end

get '/' do
  slim :index
end  

get '/login' do
  slim :login
end

get '/out' do
  'hello'
end
