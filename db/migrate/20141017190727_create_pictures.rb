class CreatePictures < ActiveRecord::Migration

  def change
    create_table :pictures do |t|
      t.string :url
      t.integer :times_saved
      t.integer :times_skipped
      t.belongs_to :user, index: true

      t.timestamps null: false
    end
  end
end
