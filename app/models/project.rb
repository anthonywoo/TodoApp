class Project < ActiveRecord::Base
  # REV: blank lines should go between attr_accessible and 
  # relationships, also before validates lines
  attr_accessible :description, :title, :team_id
  has_many :items
  belongs_to :team
  # REV: you should also validate title length
  # and any string value because of descrepencies 
  # between sql storage of TEXT and Rails' definition
  # of string(255)
  validates :title, :description, :presence=> true
end
