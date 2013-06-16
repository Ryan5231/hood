class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :neighbor, :choice
      t.timestamps
    end
    add_index(:votes, [:neighbor_id, :choice_id], :unique => true)
  end
end
