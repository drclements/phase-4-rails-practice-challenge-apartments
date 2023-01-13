class DropLeases < ActiveRecord::Migration[6.1]
  def change
    drop_table :leases
  end
end
