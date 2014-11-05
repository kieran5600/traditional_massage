require 'sinatra'
require 'gmail'
require 'sinatra/reloader' if development?

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

get '/send_email' do

  username = "traditionalmassagekjp@gmail.com"
  password = "threebbb"

  message = params[:message]
  

  Gmail.connect(username, password) do |gmail|
      gmail.deliver do
  	  to "traditionalmassagekjp@gmail.com"
  	  subject "Hello Email"
  	  
  	  text_part do
  	    body "#{message}"
  	  end

  	  html_part do
  	    content_type 'text/html; charset=UTF-8'
  	    body "<p>#{message}</p>"

  	  end
	   end
    end

  redirect("/contact")

end