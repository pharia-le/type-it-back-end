class Test < ApplicationRecord
    has_many :scores
    default_scope { order(likes: :desc) }
end
