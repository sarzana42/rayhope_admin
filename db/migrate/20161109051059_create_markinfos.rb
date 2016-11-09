class CreateMarkinfos < ActiveRecord::Migration
  def change
    create_table :markinfos do |t|
      t.string :title
      t.text :description

      t.timestamps null: false
    end
  end
end
