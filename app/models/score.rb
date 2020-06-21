class Score < ApplicationRecord
  belongs_to :test
  validates :wpm, presence: true
  default_scope { order(wpm: :desc) }
  
  def calculate_wpm(all_typed_entries,time_min,uncorrect_errors)
    gross_wpm = (all_typed_entries/5)/time_min
    net_wpm = gross_wpm - (uncorrect_errors/time_min)
    self.wpm = net_wpm
    self.save
  end

  def calculate_cpm()
    self.cpm = self.wpm*5
    self.save
  end

  def self.avg_wpm()
    self.all.map {|s|s.wpm}.sum/self.all.length
  end
end
