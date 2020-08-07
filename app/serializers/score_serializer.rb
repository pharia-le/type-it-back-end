class ScoreSerializer < ActiveModel::Serializer
  attributes :id,:cpm,:wpm,:accuracy,:errors_count
  belongs_to :test
end
