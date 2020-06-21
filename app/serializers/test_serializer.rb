class TestSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :content
  has_many :scores
end
