class CreateKamons < ActiveRecord::Migration
  def change
    create_table :kamons do |t|
      t.string :title
      t.text :discription
      t.string :kamonpic

      t.timestamps null: false
    end
  end
end
