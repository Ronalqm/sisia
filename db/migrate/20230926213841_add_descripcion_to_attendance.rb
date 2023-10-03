class AddDescripcionToAttendance < ActiveRecord::Migration[5.2]
  def change
    add_column :attendances, :descripcion, :string
  end
end
