class Test < ApplicationRecord
    has_many :scores
    validates :title, presence: true, uniqueness: true
    validates :content, presence: true
    validates :content, length: { minimum: 500 }
    validates :content, length: { maximum: 2000 }
    default_scope { order(likes: :desc) }
end
