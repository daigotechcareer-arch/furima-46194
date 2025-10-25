# spec/models/item_spec.rb
require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  context '商品を出品できないとき' do
    # 〜前略〜

    it 'カテゴリーが未選択（idが1）では保存できない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank") # ← 修正
    end

    it '商品の状態が未選択（idが1）では保存できない' do
      @item.condition_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition can't be blank") # ← 修正
    end

    it '配送料の負担が未選択（idが1）では保存できない' do
      @item.shipping_charge_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping charge can't be blank") # ← 修正
    end

    it '発送元の地域が未選択（idが1）では保存できない' do
      @item.prefecture_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture can't be blank") # ← 修正
    end

    it '発送までの日数が未選択（idが1）では保存できない' do
      @item.days_to_ship_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Days to ship can't be blank") # ← 修正
    end

    it '価格が300未満では保存できない' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is out of setting range') # ← 修正
    end

    it '価格が10,000,000以上では保存できない' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is out of setting range') # ← 修正
    end

    it '価格が全角では保存できない' do
      @item.price = '１０００'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is out of setting range') # ← 修正
    end
  end
end
