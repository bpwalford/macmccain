class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.belongs_to :song
      t.belongs_to :user

      t.timestamps
    end
  end
end
