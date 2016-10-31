class AddPimageToPimages < ActiveRecord::Migration
  def change
    add_column :pimages, :pimage, :string
  end
end
