class Item < ApplicationRecord
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_category
  belongs_to :item_sales_status
  belongs_to :item_shipping_fee_status
  belongs_to :item_prefecture
  belongs_to :item_scheduled_delivery
  validates :item_name, :item_explain, :item_price, presence: true
  validates :item_category_id, :item_sales_status_id, :item_shipping_fee_status_id, :item_prefecture_id, :item_scheduled_delivery_id,
            numericality: { other_than: 1 , message: "を選択してください" } 
  validates :image, presence: true
  validates :item_price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 },
                         presence: { message: "を選択してください" }
  belongs_to :user
  has_one :order
end