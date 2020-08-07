class TestSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :author, :likes
  has_many :scores
end
