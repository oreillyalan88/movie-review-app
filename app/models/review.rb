class Review < ApplicationRecord
    acts_as_votable
    belongs_to :movie
    belongs_to :user
    default_scope -> { order(created_at: :desc) }
    validates :user_id, presence: true
    validates :comment, presence: true, length: { maximum: 2000 }
    validates :rating, presence: true
    validates_uniqueness_of :user_id, :scope => :movie_id
    
end
