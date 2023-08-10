class AddReferenceIdsToImages < ActiveRecord::Migration[7.0]
   def change
    unless table_exists?(:images)
      create_table :images do |t|
        t.references :faculty, foreign_key: true
        t.references :book, foreign_key: true
        t.references :student, foreign_key: true
        t.string :url
        t.timestamps
      end
    end
  end
end
