class AddDateOfPublicationToProjects < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :date_of_publication, :date
  end
end
