class TestSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :content
end
