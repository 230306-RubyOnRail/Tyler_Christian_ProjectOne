require 'BCrypt'
class User < ApplicationRecord
  include BCrypt
  
  has_many :reimbursement_lists, dependent: :destroy #<--- might need to rename these things;
  has_one :token, dependent: :destroy
  #validates :name, presence: true
  attr_accessor :user_name, :user_id, :user_password, :usr_type
  validates :user_name, presence: true, uniqueness: true
  validates :user_type, presence: true
  validates :user_password, presence: true, length: { minimum: 6 }
  has_secure_password :user_password
  self.primary_key="user_id"
  
  def authenticate(pWord)
    pWord == user_password
  end
  def confirm?
    confirmed_at?
  end
  def testr
    puts "USER NAME IS : #{self.user_name} XXXXXX---XXXX"
  end
end