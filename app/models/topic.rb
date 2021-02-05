class Topic < ApplicationRecord
  validates :user_id, presence: true # カラム, 空欄ではないか判断
  validates :description, presence: true # カラム, 空欄ではないか判断
  validates :image, presence: true # カラム, 空欄ではないか判断
end
