class Comment < ApplicationRecord
  validates :content, presence: true # カラム, 空欄ではないか判断
  
  belongs_to :user # アソシエーション それぞれのCommentは1つのUserを持つ
  belongs_to :topic # アソシエーション それぞれのCommentは1つのTopicを持つ
end
