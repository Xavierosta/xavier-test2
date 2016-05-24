class CreateLocpairs < ActiveRecord::Migration
  def change
    create_table :locpairs do |t|
      t.string :location1
      t.string :location2

      t.timestamps null: false
    end
  end
end
