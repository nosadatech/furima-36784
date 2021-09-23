FactoryBot.define do
  factory :user do
    nickname              { 'test' }
    email                 { Faker::Internet.free_email }
    password              { '12345a' }
    password_confirmation { password }
    lastname              { 'テスト' }
    firstname             { 'テスト' }
    lastname_kana         { 'テスト' }
    firstname_kana        { 'テスト' }
    birthday              { '2001-01-01' }
  end
end
