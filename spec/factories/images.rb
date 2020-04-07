FactoryBot.define do

  factory :image do
    image   {File.open("#{Rails.root}/spec/fixtures/test.jpg")}
    item
  end

end