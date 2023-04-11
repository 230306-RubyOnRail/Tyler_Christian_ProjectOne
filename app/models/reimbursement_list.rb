#require_relative '../../lib/completable'
class ReimbursementList < ApplicationRecord
  #include Completable
  belongs_to :user
  #has_many :reimbursements, dependent: :destroy
  #validates :title, presence: true
  #has_one :user_id, through: :reimbursement_list
  #validates :title, presence: true
  validates :user_id, presence: true
  validates :descr, presence: true
  validates :amount, presence: true
  validates :date_submitted, presence: true
  self.primary_key = 'reimbursement_id'
  def completed?
    reimbursements.all?(&:completed?)
  end
end