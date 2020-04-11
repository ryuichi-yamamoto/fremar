crumb :root do
  link "トップページ", root_path
end

crumb :mypage do
  link "マイページ", users_path
  parent :root
end

crumb :profile do
  link "本人情報変更", edit_user_registration_path
  parent :mypage
end

crumb :addressRegister do
  link "住所登録", new_address_path
  parent :mypage
end

crumb :addressFix do
  link "住所変更", edit_address_path(current_user)
  parent :mypage
end

crumb :confirmationCard do
  link "カード情報確認", confirmation_card_path(current_user)
  parent :mypage
end

crumb :category do
  link "カテゴリ一覧", categories_path
end

crumb :categoryName do 
  link "#{Category.find(params[:id]).name}", category_path
  parent :category
end


