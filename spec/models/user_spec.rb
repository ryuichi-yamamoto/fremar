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

    it "nicknameが40文字を超えると登録できない" do
      user = build(:user, nickname: "a" * 41)
      user.valid?
      expect(user.errors[:nickname]).to include("is too long (maximum is 40 characters)")
    end

    it "nicknameが40文字以内だと登録できる" do
      user = create(:user, nickname: "a" * 40)
      expect(user).to be_valid
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

    it "first_nameに「ひらがな、カタカナ、漢字」以外は登録できない" do
      user = build(:user, first_name: ['A', '1', '@'])
      user.valid?
      expect(user.errors[:first_name]).to include("no")
    end

    it "first_nameが「ひらがな、カタカナ、漢字」だと登録できる" do
      user = create(:user, first_name: "亜あア")
      expect(user).to be_valid
    end

    it "last_nameに「ひらがな、カタカナ、漢字」以外は登録できない" do
      user = build(:user, last_name: ['A', '1', '@'])
      user.valid?
      expect(user.errors[:last_name]).to include("no")
    end

    it "last_nameが「ひらがな、カタカナ、漢字」だと登録できる" do
      user = create(:user, last_name: "亜あア")
      expect(user).to be_valid
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

    it "first_name_hiraganaに「ひらがな」以外は登録できない" do
      user = build(:user, first_name_hiragana: ['A', '1', '@', 'ア', '亜'])
      user.valid?
      expect(user.errors[:first_name_hiragana]).to include("is must NOT contain any other characters than alphanumerics.")
    end

    it "first_name_hiraganaが「ひらがな」だと登録できる" do
      user = build(:user, first_name_hiragana: "あいうえお")
      expect(user).to be_valid
    end

    it "last_name_hiraganaに「ひらがな」以外は登録できない" do
      user = build(:user, first_name_hiragana: ['A', '1', '@', 'ア', '亜'])
      user.valid?
      expect(user.errors[:first_name_hiragana]).to include("is must NOT contain any other characters than alphanumerics.")
    end

    it "last_name_hiraganaが「ひらがな」だと登録できる" do
      user = build(:user, last_name_hiragana: "あいうえお")
      expect(user).to be_valid
    end

    it "birth_yearが空だと登録できない" do
      user = build(:user, birth_year: "")
      user.valid?
      expect(user.errors[:birth_year]).to include("can't be blank")
    end

    it "birth_yearが4桁以外は登録できない" do
      user = build(:user, birth_year: [1, 11, 111, 11111])
      user.valid?
      expect(user.errors[:birth_year]).to include("no")
    end

    it "birth_yearが4桁のみ登録できる" do
      user = build(:user, birth_year: 1111)
      expect(user).to be_valid
    end

    it "birth_monthが空だと登録できない" do
      user = build(:user, birth_month: "")
      user.valid?
      expect(user.errors[:birth_month]).to include("can't be blank")
    end

    it "birth_monthが2桁以外は登録できない" do
      user = build(:user, birth_month: [1, 111, 1111])
      user.valid?
      expect(user.errors[:birth_month]).to include("no")
    end

    it "birth_monthが2桁のみ登録できる" do
      user = build(:user, birth_month: 11)
      expect(user).to be_valid
    end

    it "birth_dayが空だと登録できない" do
      user = build(:user, birth_day: "")
      user.valid?
      expect(user.errors[:birth_day]).to include("can't be blank")
    end

    it "birth_dayが2桁以外は登録できない" do
      user = build(:user, birth_day: [1, 111, 1111])
      user.valid?
      expect(user.errors[:birth_day]).to include("no")
    end

    it "birth_dayが2桁のみ登録できる" do
      user = build(:user, birth_day: 11)
      expect(user).to be_valid
    end

    it "passwordが空だと登録できない" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    it "passwordが7桁以下だと登録できない" do
      user = build(:user, password: "a" * 6, password_confirmation: "a" * 6)
      user.valid?
      expect(user.errors[:password]).to include("is too short (minimum is 7 characters)")
    end

    it "passwordが7桁以上だと登録できる" do
      user = create(:user, password: "a" * 7, password_confirmation: "a" * 7)
      expect(user).to be_valid
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

    it "emailに一意性制約がかかっているか" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end

    it "statusが空だと登録できない" do
      user = build(:user, status: "")
      user.valid?
      expect(user.errors[:status]).to include("can't be blank")
    end



  end
end