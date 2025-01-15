class CreateIdeas < ActiveRecord::Migration[8.0]
  def change
    create_table :ideas do |t|
      t.string :title
      t.text :description
      t.integer :votes

      t.timestamps
    end
  end
end
