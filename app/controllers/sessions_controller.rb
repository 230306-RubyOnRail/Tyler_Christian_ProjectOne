require_relative '../../lib/json_web_token'
#require 'printmessage'
class SessionsController < ApplicationController
  #include PrintMessage
  #include 'bcrypt'
  #POST/Login;
  def create
    credentials = JSON.parse(request.body.read)
    puts "BEEP BEEP BEEP #{credentials}"
    user = User.where(user_name: credentials['username']).first
    puts "LOGIN ATTEMPT LOGIN ATTEMPT #{credentials['password']}"
    #puts "------------------ #{user.password_digest}--------------------"
    if user&.authenticate(credentials['password'])
      puts "LOGIN SUCCESS!!!"
      render json: { token: JsonWebToken.encode(user_id: user.id), user_id: user.id}, status: :created
    else
      puts "LOGIN FAILS!!!"
      head :unauthorized
    end
  end

  #Delete/Logout
  #def destroy
    
  #end

  #def options
    #render json:{}
  #end
end