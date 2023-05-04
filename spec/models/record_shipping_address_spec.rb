require 'rails_helper'

RSpec.describe RecordShippingAddress, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @record_shipping_address = FactoryBot.build(:record_shipping_address, user_id: @user.id, item_id: @item.id)
  end

  describe '商品購入' do
    context '商品が購入できる場合' do
      it 'post_code, sender_area_id, municipalities, address, building_name, telephone_numberが存在すれば保存できる' do
        expect(@record_shipping_address).to be_valid
      end
      it 'buildingは空でも保存できる' do
        @record_shipping_address.building_name = ''
        expect(@record_shipping_address).to be_valid
      end
    end

    context '商品が購入できない場合' do
      it 'post_codeが空だと保存できない' do
        @record_shipping_address.post_code = ''
        @record_shipping_address.valid?
        expect(@record_shipping_address.errors.full_messages).to include("Post code can't be blank")
      end
    it 'post_codeが3桁ハイフン4桁の半角文字列でないと保存できない' do
        @record_shipping_address.post_code = '1234567'
        @record_shipping_address.valid?
        expect(@record_shipping_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it 'sender_area_idが空だと保存できない' do
        @record_shipping_address.sender_area_id = ''
        @record_shipping_address.valid?
        expect(@record_shipping_address.errors.full_messages).to include("Sender area can't be blank")
      end
      it '都道府県に「---」が選択されている場合は保存できない' do
        @record_shipping_address.sender_area_id = '1'
        @record_shipping_address.valid?
        expect(@record_shipping_address.errors.full_messages).to include("Sender area can't be blank")
      end
      it 'municipalitiesが空だと保存できない' do
        @record_shipping_address.municipalities = ''
        @record_shipping_address.valid?
        expect(@record_shipping_address.errors.full_messages).to include("Municipalities can't be blank")
      end
     it 'addressが空だと保存できない' do
        @record_shipping_address.address = ''
        @record_shipping_address.valid?
        expect(@record_shipping_address.errors.full_messages).to include("Address can't be blank")
      end
      it 'telephone_numberが空だと保存できない' do
        @record_shipping_address.telephone_number = ''
        @record_shipping_address.valid?
        expect(@record_shipping_address.errors.full_messages).to include("Telephone number can't be blank")
      end
      it 'telephone_numberが9桁以下だと保存できない' do
        @record_shipping_address.telephone_number = '123456789'
        @record_shipping_address.valid?
        expect(@record_shipping_address.errors.full_messages).to include("Telephone number is too short (minimum is 10 characters)")
      end
      it 'telephone_numberが12桁以上だと保存できない' do
        @record_shipping_address.telephone_number = '123456789012'
        @record_shipping_address.valid?
        expect(@record_shipping_address.errors.full_messages).to include("Telephone number is too long (maximum is 11 characters)")
      end
      it 'telephone_numberが全角数値だと保存できない' do
        @record_shipping_address.telephone_number = '１２３６６７６８９０１'
        @record_shipping_address.valid?
        expect(@record_shipping_address.errors.full_messages).to include("Telephone number is not a valid number")
      end
      it 'userが紐づいていないと保存できない' do
        @record_shipping_address.user_id = nil
        @record_shipping_address.valid?
        expect(@record_shipping_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐づいていないと保存できない' do
        @record_shipping_address.item_id = nil
        @record_shipping_address.valid?
        expect(@record_shipping_address.errors.full_messages).to include("Item can't be blank")
      end
      it 'tokenが空だと保存できない' do
        @record_shipping_address.token = ''
        @record_shipping_address.valid?
        expect(@record_shipping_address.errors.full_messages).to include("Token can't be blank")
      end 

    end
  end
end