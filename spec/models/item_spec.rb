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
      it "商品名がないと出品情報は登録できない" do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("item_name can't be blank")
      end
      it "商品の説明がないと出品情報は登録できない" do
        @item.item_explain = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("item_explain can't be blank")
      end
      it "カテゴリーが選択されてないと出品情報は登録できない" do
        @item.item_category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("item_category_id can't be blank")
      end
      it "商品の状態が選択されてないと出品情報は登録できない" do
        @item.item_sales_status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("item_sales_status_id can't be blank")
      end
      it "配送料の負担が選択されてないと出品情報は登録できない" do
        @item.item_shipping_fee_status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("item_shipping_fee_status_id can't be blank")
      end
      it "発送元の地域が選択されてないと出品情報は登録できない" do
        @item.item_prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("item_prefecture_id can't be blank")
      end
      it "発送までの日数が選択されてないと出品情報は登録できない" do
        @item.item_scheduled_delivery_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("item_scheduled_delivery_id can't be blank")
      end
      it "値段が300より小さかった時に登録できないこと" do
        item = build(:item, price: 299)
        item.valid?
        expect(item.errors[:price]).to include("Out of setting range")
      end
      it "値段が9999999より大きかった時に登録できないこと" do
        item = build(:item, price: 10000000)
        item.valid?
        expect(item.errors[:price]).to include("Out of setting range")
      end
    end
  end
end