class Micropost < ActiveRecord::Base
  validates :content, length: { maximum: 140 }, presence: true
  validates :user_id, presence: true
end