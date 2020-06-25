class Score < ApplicationRecord
  belongs_to :test
  validates :wpm, presence: true
  default_scope { order(wpm: :desc) }

  def self.avg_wpm()
    self.all.map {|s|s.wpm}.sum/self.all.length
  end
end
