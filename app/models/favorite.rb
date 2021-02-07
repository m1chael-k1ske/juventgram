class Favorite < ApplicationRecord
  belongs_to :user # アソシエーション それぞれのFavoriteは1つのUserを持つ
  belongs_to :topic # アソシエーション それぞれのFavoriteは1つのTopicを持つ
end
