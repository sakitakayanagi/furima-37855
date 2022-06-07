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
        expect(@item.errors.full_messages).to include("画像を入力してください")
      end     
      it "item_nameが空では登録できない" do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end
      it "item_explainが空では登録できない" do
        @item.item_explain = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の説明を入力してください")
      end
      it "item_category_idが未選択では登録できない" do
        @item.item_category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを選択してください")
      end
      it "item_sales_status_idが未選択では登録できない" do
        @item.item_sales_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("商品状態を選択してください")
      end
      it "item_shipping_fee_status_idが未選択では登録できない" do
        @item.item_shipping_fee_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担を選択してください")
      end
      it "item_prefecture_idが未選択では登録できない" do
        @item.item_prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元地域を選択してください")
      end
      it "item_scheduled_delivery_idが未選択では登録できない" do
        @item.item_scheduled_delivery_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数を選択してください")
      end
      it "item_priceが300より小さいと登録できない" do
        @item.item_price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("金額は300以上の値にしてください")
      end
      it "item_priceが9999999より大きいと登録できない" do
        @item.item_price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("金額は9999999以下の値にしてください")
      end
      it "item_priceが空では登録できない" do
        @item.item_price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("金額を入力してください")
      end
      it "item_priceが半角数字以外が含まれている場合は登録できない" do
        @item.item_price = "あ"
        @item.valid?
        expect(@item.errors.full_messages).to include("金額は数値で入力してください")
      end
      it 'ユーザーが紐付いていなければ登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Userを入力してください')
      end
    end
  end
end