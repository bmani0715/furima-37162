class ItemOrder
  include ActiveModel::Model
  attr_accessor :token, :postal_code, :prefecture_id, :municipalities, :block_number, :building_name, :phone_number, :item_id, :user_id

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :municipalities
    validates :block_number
    validates :phone_number, format: { with: /\A[0-9]{11}\z/, message: 'is invalid' }
    validates :token
  end

    def save
      Address.create(postal_code: postal_code, prefecture_id: prefecture_id, municipalities: municipalities, block_number: block_number, building_name: building_name, phone_number: phone_number)
      Order.create(user_id: user_id, item_id: item_id)
    end
end