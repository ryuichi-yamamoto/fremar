require 'rails_helper'

describe User do
  describe '#create' do

    it "全て入力すると登録できる" do
      user = create(:user)
      expect(user).to be_valid
    end

    it "nicknameが空だと登録できない" do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end

    it "first_nameが空だと登録できない" do
      user = build(:user, first_name: "")
      user.valid?
      expect(user.errors[:first_name]).to include("can't be blank")
    end

    it "last_nameが空だと登録できない" do
      user = build(:user, last_name: "")
      user.valid?
      expect(user.errors[:last_name]).to include("can't be blank")
    end

    it "first_name_hiraganaが空だと登録できない" do
      user = build(:user, first_name_hiragana: "")
      user.valid?
      expect(user.errors[:first_name_hiragana]).to include("can't be blank")
    end

    it "last_name_hiraganaが空だと登録できない" do
      user = build(:user, last_name_hiragana: "")
      user.valid?
      expect(user.errors[:last_name_hiragana]).to include("can't be blank")
    end

    it "birth_yearが空だと登録できない" do
      user = build(:user, birth_year: "")
      user.valid?
      expect(user.errors[:birth_year]).to include("can't be blank")
    end

    it "birth_monthが空だと登録できない" do
      user = build(:user, birth_month: "")
      user.valid?
      expect(user.errors[:birth_month]).to include("can't be blank")
    end

    it "birth_dayが空だと登録できない" do
      user = build(:user, birth_day: "")
      user.valid?
      expect(user.errors[:birth_day]).to include("can't be blank")
    end

    it "passwordが空だと登録できない" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    it "password_confirmationが空だと登録できない" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    it "emailが空だと登録できない" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it "statusが空だと登録できない" do
      user = build(:user, status: "")
      user.valid?
      expect(user.errors[:status]).to include("can't be blank")
    end



  end
end