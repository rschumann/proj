class CreateGroupTasksOrders < ActiveRecord::Migration
  def change
    create_table :group_tasks_orders do |t|
      t.integer :group_id
      t.integer :task_id
      t.integer :order

      t.timestamps
    end
  end
end
