require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "会員情報入力" do
    context '新規登録できる場合' do
      it "nickname、email、passwordとpassword_confirmation、last_name、first_name、last_name_kana、first_name_kana、birth_dateが存在すれば登録できる" do
        expect(@user).to be_valid
      end
    end
      it 'passwordが半角英数混合であれば登録できる' do
        expect(@user).to be_valid
      end
    context '新規登録できない場合' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      it "emailが空では登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it "passwordが空では登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールは不正な値です')
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end
      it 'passwordが129文字以上では登録できない' do
        @user.password =  Faker::Internet.password(min_length: 129)
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは128文字以内で入力してください')
      end
      it "passwordは半角英数を両方含む必要があります(英字のみ)" do
        @user.password = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは半角英数を両方含む必要があります")
      end
      it "passwordは半角英数を両方含む必要があります(数字のみ)" do
        @user.password = "111111"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは半角英数を両方含む必要があります")
      end
      it "passwordは半角英数を両方含む必要があります(全角のみ)" do
        @user.password = "aaaa1Ａ"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは半角英数を両方含む必要があります")
      end
      it "last_nameが空では登録できない" do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字を入力してください")
      end
      it "first_nameが空では登録できない" do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前を入力してください")
      end
      it "last_name_kanaが空では登録できない" do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字(カナ)を入力してください")
      end
      it "first_name_kanaが空では登録できない" do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前(カナ)を入力してください")
      end
      it "birth_dateが空では登録できない" do
        @user.birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("誕生日を入力してください")
      end
    end
  end
end
