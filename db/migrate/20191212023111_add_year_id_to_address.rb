class AddYearIdToAddress < ActiveRecord::Migration[5.2]
  def change
    add_column :addresses, :year_id, :integer
  end
end
