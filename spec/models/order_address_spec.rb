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
        expect(@order_address.errors.full_messages).to include("ユーザーを入力してください")
      end
      it 'item_idが空だと登録できない' do
        @order_address.item_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("アイテムを入力してください")
      end
      it "postal_codeが空では登録はできない" do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("郵便番号を入力してください")
      end
      it "postal_codeがハイフンなしでは登録はできない" do
        @order_address.postal_code = '1111111'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("郵便番号にハイフン(-)を入れてください")
      end
      it "item_prefecture_idが未選択では登録できない" do
        @order_address.item_prefecture_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("都道府県を選択してください")
      end
      it 'item_prefecture_idが1を選択しているとき' do
        @order_address.item_prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("都道府県を選択してください")
      end
      it "cityが空では登録できない" do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("市区町村を入力してください")
      end
      it "addressが空では登録できない" do
        @order_address.address = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("番地を入力してください")
      end
      it "phone_numberが空では登録できない" do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("電話番号を入力してください")
      end
      it "phone_numberが9文字以下では登録できない" do
        @order_address.phone_number = '000000000'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("電話番号は不正な値です")
      end
      it "phone_numberが12文字以上では登録できない" do
        @order_address.phone_number = '000000000000'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("電話番号は不正な値です")
      end
      it 'phone_numberが全角では登録できない' do
        @order_address.phone_number = '００００００００００'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("電話番号は不正な値です")
      end
      it "tokenが空では登録できないこと" do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("カード情報を入力してください")
      end
    end
  end
end
