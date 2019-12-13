class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|


      t.text :name
      t.string :size
      t.text :status
      t.text :derivery_fee
      t.text :derivery_method
      t.integer :price
      t.text :derivery_estimated
      t.text :description
      t.string :image
      t.text :category_id
      t.text :brand_id
      t.string :prefecture_id

      
      t.timestamps
    end
  end
end
