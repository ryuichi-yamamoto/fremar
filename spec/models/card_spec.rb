require 'rails_helper'

describe Card do
  describe '#create' do

    it "全て入力すると登録できる" do
      card = create(:card)
      expect(card).to be_valid
    end

    it "card_idがないと登録できない" do
      card = build(:card, card_id: "")
      card.valid?
      expect(card.errors[:card_id]).to include("can't be blank")
    end

    it "customer_idがないと登録できない" do
      card = build(:card, customer_id: "")
      card.valid?
      expect(card.errors[:customer_id]).to include("can't be blank")
    end

    it "user_idがないと登録できない" do
      card = build(:card, user_id: "")
      card.valid?
      expect(card.errors[:user_id]).to include("can't be blank")
    end

  end
end
