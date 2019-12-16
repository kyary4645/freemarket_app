class AddYearToAddress < ActiveRecord::Migration[5.2]
  def change
    add_column :addresses, :year, :string
  end
end
