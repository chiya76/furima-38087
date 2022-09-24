class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :days_to_ship

  validates :item_name, :string, presence: true
  validates :description, :text, presence: true
  validates :price, :integer, presence: true
  
  validates :category_id, numercality: { other_than: 1, message: "can't be blank"}
  validates :status_id, numercality: { other_than: 1, message: "can't be blank"}
  validates :delivery_charge_id, numercality: { other_than: 1, message: "can't be blank"}
  validates :prefecture_id, numercality: { other_than: 1, message: "can't be blank"}
  validates :days_to_ship_id, numercality: { other_than: 1, message: "can't be blank"}
end
