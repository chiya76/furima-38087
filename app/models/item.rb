class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :days_to_ship

  validates :item_name, :string, presence: true, length: { maximum: 40 }
  validates :description, :text, presence: true, length: { maximum: 1000 }
  validates :price, :integer, presence: true, numericality: { in: 300..9999999 }
  
  validates :category_id, numericality: { other_than: 1, message: "can't be blank"}
  validates :status_id, numericality: { other_than: 1, message: "can't be blank"}
  validates :delivery_charge_id, numericality: { other_than: 1, message: "can't be blank"}
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank"}
  validates :days_to_ship_id, numericality: { other_than: 1, message: "can't be blank"}
end
