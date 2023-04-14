require 'test_helper'

class SessionsControllerTest < ActiveSupport::TestCase
  #Tests
  test "CreateSession" do
    post "/login", params{ {user_name: 'ruby_app', user_password: 'secretpassword'}}, as: :json
    assert_response :login

  end
end