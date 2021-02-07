class Topic < ApplicationRecord
  validates :user_id, presence: true # カラム, 空欄ではないか判断 Userテーブルのデータを参照するため, あらかじめUserテーブルのuser_idを<外部キー = 他のテーブルのプライマリキー(カラム)> 
  validates :description, presence: true # カラム, 空欄ではないか判断
  validates :image, presence: true # カラム, 空欄ではないか判断
  
  belongs_to :user # アソシエーション それぞれのTopicは1つのUserを持つ
  
  mount_uploader :image, ImageUploader
  
  has_many :favorites # # アソシエーション 1つのTopicは複数のFavoriteを持つ
end
