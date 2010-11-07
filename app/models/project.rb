class Project < ActiveRecord::Base
  belongs_to :organization
  belongs_to :person
  has_many :notes, :as => :notable, :dependent => :destroy
  has_userstamps
  
  validates_presence_of :person_id, :organization_id
end
