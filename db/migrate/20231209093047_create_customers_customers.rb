class CreateCustomersCustomers < ActiveRecord::Migration[7.1]
  def change
    create_table :customers_customers do |t|
      t.string :name
      t.date :date_of_birth
      t.string :place_of_birth

      t.timestamps
    end
  end
end
