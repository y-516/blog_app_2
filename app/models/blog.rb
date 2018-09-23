class Blog < ApplicationRecord
  validates :content,presence:true
  validates :content,length: { in: 1..140 }
  #アソシエーション
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  # #favoriteusersというコマンドを打つと取得したFavoriteテーブルのレコードのuser_idの数字と同じidを持つuserを全件取得できる
  # has_many :favorite_users,through: :favorites,source: :user
  # #through: :favoritesd で「favoritesを通過して」という意味
  # #source: :userで「userの情報を取得する」という意味

end
