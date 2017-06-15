class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.string :number
      t.integer :sort_id

      t.timestamps
    end
  end
end
