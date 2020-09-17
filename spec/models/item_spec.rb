require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('spec/fixture/sample_test.png')
    end

    it 'image,name,explanation,category_id,condition_id,postage_id,area_id,delivery_time_id,priceが存在すれば保存できること' do
      expect(@item).to be_valid
    end

    it 'imageが空だと保存できないこと' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it 'nameが空だと保存できないこと' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it 'explanationが空だと保存できないこと' do
      @item.explanation = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Explanation can't be blank")
    end

    it 'category_idの選択が--だと保存できないこと' do
      @item.category_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('Category must be other than 0')
    end

    it 'condition_idの選択が--だと保存できないこと' do
      @item.condition_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('Condition must be other than 0')
    end

    it 'postage_idの選択が--だと保存できないこと' do
      @item.postage_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('Postage must be other than 0')
    end

    it 'area_idの選択が--だと保存できないこと' do
      @item.area_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('Area must be other than 0')
    end

    it 'delivery_time_idの選択が--だと保存できないこと' do
      @item.delivery_time_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('Delivery time must be other than 0')
    end

    it 'priceが空だと保存できないこと' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not a number', 'Price is invalid')
    end

    it 'priceが299以下だと保存できないこと' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
    end

    it 'priceが9999999以上だと保存できないこと' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
    end
  end
end
