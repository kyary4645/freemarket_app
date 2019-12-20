
# # ルート
crumb :root do
  link "トップページ", root_path
end

# # マイページ
crumb :users do
  link "#{current_user.nickname}さんのマイページ", user_path(current_user.id)
  parent :root
end

# # プロフィール
crumb :"/users/index/profile" do
  link "プロフィール", profile_user_path(current_user.id)
  parent :users
end

# # 本人情報
crumb :"/users/index/personalinformation" do
  link "本人情報", personalinformation_user_path(current_user.id)
  parent :users
end

# # 出品中
crumb :"/users/index/tab1" do
  link "出品中", tab1_user_path(current_user.id)
  parent :users
end

# # 取引中
crumb :"/users/index/tab2" do
  link "取引中", tab2_user_path(current_user.id)
  parent :users
end


# # 売却済
crumb :"/users/index/tab3" do
  link "売却済", tab3_user_path(current_user.id)
  parent :users
end

# # ログアウト
crumb :"/users/index/logout" do
  link "ログアウト", logout_user_path(current_user.id)
  parent :users
end
