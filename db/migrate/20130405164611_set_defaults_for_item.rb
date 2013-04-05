class SetDefaultsForItem < ActiveRecord::Migration
  def up
    change_column :items, :completed, :boolean, :default => false
  end

  def down
  end
end
