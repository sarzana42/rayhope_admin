class AddDanjoToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :danjo, :string
    add_column :customers, :birth, :date
    add_column :customers, :piccus, :string
    add_column :customers, :groupcus, :string
    add_column :customers, :kubun, :string
    add_column :customers, :maildm, :string
  end
end
