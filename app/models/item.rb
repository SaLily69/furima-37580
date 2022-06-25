class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :product_category
  belongs_to :product_condition
  belongs_to :shipping_cost
  belongs_to :prefecuture
  belongs_to :shipping_day

  has_one_attached :image
  
  validates :product_name,         presence: true, unless: :was_attached?
  validates :product_text,         presence: true
  validates :product_category_id,  numericality: { other_than: 1 , message: "can't be blank"}
  validates :product_condition_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_cost_id,     numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id,        numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_day_id,      numericality: { other_than: 1 , message: "can't be blank"}

  with_options presence: true, numericality:{in:300..9999999}, format: { with: /\A[0-9]+\z/} do
    validates :price
  end

  def was_attached?
    self.image.attached?
  end

end
