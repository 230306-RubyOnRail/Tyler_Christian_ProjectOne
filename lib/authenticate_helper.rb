module AuthenticateHelper
    def authenticate_user
        user_name = JsonWebTokenService.decode(request.headers['HTTP_AUTH_TOKEN'])["user_name"]
        @current_user = User.find_by(user_name: user_name)
        render json: {error: 'not authorized'}, status: 401 unless @current_user
    end
    def user_sign_in?
        !!curent_user
    end
    def current_user
        @current_user
    end
end