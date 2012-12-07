class CreateSlots < ActiveRecord::Migration
  def change
    create_table :slots do |t|
      t.integer :self_rank
      t.integer :world_rank
      t.integer :friend_rank
      t.integer :card_id
      t.integer :display_card

      t.timestamps
    end
    add_index :slots, [:card_id, :world_rank]
    add_index :slots, [:card_id, :self_rank]
    add_index :slots, [:card_id, :friend_rank]
  end
end
