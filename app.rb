require 'sinatra'
require 'sinatra/activerecord'
require "sinatra/reloader"
require 'bcrypt'
# require_relative './models/profile'
require_relative './config/environments'


require "pry"

require_relative "./models/user"
# require_relative "./models/product"



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
  user = User.find_by(:email => params[:email])
  if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect('/profile/:user_name')
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
    session[:user_id] = user.id
    redirect('/profile/:user_name')
  else
    @user = user
    erb :signup
  end
end

get "/profile/:name" do
  if current_user?
    erb :profile
  else
    redirect('/session/login')
  end
end

post '/profile/:user_name' do
  erb :profile
end

get "/session/logout" do
  session.clear
  redirect('/')
end