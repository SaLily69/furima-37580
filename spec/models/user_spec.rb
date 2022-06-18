require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nicknameとemail、passwordとpassword_confirmation、名字・名前、名字・名前のカナ入力、生年月日が存在すれば登録できる' do
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
      end
      it 'emailが空では登録できない' do
      end
      it '重複したemailが存在する場合は登録できない' do
      end
      it 'emailは@を含まないと登録できない'do
      end
      it 'passwordが空では登録できない' do
      end
      it 'passwordとpassword_confirmationが不一致では登録できない'do
      end
      it 'passwordが5文字以下では登録できない'do
      end
      it 'passwordは半角英数字混合でないと登録できない'do
      end
      it 'お名前の名字が空では登録できない'do
      end
      it 'お名前の名前が空では登録できない'do
      end
      it 'お名前の名字は全角（漢字・ひらがな・カタカナ）でないと登録できない'do
      end
      it 'お名前の名前は全角（漢字・ひらがな・カタカナ）でないと登録できない'do
      end
      it 'お名前の名字カナが空では登録できない'do
      end
      it 'お名前の名前カナが空では登録できない'do
      end
      it 'お名前の名字カナは全角（カタカナ）でないと登録できない'do
      end
      it 'お名前の名前カナは全角（カタカナ）でないと登録できない'do
      end
      it '生年月日が空では登録できない'do
      end
    end
  end
end
