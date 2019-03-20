class CreateSeminartopics < ActiveRecord::Migration[5.2]
  def change
    create_table :seminartopics do |t|
      t.string :title
      t.string :descripton
      t.string :studname
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
