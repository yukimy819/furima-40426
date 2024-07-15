require 'rails_helper'

RSpec.describe RecordAddress, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item, user_id: @user.id)
    @record_address = FactoryBot.build(:record_address, user_id: @user.id, item_id: @item.id)
  end 
  describe '購入履歴の保存' do

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@record_address).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @record_address.building_name = ''
        expect(@record_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postal_codeが空だと保存できないこと' do
        @record_address.postal_code = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @record_address.postal_code = '1234567'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it 'area_idを選択していないと保存できないこと' do
        @record_address.area_id = 1
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Area can't be blank")

      end
      it 'municipalityが空だと保存できないこと' do
        @record_address.municipality = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'street_addressが空だと保存できないこと' do
        @record_address.street_address = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Street address can't be blank")
      end
      it 'phone_numberが空だと保存できないこと' do
        @record_address.phone_number = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが9桁以下では保存できないこと' do
        @record_address.phone_number = '123456789'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include('Phone number is too short (minimum is 10 characters)')
      end
      it 'phone_numberが12桁以上では保存できないこと' do
        @record_address.phone_number = '123456789000'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberが半角数字でないと保存できないこと' do
        @record_address.phone_number = '１２３４５６７８９０'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include('Phone number is invalid')
      end
      it 'userが紐付いていないと保存できないこと' do
        @record_address.user_id = nil
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @record_address.item_id = nil
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Item can't be blank")
      end
      it 'tokenが空だと保存できないこと' do
        @record_address.token = nil
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end