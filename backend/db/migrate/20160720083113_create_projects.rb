class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :title
      t.datetime :started_at

      t.timestamps
    end
  end
end
