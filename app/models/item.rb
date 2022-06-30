class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :product_category
  belongs_to :product_condition
  belongs_to :shipping_cost
  belongs_to :prefecture
  belongs_to :shipping_day

  has_one_attached :image
  
  validates :image,                presence: true
  validates :product_name,         presence: true
  validates :product_text,         presence: true
  validates :product_category_id,  numericality: { other_than: 1 , message: "can't be blank"}
  validates :product_condition_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_cost_id,     numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id,        numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_day_id,      numericality: { other_than: 1 , message: "can't be blank"}

  validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  with_options presence: true, format: { with: /\A[0-9]+\z/} do
    validates :price
  end

  def was_attached?
    self.image.attached?
  end

  belongs_to :user

end
