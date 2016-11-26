class CreatePerforms < ActiveRecord::Migration
  def change
    create_table :performs do |t|
      t.string :title
      t.text :description
      t.string :performimage

      t.timestamps null: false
    end
  end
end
