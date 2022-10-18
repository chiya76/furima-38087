class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture, :municipality, :address, :building_name, :phone_number, :token

  with_options presence: true do
    validates :token
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :user_id, :item_id, :municipality, :address
    validates :phone_number, format: {with: /\d{10,11}/, message: "is invalid"}, length: {maximum: 11, message: "is invalid"}
  end
  validates :prefecture, numericality: {other_than: 0, message: "can't be blank"}

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, prefecture_id: prefecture, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end