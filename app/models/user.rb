require 'BCrypt'
class User < ApplicationRecord
  include BCrypt
  
  has_many :reimbursement_lists, dependent: :destroy
  #has_one :token, dependent: :destroy
  #validates :name, presence: true
  
  validates :user_name, presence: true, uniqueness: true
  validates :user_type, presence: true
  validates :user_password, presence: true, length: { minimum: 6 }
  has_secure_password :user_password
  
  self.primary_key="user_id"

  def authenticate(pWord)
    pWord == user_password
  end
end