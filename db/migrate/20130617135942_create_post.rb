class CreatePost < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.references :user
      t.references :listing
      t.string :title
      t.text :content
      t.timestamps
    end
  end
end

