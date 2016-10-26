class CreateAcompanies < ActiveRecord::Migration
  def change
    create_table :acompanies do |t|
      t.string :aname

      t.timestamps null: false
    end
  end
end
