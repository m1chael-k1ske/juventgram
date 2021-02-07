class User < ApplicationRecord # ApplicationRecord<Railsの基礎的なクラス>を継承してUserというクラスを定義
  validates :name, presence: true # カラム, 空欄ではないか判断
  validates :email, presence: true # カラム, 空欄ではないか判断
  
  has_secure_password # has_secure_passwordを記述した事で, Userモデルでpasswordとpassword_confirmationの2つが使えるようになり, DB内のpassword_digestに保存, その後gemfileにgem'bcrypt'を記述インストール
  
  has_many :topics # アソシエーション 1つのUserは複数のTopicを持つ
  has_many :favorites # アソシエーション 1つのUserは複数のFavoriteを持つ
end
