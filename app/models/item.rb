class Item < ActiveRecord::Base
  belongs_to :project
  attr_accessible :completed, :description, :title, :project_id
end
