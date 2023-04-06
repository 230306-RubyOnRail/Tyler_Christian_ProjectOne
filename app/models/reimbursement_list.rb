#require_relative '../../lib/completable'
class ReimbursementList < ApplicationRecord
  #include Completable
  belongs_to :user
  #has_many :reimbursements, dependent: :destroy
  validates :title, presence: true
  self.primary_key = 'reimbursement_id'
  def completed?
    reimbursements.all?(&:completed?)
  end
end