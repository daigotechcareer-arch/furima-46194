# app/models/user.rb
class User < ApplicationRecord
  # Deviseモジュール
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # アソシエーション
  has_many :items
  has_many :orders

  # バリデーション
  validates :nickname, presence: true
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }

  with_options presence: true do
    validates :last_name,       format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
    validates :first_name,      format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
    validates :last_name_kana,  format: { with: /\A[ァ-ヶー]+\z/ }
    validates :first_name_kana, format: { with: /\A[ァ-ヶー]+\z/ }
    validates :birth_date
  end
end
