FactoryBot.define do
  factory :item do
    image {Faker::Lorem.sentence}
    item_name {"名前"}
    item_explain {"説明"}
    item_price {000}
    item_category {1}
    item_sales_status {1}
    item_shipping_fee_status {1}
    item_prefecture {1}
    item_scheduled_delivery {1}
    association :user
  end
end
