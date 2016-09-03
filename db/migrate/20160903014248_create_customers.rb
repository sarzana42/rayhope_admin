class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name1
      t.string :name2
      t.string :kana1
      t.string :kana2
      t.string :zip
      t.string :address1
      t.string :address2
      t.string :address3
      t.string :tel1
      t.string :tel2
      t.string :fax
      t.string :email

      t.timestamps null: false
    end
  end
end
