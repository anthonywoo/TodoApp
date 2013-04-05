class User < ActiveRecord::Base
  attr_accessible :name, :team_ids
  has_many :team_memberships
  has_many :teams, :through => :team_memberships
  has_many :projects, :through => :teams
  has_many :items, :through => :projects

  validates :name, :team_ids, :presence=> true
end
