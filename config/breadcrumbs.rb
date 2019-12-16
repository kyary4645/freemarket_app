
# ルート
crumb :root do
  link "トップページ", root_path
end

# マイページ
crumb :users do
  link "マイページ", users_path
  parent :root
end

