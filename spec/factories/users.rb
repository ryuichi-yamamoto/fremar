FactoryBot.define do

  factory :user do
    nickname               {"ラシエモン"}
    first_name             {"寺嶋"}
    last_name              {"誠"}
    first_name_hiragana    {"てらしま"}
    last_name_hiragana     {"まこと"}
    birth_year             {"1991"}
    birth_month            {"10"}
    birth_day              {"26"}
    password               {"aaaaaaa"}
    password_confirmation  {"aaaaaaa"}
    email                  {"aaa@gmail.com"}
    status                 {"男"}
  end

end