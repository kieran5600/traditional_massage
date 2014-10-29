require 'sinatra'

get '/' do
  erb :home 
end 

get '/styles' do
  erb :styles
end 

get '/contact' do
  erb :contact 
end 

get '/about' do
  erb :about 
end 

get '/health_tips' do
  erb :health_tips
end 