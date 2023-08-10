class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :name
      t.integer :quantity
      t.integer :faculty_id
      t.integer :category_id

      t.timestamps
    end
  end
end
