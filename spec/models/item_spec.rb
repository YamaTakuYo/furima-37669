require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品情報の保存' do
    context '商品情報を保存できるとき' do
      it 'name、description、category_id、condition_id、prefecture_id、delivery_cost_id、delivery_date_id、price、imageが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品情報を保存できないとき' do
      it 'nameが空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名が空では登録できない")
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("金額が空では登録できない")
      end
      it 'descriptionが空では登録できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品説明が空では登録できない")
      end
      it 'category_idが空では登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーが空では登録できない")
      end
      it 'condition_idが空では登録できない' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態が空では登録できない")
      end
      it 'delivery_date_idが空では登録できない' do
        @item.delivery_date_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("発送日が空では登録できない")
      end
      it 'delivery_cost_idが空では登録できない' do
        @item.delivery_cost_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("送料が空では登録できない")
      end
      it 'prefecture_idが空では登録できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("都道府県が空では登録できない")
      end

      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("画像が空では登録できない")
      end
      it 'userが紐付いていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('ユーザーが紐付いていないと保存できない')
      end
      it 'category_idが"--"では登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('カテゴリーが"--"では登録できない')
      end
      it 'condition_idが"--"では登録できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('商品の状態が"--"では登録できない')
      end
      it 'prefecture_idが"--"では登録できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('都道府県が"--"では登録できない')
      end
      it 'delivery_cost_idが"--"では登録できない' do
        @item.delivery_cost_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('送料が"--"では登録できない')
      end
      it 'delivery_date_idが"--"では登録できない' do
        @item.delivery_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('発送日が"--"では登録できない')
      end
      it 'priceが299では登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('金額が299では登録できない')
      end
      it 'priceが100000000では登録できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('金額が100000000では登録できない')
      end
      it 'priceが全角数字では登録できない' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include('金額が全角数字では登録できない')
      end
      it 'priceが全角文字では登録できない' do
        @item.price = 'あああ'
        @item.valid?
        expect(@item.errors.full_messages).to include('金額が全角文字では登録できない')
      end
      it 'priceが半角英語では登録できない' do
        @item.price = 'aaaaa'
        @item.valid?
        expect(@item.errors.full_messages).to include('金額が半角英語では登録できない')
      end
      it 'priceが半角英数混合では登録できない' do
        @item.price = 'aa300'
        @item.valid?
        expect(@item.errors.full_messages).to include('金額が半角英数混合では登録できない')
      end
    end
  end
end
