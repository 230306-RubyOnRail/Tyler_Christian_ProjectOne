require_relative '../../lib/json_web_token'

class SessionsController < ApplicationController
  include PrintMessage
  def create
    credentials = JSON.parse(request.body.read)
    user = User.where(email: credentials['email']).first
    if user&.authenticate(credentials['password'])
      render json: { token: JsonWebToken.encode(user_id: user.id), user_id: user.id}, status: :created
    else
      head :unauthorized
    end
  end
end