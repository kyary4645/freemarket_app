require 'rails_helper'
describe Item do
  describe '#create' do
    it "is valid with a name, status, derivery_fee, price, derivery_estimated, description,image,category,prefecture_id" do
      item = build(:item)
      expect(item).to be_valid
    end
    
    it "is invalid without a name" do
      item = build(:item, name: nil)
      item.valid?
      expect(item.errors[:name])to include("can't be blank")
    end

    it "is invalid without a status" do
      item = build(:item, status: nil)
      item.valid?
      expect(item.errors[:status])to include("can't be blank")
    end

    it "is invalid without a derivery_fee" do
      item = build(:item, derivery_fee: nil)
      item.valid?
      expect(item.errors[:derivery_fee])to include("can't be blank")
    end

    it "is invalid without a price" do
      item = build(:item, price: nil)
      item.valid?
      expect(item.errors[:price])to include("can't be blank")
    end

    it "is invalid without a derivery_estimated" do
      item = build(:item, derivery_estimated: nil)
      item.valid?
      expect(item.errors[:derivery_estimated])to include("can't be blank")
    end

    it "is invalid without a description" do
      item = build(:item, description: nil)
      item.valid?
      expect(item.errors[:description])to include("can't be blank")
    end

    it "is invalid without a image" do
      item = build(:item, image: nil)
      item.valid?
      expect(item.errors[:image])to include("can't be blank")
    end

    it "is invalid without a category" do
      item = build(:item, category: nil)
      item.valid?
      expect(item.errors[:category])to include("can't be blank")
    end

    it "is invalid without a prefecture_id" do
      item = build(:item, prefecture_id: nil)
      item.valid?
      expect(item.errors[:prefecture_id])to include("can't be blank")
    end
    
    # nameが40文字以上であれば登録できないこと
    it "is invalid with a name that has more than 40 characters " do
      user = build(:item, name: "111111111111111111111111111111111111111")
      user.valid?
      expect(item.errors[:name]).to include("is too long (maximum is 40 characters)")
    end

    # nameが40文字以下では登録できること
    it "is valid with a name that has less than 40 characters " do
      user = build(:item, name: "111111111111111111111111111111111111111")
      expect(item).to be_valid
    end

  
    
  end
end