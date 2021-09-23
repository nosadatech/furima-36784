require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nickname、email、passwordとpassword_confirmation、lastname、firstname、lastname_kana、firstname_kana、birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが6文字以上でかつ半角英数字混合であれば登録できる' do
        @user.password = '12345a'
        @user.password_confirmation = '12345a'
        expect(@user).to be_valid
      end
      it 'emailに＠が含まれていれば登録できる' do
        @user.email = 'test@test.com'
        expect(@user).to be_valid
      end
      it 'lastnameが全角（漢字・ひらがな・カタカナ）であれば登録できる' do
        @user.lastname = '山かア'
        expect(@user).to be_valid
      end
      it 'firstnameが全角（漢字・ひらがな・カタカナ）であれば登録できる' do
        @user.firstname = '山かア'
        expect(@user).to be_valid
      end
      it 'lastname_kanaが全角（カタカナ）であれば登録できる' do
        @user.lastname_kana = 'ア'
        expect(@user).to be_valid
      end
      it 'firstname_kanaが全角（カタカナ）であれば登録できる' do
        @user.firstname_kana = 'ア'
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailに＠が含まれていない場合登録できない' do
        @user.email = 'testtest.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが半角数字のみでは登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
      end
      it 'passwordが半角英字のみでは登録できない' do
        @user.password = 'abcdef'
        @user.password_confirmation = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
      end

      it 'lastnameが空では登録できない' do
        @user.lastname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname can't be blank")
      end
      it 'lastnameが全角（漢字・ひらがな・カタカナ）でない場合登録できない' do
        @user.lastname = 'ｱｱｱ000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Lastname Input full-width characters')
      end

      it 'firstnameが空では登録できない' do
        @user.firstname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname can't be blank")
      end
      it 'firstnameが全角（漢字・ひらがな・カタカナ）でない場合登録できない' do
        @user.firstname = 'ｱｱｱ000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Firstname Input full-width characters')
      end

      it 'lastname_kanaが空では登録できない' do
        @user.lastname_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname kana can't be blank")
      end
      it 'lastname_kanaが全角（カタカナ）でない場合登録できない' do
        @user.lastname_kana = 'ｱｱｱ000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Lastname kana Input full-width katakana characters')
      end

      it 'firstname_kanaが空では登録できない' do
        @user.firstname_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname kana can't be blank")
      end
      it 'firstname_kanaが全角（カタカナ）でない場合登録できない' do
        @user.firstname_kana = 'ｱｱｱ000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Firstname kana Input full-width katakana characters')
      end

      it 'birthdayが空では登録できない' do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
