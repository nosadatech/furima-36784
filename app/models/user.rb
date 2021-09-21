class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


# has_many :items
# has_many :orders

  validates :nickname, :lastname, :firstname, :lastname_kana, :firstname_kana, :birthday, presence: true

end