class Foodmenu < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc)}
  validates :user_id, presence: true
  validates :title, presence: true, length: {maximum: 50}
  validates :description, presence: true, length: {maximum: 200}
end
