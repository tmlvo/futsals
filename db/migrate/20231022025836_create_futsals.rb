class CreateFutsals < ActiveRecord::Migration[6.1]
  def change
    create_table :futsals do |t|
      t.string :name
      t.string :image
      t.text :about

      t.timestamps
    end
  end
end
