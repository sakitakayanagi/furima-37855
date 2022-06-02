class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :item_prefecture_id, :city, :address, :building, :phone_number, :item_id, :user_id, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :address
    validates :phone_number, format: {with: /\A\d{10}\z|\A\d{11}\z/ , message: "is invalid"}
    validates :token
  end
  validates :item_prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    
    def save
      order = Order.create(user_id: user_id, item_id: item_id)
      ShippingAddress.create(postal_code: postal_code, item_prefecture_id: item_prefecture_id, city: city, address: address, building: building, phone_number: phone_number, order_id: order.id)
    end
end