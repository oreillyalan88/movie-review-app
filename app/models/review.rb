class Review < ApplicationRecord
    belongs_to :movie
    belongs_to :user
    default_scope -> { order(created_at: :desc) }
    validates :user_id, presence: true
    validates :comment, presence: true, length: { maximum: 2000 }
    validates :rating, presence: true
end
