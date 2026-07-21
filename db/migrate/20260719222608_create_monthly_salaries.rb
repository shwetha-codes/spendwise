class CreateMonthlySalaries < ActiveRecord::Migration[8.1]
  def change
    create_table :monthly_salaries do |t|
      t.references :user, null: false, foreign_key: true
      t.date :month
      t.decimal :amount

      t.timestamps
    end
  end
end
