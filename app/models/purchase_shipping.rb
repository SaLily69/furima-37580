class PurchaseShipping
  include Active::Model
  attr_accessor :post_number, :prefecture_id, :city, :address, :house_number, :tel, :purchase_id

  validates :post_number,  presence: true
  validates :city,         presence: true
  validates :address,      presence: true
  validates :tel,          presence: true
  validates :purchase_id,  presence: true
  validates :prefecture,   numericality: {other_than: 0, message: "can't be blank"}

  def save
    purchase = Purchase.create(item_id: item_id, user_id: current_user.id)
    Shippind.create(post_number: post_number, prefecture_id: prefecture_id, city: city, address: address, house_number: house_number, tel: tel, purchase_id: purchase_id)
  end
end