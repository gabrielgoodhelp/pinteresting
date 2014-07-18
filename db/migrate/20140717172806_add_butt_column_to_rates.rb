class AddButtColumnToRates < ActiveRecord::Migration
  def change
    add_column :rates, :butt, :integer
  end
end
