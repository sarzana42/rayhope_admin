class CreateTeikyos < ActiveRecord::Migration
  def change
    create_table :teikyos do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
