class CreateGoodProjects < ActiveRecord::Migration
  def change
    create_table :good_projects do |t|
      t.integer :project_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
