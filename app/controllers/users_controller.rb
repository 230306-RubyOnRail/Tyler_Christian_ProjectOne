#require 'BCrypt'

class UsersController < ApplicationController
  #include BCrypt

  def create
    #puts "=========================================USER: #{JSON.parse(request.body.read)}-------------------------------------------------"
    user = User.new(JSON.parse(request.body.read))
    user= User.create(JSON.parse(request.body.read))
    # puts " 1111 #{user.testr}"
    # puts " 2222 #{user.testr}"
    # puts " 3333 #{user.testr}"
    #has_secure_password :user_password;
    if user.save
      render json: { user: user }, status: :created
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end
end