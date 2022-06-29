require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品の出品' do
    context '商品の出品ができる場合' do
      it '必要な項目(画像・商品名・商品説明・商品カテゴリー・商品状態・配送料の負担・発送元地域・発送日数・価格)の入力で商品が出品できる' do
        expect(@item).to be_valid
      end
    end
    context '商品の出品ができない場合' do
      it '画像が空では商品の出品ができない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空では商品の出品ができない' do
        @item.product_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product name can't be blank")
      end
      it '商品説明が空では商品の出品ができない' do
        @item.product_text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product text can't be blank")
      end
      it '商品カテゴリーが空では商品の出品ができない' do
        @item.product_category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product category can't be blank")
      end
      it '商品状態が空では商品の出品ができない' do
        @item.product_condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product condition can't be blank")
      end
      it '配送料負担が空では商品の出品ができない' do
        @item.shipping_cost_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping cost can't be blank")
      end
      it '発送元地域が空では商品の出品ができない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '発送日数が空では商品の出品ができない' do
        @item.shipping_day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day can't be blank")
      end
      it '商品カテゴリーに「---」が選択されている場合は出品できない'do
        @item.product_category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Product category can't be blank")
      end
      it '商品状態に「---」が選択されている場合は出品できない'do
        @item.product_condition_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Product condition can't be blank")
      end
      it '配送料の負担に「---」が選択されている場合は出品できない'do
        @item.shipping_cost_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping cost can't be blank")
      end
      it '発送元の地域に「---」が選択されている場合は出品できない'do
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '発送までの日数に「---」が選択されている場合は出品できない'do
        @item.shipping_day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day can't be blank")
      end
      it '価格が空では商品の出品ができない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格が300以下では商品の出品ができない' do
        @item.price = '100'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it '価格が9999999以上では商品の出品ができない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it '価格が半角数字以外では商品の出品ができない' do
        @item.price = '５５５'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it 'userが紐づいていなければ出品できない'do
        @item.user_id = nil
        @item.valid?
        binding.pry
        expect(@item.errors.full_messages).to include("")
      end
    end
  end
end
