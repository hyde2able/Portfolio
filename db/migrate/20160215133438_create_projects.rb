class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :url
      t.string :title
      t.string :image
      t.boolean :youtube
      t.text :description
      t.integer :view, default: 0
      t.integer :good, default: 0
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
