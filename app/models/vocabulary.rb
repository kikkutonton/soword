class Vocabulary < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :word, presence: true, length: { maximum: 50 }
  validates :meaning, presence: true, length: { maximum: 300 }
  validates :similarity, length: { maximum: 300 }
  validates :example, length: { maximum: 500 }
end
