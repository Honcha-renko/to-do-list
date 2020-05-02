class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :text
      t.integer :tag, default: 0
      t.boolean :status
      t.datetime :expire_on

      t.timestamps


    end
  end
end

