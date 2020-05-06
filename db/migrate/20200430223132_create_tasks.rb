class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :title, null: false
      t.text :text
      t.integer :tag
      t.boolean :done, default: false
      t.datetime :expire_on
      t.timestamps
    end
  end
end

