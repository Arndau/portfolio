class AddLinkedinToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :linkedin, :string
  end
end
