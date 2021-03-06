require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nicknameとemail、passwordとpassword_confirmation、名字・名前、名字・名前のカナ入力、生年月日が存在すれば登録できる' do
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
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it 'emailは@を含まないと登録できない'do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordとpassword_confirmationが不一致では登録できない'do
        @user.password = '123abc'
        @user.password_confirmation = '123abcd'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが5文字以下では登録できない'do
        @user.password = '123ab'
        @user.password_confirmation = '123ab'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'passwordは半角数字のみでは登録できない'do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'passwordは半角英字のみでは登録できない'do
        @user.password = 'abcdef'
        @user.password_confirmation = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'passwordは全角文字を含むと登録できない'do
        @user.password = '１２３abc'
        @user.password_confirmation = '１２３abc'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it 'お名前の名字が空では登録できない'do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'お名前の名前が空では登録できない'do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'お名前の名字は全角（漢字・ひらがな・カタカナ）以外は登録できない'do
        @user.last_name = 'NAME'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end
      it 'お名前の名前は全角（漢字・ひらがな・カタカナ）以外は登録できない'do
        @user.first_name = '１２３４'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
      it 'お名前の名字カナが空では登録できない'do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it 'お名前の名前カナが空では登録できない'do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it 'お名前の名字カナは全角（カタカナ）でないと登録できない'do
        @user.last_name_kana = 'ﾊｼﾓﾄ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid")
      end
      it 'お名前の名前カナは全角（カタカナ）でないと登録できない'do
        @user.first_name_kana = 'なまえ'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end
      it '生年月日が空では登録できない'do
        @user.birth_day = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth day can't be blank")
      end
    end
  end
end
