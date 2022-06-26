require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品の出品' do
    context '商品の出品ができる場合' do
      it '必要な項目(画像・商品名・商品説明・商品カテゴリー・商品状態・配送料の負担・発送元地域・発送日数・価格)の入力で商品が出品できる' do
      end
    end
    context '商品の出品ができない場合' do
      it '画像が空では商品の出品ができない' do
      end
      it '商品名が空では商品の出品ができない' do
      end
      it '商品説明が空では商品の出品ができない' do
      end
      it '商品カテゴリーが空では商品の出品ができない' do
      end
      it '商品状態が空では商品の出品ができない' do
      end
      it '配送料負担が空では商品の出品ができない' do
      end
      it '発送元地域が空では商品の出品ができない' do
      end
      it '発送日数が空では商品の出品ができない' do
      end
      it '価格が空では商品の出品ができない' do
      end
      it '価格が300~9999999の範囲外では商品の出品ができない' do
      end
      it '価格が半角数字以外では商品の出品ができない' do
      end
    end
  end
end
