class AddConstraintsToMonthlySalaries < ActiveRecord::Migration[8.1]
  def change
  change_column_null :monthly_salaries, :month, false
  change_column_null :monthly_salaries, :amount, false

  change_column :monthly_salaries,
                :amount,
                :decimal,
                precision: 12,
                scale: 2

  add_index :monthly_salaries,
            [ :user_id, :month ],
            unique: true
  end
end
