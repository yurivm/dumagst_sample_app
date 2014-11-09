class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :age
      t.string :gender
      t.string :occupation
      t.string :zip_code

      t.timestamps
    end
  end
end
