class AddUserIdToMarkinfos < ActiveRecord::Migration
  def change
    add_column :markinfos, :user_id, :integer
  end
end
