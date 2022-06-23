class Item < ApplicationRecord
  validates :product_name,         presence: true
  validates :product_text,         presence: true
  validates :product_category_id,  presence: true
  validates :product_condition_id, presence: true
  validates :shipping_cost_id,     presence: true
  validates :prefecture_id,        presence: true
  validates :shipping_day_id,      presence: true
  validates :price,                presence: true

end
