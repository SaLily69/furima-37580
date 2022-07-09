class PurchaseShipping
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :post_number, :prefecture_id, :city, :address, :house_number, :tel, :purchase_id

  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :post_number, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :address
    validates :tel, numericality: { only_integer: true }, length: { in: 10..11 }
    validates :purchase_id
    validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}
  end

  def save
    purchase = Purchase.create(item_id: @item_id, user_id: current_user.id)
    Shipping.create(post_number: post_number, prefecture_id: prefecture_id, city: city, address: address, house_number: house_number, tel: tel, purchase_id: purchase.id)
  end
end