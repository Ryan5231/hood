class CreateComment < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :post
      t.references :user
      t.string :title
      t.text :content
      t.timestamps
    end
  end
end

