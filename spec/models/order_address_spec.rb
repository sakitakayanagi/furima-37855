require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
    sleep(0.1)
  end

  describe '商品の購入' do
    context "商品の購入ができる場合" do
      it "全ての条件を入力すると登録ができる" do
        expect(@order_address).to be_valid
      end
      it "buildingがなくても登録できる" do
        @order_address.building = ''
        expect(@order_address).to be_valid
      end
    end
    context "商品が購入できない場合" do
      it 'user_idが空だと登録できない' do
        @order_address.user_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空だと登録できない' do
        @order_address.item_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
      it "postal_codeが空では登録はできない" do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it "postal_codeがハイフンなしでは登録はできない" do
        @order_address.postal_code = '1111111'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it "item_prefecture_idが未選択では登録できない" do
        @order_address.item_prefecture_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item prefecture can't be blank")
      end
      it 'item_prefecture_idが1を選択しているとき' do
        @order_address.item_prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item prefecture can't be blank")
      end
      it "cityが空では登録できない" do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it "addressが空では登録できない" do
        @order_address.address = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address can't be blank")
      end
      it "phone_numberが空では登録できない" do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it "phone_numberが9文字以下では登録できない" do
        @order_address.phone_number = '000000000'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
      end
      it "phone_numberが12文字以上では登録できない" do
        @order_address.phone_number = '000000000000'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberが全角では登録できない' do
        @order_address.phone_number = '００００００００００'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
      end
      it "tokenが空では登録できないこと" do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
