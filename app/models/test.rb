class Test < ApplicationRecord
    has_many :scores
    validates :name, presence: true, uniqueness: true
    validates :content, presence: true
    validates :content, length: { minimum: 500 }
    validates :content, length: { maximum: 2000 }
    default_scope { order(name: :asc) }
end
