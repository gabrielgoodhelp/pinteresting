class AddButtColumnToPins < ActiveRecord::Migration
  def change
    add_column :pins, :butt, :integer
  end
end
