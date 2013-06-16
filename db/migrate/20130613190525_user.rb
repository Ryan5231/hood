class User < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, :email, :password_digest
      t.string :type
      t.timestamps
    end
  end
end
