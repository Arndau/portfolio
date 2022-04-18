class AddUsedTechnoToProjects < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :used_techno, :string
  end
end
