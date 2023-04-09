require_relative '../../lib/json_web_token'
#require 'printmessage'
class SessionsController < ApplicationController
  #include PrintMessage
  #include 'bcrypt'
  #POST/Login;
  def Initialize()
    super.Initialize()
    @outHash=Hash.new
    #session[:current_user] = User.new();
  end
  def create
    credentials = JSON.parse(request.body.read)
    user = User.where(user_name: credentials['username']).first
    if user&.authenticate(credentials['password'])
      puts "LOGIN SUCCESS!!!"
      
      session_token = JsonWebToken.encode(user_id: user.id)
      @outHash = { token: session_token, user_id: user.id}
      #needs a way to store the token to the database'
      #------
      myToken = Token.create(user_id: user.id, token: session_token, tokentype: user.user_type, created_at: Time.now, updated_at: Time.now)
      session[:current_user]=User.where(user_name: credentials['username']).first
      puts "TOKEN: #{@outHash.to_json}- ID: #{session[:current_user].id}-----"
      render json: @outHash.to_json , status: :created
    else
      puts "LOGIN FAILS!!!"
      head :unauthorized
    end
  end
  def myTest
      puts "GIBBERISHG #{Time.now}"
  end
  #Delete/Logout
  def destroy
      #get the time

  end

  #def options
    #render json:{}
  #end
end