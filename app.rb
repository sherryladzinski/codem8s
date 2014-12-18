require 'sinatra'
require 'sinatra/activerecord'
require "sinatra/reloader"
require 'bcrypt'
# require_relative './models/profile'
require_relative './config/environments'


require "pry"

require_relative "./models/user"
require_relative "./models/city"
require_relative "./models/post"

#binding.pry

enable :sessions

helpers do
  def current_user
    @current_user || nil
  end

  def current_user?
    @current_user == nil ? false : true
  end
end

before do
  @errors ||= []
  @current_user = User.find_by(:id => session[:user_id])
end

get "/" do
  erb :main
end


get '/session/login' do
  erb :login
end

post "/session/login" do
  @user = User.find_by(:email => params[:email])
  if @user && @user.authenticate(params[:password])
    session[:user_id] = @user.id
    redirect('/about')
  else
    @errors << "Invalid email or password. Try again!"
    erb :login
  end
end

get '/session/signup' do
  erb :signup
end

post "/session/signup" do
  @user = User.new(params)
  if @user.save
    session[:user_id] = @user.id 
    redirect '/about'
  else
    @errors << "Invalid entry. Try again"
    erb :signup
  end
end

# get '/profile/:user_name' do
#   erb :profile
# end

get '/about' do
  erb :about
end

get "/profile" do
  if current_user?
    @user = User.all
    erb :profile
  else
    nil
    #redirect('/session/login')
  end
end

post '/profile' do

end

get '/pickacity' do
  if current_user? 
    @city = City.all
    # redirect '/housing'
  end
  erb :pickacity
end

post "/pickacity" do
  redirect ('/housing')
end

post "/housing" do
  @post = Post.new(post_content: params[:post_content])
  @post.save

end

get '/housing' do
 erb :housing
end
# get '/housing' do
#   erb: housing
# end


get "/session/logout" do
  session.clear
  redirect('/')
end


