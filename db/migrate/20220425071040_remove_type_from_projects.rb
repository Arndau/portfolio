class RemoveTypeFromProjects < ActiveRecord::Migration[6.1]
  def change
    remove_column :projects, :type, :string
  end
end
