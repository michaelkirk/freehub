class CreateProjects < ActiveRecord::Migration
  def self.up
    create_table :projects do |t|

      t.belongs_to :person
      t.decimal :price
      t.string :make
      t.string :model
      t.string :color
      t.datetime :last_work_done

      t.belongs_to :created_by, :updated_by
      t.belongs_to :organization, :nil => false

      t.timestamps
    end


    execute "ALTER TABLE projects ADD CONSTRAINT fk_projects_person FOREIGN KEY (person_id) REFERENCES people(id)"
    execute "ALTER TABLE projects ADD CONSTRAINT fk_projects_organization FOREIGN KEY (organization_id) REFERENCES organizations(id)"

    execute "ALTER TABLE projects ADD CONSTRAINT fk_projects_created_by FOREIGN KEY (created_by_id) REFERENCES users(id)"
    execute "ALTER TABLE projects ADD CONSTRAINT fk_projects_updated_by FOREIGN KEY (updated_by_id) REFERENCES users(id)"
  end

  def self.down
    execute "ALTER TABLE projects DROP FOREIGN KEY fk_projects_person"
    execute "ALTER TABLE projects DROP FOREIGN KEY fk_projects_created_by"
    execute "ALTER TABLE projects DROP FOREIGN KEY fk_projects_updated_by"
    execute "ALTER TABLE projects DROP FOREIGN KEY fk_projects_organization"

    drop_table :projects
  end
end
