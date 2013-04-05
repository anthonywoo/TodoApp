class CreateTeamMemberships < ActiveRecord::Migration
  def change
    create_table :team_memberships do |t|
      t.references :user
      t.references :team

      t.timestamps
    end
    add_index :team_memberships, :user_id
    add_index :team_memberships, :team_id
  end
end
