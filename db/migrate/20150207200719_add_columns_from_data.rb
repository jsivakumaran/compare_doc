class AddColumnsFromData < ActiveRecord::Migration
  def change
    add_column(:tasks, :doctor, :string)
    add_column(:tasks, :symptom, :string)
    add_column(:tasks, :action, :string)
    add_column(:tasks, :price_oop, :integer)
    add_column(:tasks, :percentage_covered, :integer)
    add_column(:tasks, :experience, :integer)
  end
end
