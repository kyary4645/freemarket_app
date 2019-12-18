
# ルート
crumb :root do
  link "トップページ", root_path
end

# マイページ
crumb :users do
  link "マイページ", user_path(current_user.id)
  parent :root
end

# プロフィール

crumb :"/users/index/profile" do
  link "プロフィール", profile_user_path(current_user.id)
  parent :users
end
