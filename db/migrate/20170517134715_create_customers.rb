class CreateCustomers < ActiveRecord::Migration[5.0]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :confirmpassword
      t.string :mobilenumber
      t.string :gender

      t.timestamps
    end
  end
end
