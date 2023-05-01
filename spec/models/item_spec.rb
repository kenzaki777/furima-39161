require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品が出品できる場合' do
      it 'item_name,concept,price,item_type_id,item_condition_id,sender_area_id,days_ship_id,cost_type_id,imageが存在していれば保存できる' do
        expect(@item).to be_valid
      end
    end
    context '商品が出品できない場合' do
      it 'item_nameが空では保存できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it 'conceptが空では保存できない' do
        @item.concept = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Concept can't be blank")
      end
      it 'priceが空では保存できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが半角数値以外では保存できない' do
        @item.price = '１５０００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a valid price")
      end
      it 'priceが300未満では保存できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a valid price")
      end
      it 'priceが10000000以上では保存できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a valid price")
      end
      it 'item_type_idが1(表記：---)では保存できない' do
        @item.item_type_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item type can't be blank")
      end
      it 'item_condition_idが1(表記：---)では保存できない' do
        @item.item_condition_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item condition can't be blank")
      end
      it 'sender_area_idが1(表記：---)では保存できない' do
        @item.sender_area_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Sender area can't be blank")
      end
      it 'days_ship_idが1(表記：---)では保存できない' do
        @item.days_ship_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Days ship can't be blank")
      end
      it 'cost_typeが1(表記：---)では保存できない' do
        @item.cost_type_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Cost type can't be blank")
      end
      it 'userが紐付いていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
      it 'imageが空では保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      
    end
  end
end
