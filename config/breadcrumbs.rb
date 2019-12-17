
# ルート
crumb :root do
  link "トップページ", root_path
end

# マイページ
crumb :users do
  link "マイページ", user_path(current_user.id)
  parent :root
end

