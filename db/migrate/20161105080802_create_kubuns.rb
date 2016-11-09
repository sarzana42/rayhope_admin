class CreateKubuns < ActiveRecord::Migration
  def change
    create_table :kubuns do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
