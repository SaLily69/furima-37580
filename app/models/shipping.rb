class Shipping < ApplicationRecord
  belongs_to :purchase
  validates :purchase_id, presence: true
end
