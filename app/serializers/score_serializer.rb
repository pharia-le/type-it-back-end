class ScoreSerializer
  include FastJsonapi::ObjectSerializer
  attributes :cpm, :wpm
  belongs_to :test
end
