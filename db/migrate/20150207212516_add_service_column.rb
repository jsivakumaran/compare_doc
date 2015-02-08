class AddServiceColumn < ActiveRecord::Migration
  def change
    add_column(:tasks, :service, :string)
  end
end
