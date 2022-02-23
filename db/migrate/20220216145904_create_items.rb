class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.boolean :done
      t.string :body
      t.datetime :completed_at

      t.timestamps
    end
  end
end
