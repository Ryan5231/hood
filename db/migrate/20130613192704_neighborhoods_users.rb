class NeighborhoodsUsers < ActiveRecord::Migration
  def change
    create_table :neighborhoods_users do |t|
      t.references :neighborhood, :neighbor
    end
  end
end
