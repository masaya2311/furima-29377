require 'rails_helper'

RSpec.describe UserItem, type: :model do
  describe '#create' do
    before do
      @order = FactoryBot.build(:user_item)
    end

    it 'post_code,prefecture_id,city,address,buildingname,phone_numberが存在すれば保存できること' do
      expect(@order).to be_valid
    end

    it 'post_codeがないと保存できないこと' do
      @order.post_code = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Post code can't be blank")
    end

    it 'post_codeはーがないと保存できないこと' do
      @order.post_code = '1234567'
      @order.valid?
      expect(@order.errors.full_messages).to include('Post code is invalid')
    end

    it 'prefeture_idがと保存できないこと' do
      @order.prefecture_id = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Prefecture can't be blank")
    end

    it 'cityがないと保存できないこと' do
      @order.city = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("City can't be blank")
    end

    it 'addressがないと保存できないこと' do
      @order.address = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Address can't be blank")
    end

    it 'phone_numberがないと保存できないこと' do
      @order.phone_number = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Phone number can't be blank")
    end

    it 'phone_numberが11けた以上だとと保存できないこと' do
      @order.phone_number = '123456789012'
      @order.valid?
      expect(@order.errors.full_messages).to include('Phone number is invalid')
    end
  end
end
