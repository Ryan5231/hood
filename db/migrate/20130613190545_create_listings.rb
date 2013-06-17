class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :title, :description, :address
      t.string :status, :default => 'active'
      t.references :neighborhood, :realtor
      t.timestamps
    end
  end
end
