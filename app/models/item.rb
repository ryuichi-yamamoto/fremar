class Item < ApplicationRecord

  has_many   :images
  has_many   :comments
  belongs_to :user
  belongs_to :brand
  belongs_to :category
  

  enum status: { "新品、未使用" => 0, "未使用に近い" => 1, "目立った傷や汚れなhし" => 2,
                 "やや傷や汚れあり" => 3,  "傷や汚れあり" => 4, "全体的に状態が悪い" => 5}

end
