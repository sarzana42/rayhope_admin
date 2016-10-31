class CreatePimages < ActiveRecord::Migration
  def change
    create_table :pimages do |t|
      t.string :ptitle
      t.string :purl
      t.string :pcomment
      t.string :ptag

      t.timestamps null: false
    end
  end
end
