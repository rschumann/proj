class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :group_id
      t.integer :task_id
      t.integer :user_id

      t.timestamps
    end
  end
end
