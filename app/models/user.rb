class User < ApplicationRecord
  has_many :reimbursement_lists, dependent: :destroy
  
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }
  has_secure_password
  self.primary_key="user_id"
end