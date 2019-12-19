
# # ルート
crumb :root do
  link "トップページ", root_path
end

# # マイページ
crumb :users do
  link "マイページ", user_path(current_user.id)
  parent :root
end

# # プロフィール
crumb :"/users/index/profile" do
  link "プロフィール", profile_user_path(current_user.id)
  parent :users
end

# # # 出品した商品
# crumb :"/users/index/tab" do
#   link "出品した商品", tab1_user_path(current_user.id)
#   parent :"/users/index/profile"
# end

