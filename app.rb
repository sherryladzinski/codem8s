require 'sinatra'
require 'sinatra/activerecord'
require_relative './models/item'
require_relative './config/environments'


get '/' do
  erb :index
end

get '/' do 
  erb :new_form
end

