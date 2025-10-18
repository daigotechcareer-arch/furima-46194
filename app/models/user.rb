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
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i,
                                message: 'には英字と数字の両方を含めて設定してください' }

  with_options presence: true do
    validates :last_name,       format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' }
    validates :first_name,      format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' }
    validates :last_name_kana,  format: { with: /\A[ァ-ヶー]+\z/, message: '全角カタカナを使用してください' }
    validates :first_name_kana, format: { with: /\A[ァ-ヶー]+\z/, message: '全角カタカナを使用してください' }
    validates :birth_date
  end
end
