class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :winner
      t.time :winner_time
      t.time :loser_time

      t.timestamps
    end
  end
end
