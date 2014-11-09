class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.references :user, index: true
      t.references :movie, index: true
      t.integer :rating
      t.datetime :rated_at

      t.timestamps
    end
  end
end
