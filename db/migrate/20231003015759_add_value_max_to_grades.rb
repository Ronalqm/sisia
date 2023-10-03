class AddValueMaxToGrades < ActiveRecord::Migration[5.2]
  def change
    add_column :grades, :value_max, :integer
  end
end
