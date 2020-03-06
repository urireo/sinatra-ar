class CreateUsers < ActiveRecord::Migration[6.0]
  def change
       #This will generate SQL to create a table.
        create_table :users do |t|
        t.string :email
        t.string :name
      end
  end
end

