class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :orderId
      t.string :firstName
      t.string :lastName
      t.integer :giftValue
      t.string :mobileNo
      t.string :address

      t.timestamps
    end
  end
end
