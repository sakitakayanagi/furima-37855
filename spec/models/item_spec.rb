require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '出品情報の登録' do
    context "出品情報を登録できる場合" do
      it "全ての条件を入力すると登録ができる" do
        expect(@item).to be_valid
      end
    end
    context "出品情報が登録できない場合" do
      it "画像がないと出品情報は登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end     
      it "item_nameが空では登録できない" do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it "item_explainが空では登録できない" do
        @item.item_explain = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item explain can't be blank")
      end
      it "item_category_idが未選択では登録できない" do
        @item.item_category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Item category can't be blank")
      end
      it "item_sales_status_idが未選択では登録できない" do
        @item.item_sales_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Item sales status can't be blank")
      end
      it "item_shipping_fee_status_idが未選択では登録できない" do
        @item.item_shipping_fee_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Item shipping fee status can't be blank")
      end
      it "item_prefecture_idが未選択では登録できない" do
        @item.item_prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Item prefecture can't be blank")
      end
      it "item_scheduled_delivery_idが未選択では登録できない" do
        @item.item_scheduled_delivery_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Item scheduled delivery can't be blank")
      end
      it "item_priceが300より小さいと登録できない" do
        @item.item_price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price Out of setting range")
      end
      it "item_priceが9999999より大きいと登録できない" do
        @item.item_price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price Out of setting range")
      end
      
    end
  end
end