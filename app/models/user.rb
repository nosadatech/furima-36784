class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # has_many :items
  # has_many :orders

  with_options presence: true do
    validates :nickname
    validates :birthday
    # lastname,firstname 全角（漢字・ひらがな・カタカナ）
    with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/,
                           message: 'Input full-width characters' } do
      validates :lastname
      validates :firstname
    end
    # lastname_kana,firstname_kana 全角（カタカナ）
    with_options format: { with: /\A[ァ-ヶー－]+\z/,
                           message: 'Input full-width katakana characters' } do
      validates :lastname_kana
      validates :firstname_kana
    end
  end
  # password 半角英数字混合
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i,
                                 message: 'Include both letters and numbers' } do
  end
end

