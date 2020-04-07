FactoryBot.define do

  factory :item do
    name            {"服"}
    price           {800}
    text            {"春にぴったりシャツです"}
    size            {"M"}
    prefecture_id   {1}
    deliveryfee_id  {1}
    deliveryday_id  {1}
    status_id       {1}
    user_id         {1}
    category_id     {1}
    condition       {1}
    after(:build) do |item|                          
      item.images << build(:image, item: item) 
    end    
  end
  
end