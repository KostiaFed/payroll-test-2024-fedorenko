class CreatePayrolls < ActiveRecord::Migration[7.1]
  def change
    create_table :payrolls do |t|
      t.date :starts_at
      t.date :ends_at
      t.timestamps
    end
  end
end
