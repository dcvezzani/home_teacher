class CreateHomeTeachees < ActiveRecord::Migration
  def change
    create_table :home_teachees do |t|
      t.string :firstname
      t.string :lastname
      t.string :email

      t.timestamps
    end
  end
end
