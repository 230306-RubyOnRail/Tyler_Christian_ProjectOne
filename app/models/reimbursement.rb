require_relative '../../lib/completable'

class Todo < ApplicationRecord
  include Completable

  belongs_to :todo_list
  has_one :user, through: :todo_list
  validates :title, presence: true
  validates :description, presence: true

  def completed?
    completed
  end
end