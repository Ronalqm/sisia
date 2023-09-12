class CreateNewS < ActiveRecord::Migration[5.2]
  def change
    create_table :new_s do |t|
      t.string :title
      t.text :content
      t.date :date

      t.timestamps
    end
  end
end
