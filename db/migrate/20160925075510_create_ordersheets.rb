class CreateOrdersheets < ActiveRecord::Migration
  def change
    create_table :ordersheets do |t|
      t.string :os_customerid
      t.string :os_orderid
      t.string :os_neworder
      t.string :os_ordername
      t.string :os_groupname
      t.string :os_customername1
      t.string :os_customername2
      t.string :os_zip
      t.string :os_address1
      t.string :os_address2
      t.string :os_address3
      t.string :os_tel1
      t.string :os_tel2
      t.string :os_fax
      t.string :os_email
      t.string :os_toiday
      t.string :os_orderday
      t.string :os_nohinday
      t.string :os_shukinday
      t.string :os_nohin
      t.string :os_shukin
      t.string :os_image1
      t.string :os_image2
      t.string :os_image3

      t.timestamps null: false
    end
  end
end
