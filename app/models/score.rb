class Score < ApplicationRecord
  belongs_to :test
  validates :wpm, presence: true
  validates :wpm, :cpm, :accuracy, :errors_count, numericality: { only_integer: true }
  default_scope { order(created_at: :desc) }
end
