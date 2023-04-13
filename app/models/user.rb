#require 'BCrypt'
class User < ApplicationRecord
  #include BCrypt
  
  has_many :reimbursement_lists, dependent: :destroy #<--- might need to rename these things;
  has_one :token, dependent: :destroy
  #validates :name, presence: true
  # attr_accessor :user_name, :user_id, :user_password, :user_type
  validates :user_name, presence: true, uniqueness: true
  validates :user_type, presence: true
  validates :user_password, presence: true, length: { minimum: 6 }
  puts "HEY THERE !!!!!!!-------"
  #has_secure_password 
  #has_secure_password :user_password
  self.primary_key="user_id"
  # def user_password_digest()
  # end

  # def authenticate(pWord)
  #   pWord == user_password
  # end
  # def confirm?
  #   confirmed_at?
  # end
  # def testr
  #   puts "user_id: #{self.user_id} user_name: #{self.user_name} user_password: #{self.user_password} user_type #{self.user_type}"
  # end
end