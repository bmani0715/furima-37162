require 'rails_helper'

RSpec.describe ItemOrder, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @item_order = FactoryBot.build(:item_order,user_id: user.id,item_id:item.id)
    sleep(1)
  end

  context '配送先情報の保存ができるとき' do
    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@item_order).to be_valid
    end
    it 'user_idが空でなければ保存できる' do
      @item_order.user_id = 1
      expect(@item_order).to be_valid
    end
    it 'item_idが空でなければ保存できる' do
      @item_order.item_id = 1
      expect(@item_order).to be_valid
    end
    it '郵便番号が「3桁＋ハイフン＋4桁」の組み合わせであれば保存できる' do
      @item_order.postal_code = '123-4567'
      expect(@item_order).to be_valid
    end
    it '都道府県が「--」以外かつ空でなければ保存できる' do
      @item_order.prefecture_id = 2
      expect(@item_order).to be_valid
    end
    it '市区町村が空でなければ保存できる' do
      @item_order.municipalities = '横浜市緑区'
      expect(@item_order).to be_valid
    end
    it '番地が空でなければ保存できる' do
      @item_order.block_number = '青山1-1-1'
      expect(@item_order).to be_valid
    end
    it '建物名が空でも保存できる' do
      @item_order.building_name = nil
      expect(@item_order).to be_valid
    end
    it '電話番号が10桁以上11桁以内の半角数値のみであれば保存できる' do
      @item_order.phone_number = 12345678900
      expect(@item_order).to be_valid
    end
  end

    context '配送先情報の保存ができないとき' do
    it '郵便番号が空だと購入ができない' do
      @item_order.postal_code = ""
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("Postal code can't be blank")
    end
    it '郵便番号にハイフンがないと登録できない' do
      @item_order.postal_code = "12345678"
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("Postal code Input correctly")
    end
    it '郵便番号が8桁でないと購入できない' do
      @item_order.postal_code = "1234567"
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("Postal code Input correctly")
    end
    it '郵便番号が半角数値でないと購入できない' do
      @item_order.postal_code = "１２３−４５６７"
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("Postal code Input correctly")
    end
    it 'prefecture_idが空だと購入できない' do
      @item_order.prefecture_id = nil
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("Prefecture can't be blank")
    end
    it 'prefecture_idに「--」が選択されている場合は購入できない' do
      @item_order.prefecture_id = 1
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("Prefecture Select")
    end
    it 'municipalitiesが空だと購入できない' do
      @item_order.municipalities = ""
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("Municipalities can't be blank")
    end
    it 'block_numberが空だと購入できない' do
      @item_order.block_number = ""
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("Block number can't be blank")
    end
    it 'phone_numberが空だと購入できない' do
      @item_order.phone_number = ""
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("Phone number can't be blank")
    end
    it 'phone_numberが半角数値のみでなければ購入できない' do
      @item_order.phone_number = "０８０１２３４５６７８９"
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("Phone number is invalid")
    end
    it 'phone_numberが10桁以上でなければ購入できない' do
      @item_order.phone_number = "123456789"
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("Phone number is invalid")
    end
    it 'phone_numberが12桁未満でなければ購入できない' do
      @item_order.phone_number = "123456789012"
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("Phone number is invalid")
    end
    it "tokenが空では登録できないこと" do
      @item_order.token = nil
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("Token can't be blank")
    end
    it 'userが紐付いていなければ購入できない' do
      @item_order.user_id = nil
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("User can't be blank")
    end
    it 'itemが紐付いていなければ購入できない' do
      @item_order.item_id = nil
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("Item can't be blank")
    end
  end
end
