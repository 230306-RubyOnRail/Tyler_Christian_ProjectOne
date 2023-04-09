class Token < ApplicationRecord
    belongs_to :user
    validates :token, presence: true, uniqueness: true
    validates :tokentype, presence: true
    validates :created_at, presence: true
    validates :updated_at, presence: true
    validates :user_id, presence:true
    self.primary_key = (:id)
    #self.foreign_key = "user_id"
    def authenticate_token(t,u)
        puts "AUTHENTICATING TOKEN!"
        Token.Where(token: t).first
        t == token
    end
 
end
