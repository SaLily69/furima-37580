require 'rails_helper'

RSpec.describe PurchaseShipping, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchase_shipping = FactoryBot.build(:purchase_shipping, user_id: user.id, item_id: item.id)
  end

  context '内容に問題ない場合' do
    it "配送先の必須項目とtokenがあれば購入できること" do
      expect(@purchase_shipping).to be_valid
    end
    it "house_numberは空でも購入できること" do
      @purchase_shipping.house_number = ''
      expect(@purchase_shipping).to be_valid
      sleep(1)
    end
  end

  context '内容に問題ある場合' do
    it "tokenが空では購入できないこと" do
      @purchase_shipping.token = nil
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("Token can't be blank")
      sleep(1)
    end
    it "post_numberが空では購入できないこと" do
      @purchase_shipping.post_number = ''
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("Post number can't be blank")
      sleep(1)
    end
    it "post_numberはハイフン無しのの半角文字列では購入できないこと" do
      @purchase_shipping.post_number = '1234567'
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("Post number is invalid. Include hyphen(-)")
      sleep(1)
    end
    it "prefecture_idが空では購入できないこと" do
      @purchase_shipping.prefecture_id = ''
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("Prefecture can't be blank")
      sleep(1)
    end
    it "prefecture_idに「---」が選択されていると購入できないこと" do
      @purchase_shipping.prefecture_id = '0'
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("Prefecture can't be blank")
      sleep(1)
    end
    it "cityが空では購入できないこと" do
      @purchase_shipping.city = ''
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("City can't be blank")
      sleep(1)
    end
    it "addressが空では購入できないこと" do
      @purchase_shipping.address = ''
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("Address can't be blank")
      sleep(1)
    end
    it "telが空では購入できないこと" do
      @purchase_shipping.tel = ''
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("Tel can't be blank")
      sleep(1)
    end
    it "telはハイフンを含めると登録できないこと" do
      @purchase_shipping.tel = '090-1234-5678'
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("Tel is not a number")
      sleep(1)
    end
    it "telは9桁以下だと登録できないこと" do
      @purchase_shipping.tel = '01234567'
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("Tel is too short (minimum is 10 characters)")
      sleep(1)
    end
    it "telは12桁以上だと登録できないこと" do
      @purchase_shipping.tel = '012345678910'
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("Tel is too long (maximum is 11 characters)")
      sleep(1)
    end
    it "itemが紐づいていないと購入できないこと" do
      @purchase_shipping.item_id = nil
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("Item can't be blank")
    end
    it "userが紐づいていないと購入できないこと" do
      @purchase_shipping.user_id = nil
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("User can't be blank")
    end
  end

end
