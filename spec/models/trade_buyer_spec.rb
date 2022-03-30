require 'rails_helper'

RSpec.describe TradeBuyer, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @trade_buyer = FactoryBot.build(:trade_buyer, user_id: user.id, item_id: item.id)
    sleep 0.1
  end

  describe '商品購入情報の保存' do
    context '商品購入情報を保存できるとき' do
      it '全ての値が正しく入力されていれば保存できる' do
        expect(@trade_buyer).to be_valid
      end
      it 'buildingは空でも保存できる' do
        @trade_buyer.building = ''
        expect(@trade_buyer).to be_valid
      end
    end

    context '商品購入情報を保存できないとき' do
      it 'user_idが空だと保存できない' do
        @trade_buyer.user_id = ' '
        @trade_buyer.valid?
        expect(@trade_buyer.errors.full_messages).to include("ユーザーが空だと保存できない")
      end
      it 'item_idが空だと保存できない' do
        @trade_buyer.item_id = ' '
        @trade_buyer.valid?
        expect(@trade_buyer.errors.full_messages).to include("商品が空だと保存できない")
      end
      it 'postal_codeが空では保存できない' do
        @trade_buyer.postal_code = ''
        @trade_buyer.valid?
        expect(@trade_buyer.errors.full_messages).to include("郵便番号が空では保存できない")
      end
      it 'prefecture_idが空では保存できない' do
        @trade_buyer.prefecture_id = ''
        @trade_buyer.valid?
        expect(@trade_buyer.errors.full_messages).to include("都道府県が空では保存できない")
      end
      it 'cityが空では保存できない' do
        @trade_buyer.city = ''
        @trade_buyer.valid?
        expect(@trade_buyer.errors.full_messages).to include("市町村名が空では保存できない")
      end
      it 'addressが空では保存できない' do
        @trade_buyer.address = ''
        @trade_buyer.valid?
        expect(@trade_buyer.errors.full_messages).to include("番地が空では保存できない")
      end
      it 'phone_numberが空では保存できない' do
        @trade_buyer.phone_number = ''
        @trade_buyer.valid?
        expect(@trade_buyer.errors.full_messages).to include("電話番号rが空では保存できない")
      end
      it 'postal_codeはハイフンがないと保存できない' do
        @trade_buyer.postal_code = '1234567'
        @trade_buyer.valid?
        expect(@trade_buyer.errors.full_messages).to include('郵便番号はハイフンがないと保存できない')
      end
      it 'postal_codeは半角英数混合では保存できない' do
        @trade_buyer.postal_code = '123-abcd'
        @trade_buyer.valid?
        expect(@trade_buyer.errors.full_messages).to include('郵便番号は半角英数混合では保存できない')
      end
      it 'postal_codeは全角では保存できない' do
        @trade_buyer.postal_code = '１２３-４５６７'
        @trade_buyer.valid?
        expect(@trade_buyer.errors.full_messages).to include('郵便番号は全角では保存できない')
      end
      it 'prefecture_idは選択していないと保存できない' do
        @trade_buyer.prefecture_id = 1
        @trade_buyer.valid?
        expect(@trade_buyer.errors.full_messages).to include('都道府県は選択していないと保存できない')
      end
      it 'phone_numberは12桁の数字では保存できない' do
        @trade_buyer.phone_number = '090123456789'
        @trade_buyer.valid?
        expect(@trade_buyer.errors.full_messages).to include('電話番号は12桁の数字では保存できない')
      end
      it 'phone_numberは9桁の数字では保存できない' do
        @trade_buyer.phone_number = '090123456'
        @trade_buyer.valid?
        expect(@trade_buyer.errors.full_messages).to include('電話番号は9桁の数字では保存できない')
      end
      it 'phone_numberは半角英数混合では保存できない' do
        @trade_buyer.phone_number = 'abc123456789'
        @trade_buyer.valid?
        expect(@trade_buyer.errors.full_messages).to include('電話番号は半角英数混合では保存できない')
      end
      it 'phone_numberは全角では保存できない' do
        @trade_buyer.phone_number = '０９０１２３４５６７８'
        @trade_buyer.valid?
        expect(@trade_buyer.errors.full_messages).to include('電話番号は全角では保存できない')
      end
      it 'tokenが空では保存できない' do
        @trade_buyer.token = ' '
        @trade_buyer.valid?
        expect(@trade_buyer.errors.full_messages).to include("クレジットカードが空では保存できない")
      end
    end
  end
end
