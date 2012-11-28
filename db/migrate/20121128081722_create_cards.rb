class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :subject
      t.string :content
      t.integer :user_id

      t.timestamps
    end
  end
end
