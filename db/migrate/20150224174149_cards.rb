class Cards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :title
      t.text :front
      t.text :back

      t.timestamps
    end
  end
end
