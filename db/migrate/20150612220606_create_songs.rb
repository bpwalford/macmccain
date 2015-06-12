class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.belongs_to :album
      t.string :title
      t.decimal :price, :precision => 8, :scale => 2

      t.timestamps
    end
  end
end
