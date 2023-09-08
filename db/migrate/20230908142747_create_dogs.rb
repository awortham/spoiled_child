class CreateDogs < ActiveRecord::Migration[7.0]
  def change
    create_table :dogs do |t|
      t.string :breed
      t.integer :cuteness_level
      t.integer :hair_length
      t.string :color
      t.boolean :can_fetch, default: false

      t.timestamps
    end
  end
end
