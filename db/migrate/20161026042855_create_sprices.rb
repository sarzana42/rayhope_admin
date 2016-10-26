class CreateSprices < ActiveRecord::Migration
  def change
    create_table :sprices do |t|
      t.string :teikyo
      t.string :acompany
      t.string :skuc
      t.string :jproduct
      t.string :eproduct
      t.string :pnumber
      t.string :p1cos
      t.string :p2cos
      t.string :p3cos
      t.string :p4cos

      t.timestamps null: false
    end
  end
end
