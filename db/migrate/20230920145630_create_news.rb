class CreateNews < ActiveRecord::Migration[5.2]
  def change
    create_table :news do |t|
      t.string :title
      t.text :content
      t.date :date

      t.timestamps
    end
  end
end
