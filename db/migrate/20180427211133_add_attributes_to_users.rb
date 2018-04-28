class AddAttributesToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :name, :string
    add_column :users, :intro, :text
    add_column :users, :avatar, :string
  end
end

# ============================
# 由於 name 屬性的更新，會連帶更動
# rake dev:fake_user
# restaurants#show 裡的評論者名稱
# 使用者註冊表單（需參考 Devise 說明）
# ============================
# 若要針對目前使用者 name 值為 nil 的問題，可至 rails console 執行：
# User.all.each do |user|
#   user.update(name: user.email.split('@').first)
# end
# ============================