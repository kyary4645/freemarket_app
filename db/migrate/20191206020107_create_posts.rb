class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :name, null: :false
      t.string :size, null: :true
      t.string :status, null: :false
      t.string :derivery_fee, null: :false
      t.string :derivery_method, null: :false
      t.integer :price, null: :false
      t.string :derivery_estimated, null: :false
      t.text :description, null: :false
      t.timestamps
    end
  end
end
