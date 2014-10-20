class CreateTags < ActiveRecord::Migration

  def change
    create_table :tags do |t|
      t.string :tag_name
      t.belongs_to :picture, index: true
      t.belongs_to :user, index: true

      t.timestamps null: false
    end
  end
end
