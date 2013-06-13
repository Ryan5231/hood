class CreateChoices < ActiveRecord::Migration
  def change
    create_table :choices do |t|
      t.string :content
      t.references :neighbor, :listing
      t.timestamps
    end
  end
end
