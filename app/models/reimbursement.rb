#require_relative '../../lib/completable'

class Reimbursements < ApplicationRecord
  #include Completable

  belongs_to :reimbursement_list
  has_one :user, through: :reimbursement_list
  validates :title, presence: true
  validates :description, presence: true
  validates :amount, presence: true
  validates :date_submitted, presence: true
  self.primary_key = "reimbursement_id"
  def completed?
    completed
  end
end