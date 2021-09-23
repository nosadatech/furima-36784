class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # has_many :items
  # has_many :orders

  validates :nickname, :birthday, presence: true

  # password 半角英数字混合
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'Include both letters and numbers' }

  # lastname,firstname 全角（漢字・ひらがな・カタカナ）
  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'Input full-width characters' } do
    validates :lastname
    validates :firstname
  end

  # lastname_kana,firstname_kana 全角（カタカナ）
  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'Input full-width katakana characters' } do
    validates :lastname_kana
    validates :firstname_kana
  end
end
