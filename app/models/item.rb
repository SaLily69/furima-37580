class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :product_category

  has_one_attached :image
  
  validates :product_name,         presence: true, unless: :was_attached?
  validates :product_text,         presence: true
  validates :product_category_id,  numericality: { other_than: 1 , message: "can't be blank"}
  validates :product_condition_id, presence: true
  validates :shipping_cost_id,     presence: true
  validates :prefecture_id,        presence: true
  validates :shipping_day_id,      presence: true
  validates :price,                presence: true

  def was_attached?
    self.image.attached?
  end

end
