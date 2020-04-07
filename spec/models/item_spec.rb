require 'rails_helper'

describe Item do
  # let(:images_path) { File.join(Rails.root, 'spec/fixtures/test.jpg') }
  # let(:images) { Rack::Test::UploadedFile.new(images_path) }
  describe '#create' do

    it "全て入力すると登録できる" do
      item = create(:item)
      expect(item).to be_valid
    end

    it "nameが空だと登録できない" do
      item = build(:item, name: "")
      item.valid?
      expect(item.errors[:name]).to include("can't be blank")
    end

    it "priceが空だと登録できない" do
      item = build(:item, price: "")
      item.valid?
      expect(item.errors[:price]).to include("can't be blank")
    end

    it "textが空だと登録できない" do
      item = build(:item, text: "")
      item.valid?
      expect(item.errors[:text]).to include("can't be blank")
    end

    it "sizeが空だと登録できない" do
      item = build(:item, size: "")
      item.valid?
      expect(item.errors[:size]).to include("can't be blank")
    end

    it "prefectureが空だと登録できない" do
      item = build(:item, prefecture_id: "")
      item.valid?
      expect(item.errors[:prefecture_id]).to include("can't be blank")
    end

    it "deliveryfeeが空だと登録できない" do
      item = build(:item, deliveryfee_id: "")
      item.valid?
      expect(item.errors[:deliveryfee_id]).to include("can't be blank")
    end

    it "deliverydayが空だと登録できない" do
      item = build(:item, deliveryday_id: "")
      item.valid?
      expect(item.errors[:deliveryday_id]).to include("can't be blank")
    end

    it "statusが空だと登録できない" do
      item = build(:item, status_id: "")
      item.valid?
      expect(item.errors[:status_id]).to include("can't be blank")
    end

    it "user_idが空だと登録できない" do
      item = build(:item, user_id: "")
      item.valid?
      expect(item.errors[:user_id]).to include("can't be blank")
    end

    it "category_idが空だと登録できない" do
      item = build(:item, category_id: "")
      item.valid?
      expect(item.errors[:category_id]).to include("can't be blank")
    end

    it "conditionが空だと登録できない" do
      item = build(:item, condition: "")
      item.valid?
      expect(item.errors[:condition]).to include("can't be blank")
    end

  end
end