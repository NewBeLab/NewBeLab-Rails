class ChangeNotNullToProfile < ActiveRecord::Migration[6.1]
  def up
    change_column_null :profiles, :commitment, true
    change_column_null :profiles, :position, true
    change_column_null :profiles, :motivation, true
    change_column_null :profiles, :phase, true
    change_column_null :profiles, :grade, true
  end

  def down
    change_column_null :profiles, :commitment, false
    change_column_null :profiles, :position, false
    change_column_null :profiles, :motivation, false
    change_column_null :profiles, :phase, false
    change_column_null :profiles, :grade, false
  end
end
