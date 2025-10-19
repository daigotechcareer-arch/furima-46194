# app/models/user.rb
class User < ApplicationRecord
  # Deviseモジュール
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  # バリデーション
  validates :nickname, presence: true

  # パスワード（英数字混合）
  validates :password,
            format: {
              with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i,
              message: 'には英字と数字の両方を含めて設定してください'
            }

  # 名前・名前カナ・生年月日
  with_options presence: true do
    validates :last_name,
              format: {
                with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/,
                message: '全角文字を使用してください'
              }
    validates :first_name,
              format: {
                with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/,
                message: '全角文字を使用してください'
              }
    validates :last_name_kana,
              format: {
                with: /\A[ァ-ヶー]+\z/,
                message: '全角カタカナを使用してください'
              }
    validates :first_name_kana,
              format: {
                with: /\A[ァ-ヶー]+\z/,
                message: '全角カタカナを使用してください'
              }
    validates :birth_date
  end
end
