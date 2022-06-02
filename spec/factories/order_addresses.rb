FactoryBot.define do
  factory :order_address do
        token {"tok_abcdefghijk00000000000000000"}
        postal_code { "111-1111" }
        item_prefecture_id { 13 }
        city { "木更津市" }
        address { "新田1-10-23" }
        building { "ラフィネ3 103" }
        phone_number { "00000000000" } 
  end
end