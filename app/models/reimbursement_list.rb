require_relative '../../lib/completable'
class TodoList < ApplicationRecord
  include Completable
  belongs_to :user
  has_many :todos, dependent: :destroy
  validates :title, presence: true

  def completed?
    todos.all?(&:completed?)
  end
end