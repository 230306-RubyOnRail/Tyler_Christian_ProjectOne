require 'test_helper'

class ReimbursementsControllerTest < ActiveSupport::TestCase
    test "getsIndexManager" do
       puts "RUNNING REIMBCONTROLLER"
        post "/reimbursement-manager/1"
        assert_response :getsIndex
    end
    test "creates" do
        
        post "/login", params{ {user_name: 'ruby_app', user_password: 'secretpassword'}}, as: :json

    end
    test "Show Shows" do
        post "/reimbursement/2", params{ {user_name: 'ruby_app', user_password: 'secretpassword'}}, as: :json

    end
    test "update" do 
        put "/reimbursements/3", params{ {amount:'3.50', status: 'SEEN'}}, as: :json

    end
    test "destroy" do
        post "/reimbursements_delete/4"
    end
end