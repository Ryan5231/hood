class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :neighbor, :choice
      t.timestamps
    end
  end
end
