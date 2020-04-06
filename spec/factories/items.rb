FactoryBot.define do

  factory :item do
    name         {"服"}
    price        {"800"}
    text         {"春にぴったりシャツです"}
    size         {"M"}
    prefecture   {"1"}
    deliveryfee  {"1"}
    deliveryday  {"1"}
    status       {"1"}
    user_id      {"1"}
    category_id  {"1"}
    condition    {"1"}
    # images       { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test.jpg')) }
  end

end