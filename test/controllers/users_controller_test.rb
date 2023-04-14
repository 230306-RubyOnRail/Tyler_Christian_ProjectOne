require 'test_helper'

class UserControllerTest < ActionDispatch::IntegrationTest
  #Tests
  test "CreateShouldWork" do
    #user= user(:user1)
    post "/users_create/", params{ { user_name: user.user_name, user_password: user.user_password, user_type: user.user_type } }, as: :json
    assert :

  end
end

# RSpec.describe UsersController, type: :controller do
#   describe "POST #create" do
#     context "with valid parameters" do
#       let(:valid_params) { { user: { name: "John", email: "john@example.com", password: "password" } } }

#       it "creates a new user" do
#         expect {
#           post :create, params: valid_params
#         }.to change(User, :count).by(1)
#       end

#       it "returns a JSON response with the created user" do
#         post :create, params: valid_params
#         expect(response).to have_http_status(:created)
#         expect(response.content_type).to eq('application/json')
#         expect(response.body).to include_json(user: { name: "John", email: "john@example.com" })
#       end
#     end

#     context "with invalid parameters" do
#       let(:invalid_params) { { user: { name: "", email: "invalid_email", password: "short" } } }

#       it "does not create a new user" do
#         expect {
#           post :create, params: invalid_params
#         }.not_to change(User, :count)
#       end

#       it "returns a JSON response with the errors" do
#         post :create, params: invalid_params
#         expect(response).to have_http_status(:unprocessable_entity)
#         expect(response.content_type).to eq('application/json')
#         expect(response.body).to include_json({
#           name: ["can't be blank"],
#           email: ["is invalid"],
#           password: ["is too short (minimum is 6 characters)"]
#         })
#       end
#     end
#   end
# end