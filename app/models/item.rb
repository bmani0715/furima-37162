class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  #has_one :order
  has_one_attached :image
  belongs_to_active_hash :category
  belongs_to_active_hash :product_condition
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :days_to_ship

  #with_options presence: true do
  #  validates :product_name, :description,:image
    
  #  with_options numericality: { other_than: 1 } do
  #    validates :category_id, :product_condition_id, :delivery_fee_id, :prefecture_id, :days_to_ship_id
  #  end


  with_options presence: true do
    validates :image
    validates :product_name
    validates :description
    validates :category_id
    validates :product_condition_id
    validates :delivery_fee_id
    validates :prefecture_id
    validates :days_to_ship_id
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999}
  end

  with_options numericality: { other_than: 1 , message: "can't be blank"} do
    validates :category_id
    validates :prefecture_id
    validates :product_condition_id
    validates :delivery_fee_id
    validates :days_to_ship_id
  end

end
