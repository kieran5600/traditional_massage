require 'sinatra'
require 'rubygems'
require 'gmail'


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

get '/confirm' do
  erb :confirm
end

get '/send_email' do

  username = "traditionalmassagekjp@gmail.com"
  password = "threebbb"

  message = params[:message]
  first_name = params[:firstName]
  last_name = params[:lastName]
  date = params[:date]
  email = params[:email]
  
  Gmail.connect(username, password) do |gmail|
      gmail.deliver do
  	  to "traditionalmassagekjp@gmail.com"
  	  subject "Reservation for #{date}"
  	  
  	  # text_part do
  	  #   body %Q( #{message} \n #{firstName} )
  	  # end

  	  html_part do
  	    content_type 'text/html; charset=UTF-8'
  	    body %Q(
        <p> Name: #{first_name} #{last_name} </p>
        <p> Email: #{email} </p>
        <p> Date: #{date} </p>
        <p> Comment: #{message} </p>)
  	  end

	   end
    end

  redirect("/contact")

end