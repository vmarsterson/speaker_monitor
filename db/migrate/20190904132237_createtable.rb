class Createtable < ActiveRecord::Migration[5.2]
    def up
    create_table :team_members do |col|
      col.string :name
      col.string :avatar
  end

    create_table :speakers do |col|
      col.string :name
      col.string :company
      col.string :talk_type
      col.string :talk_title
      col.string :bio
      col.string :food
      col.string :avatar
      col.integer :team_member_id
  end
end

  def down
    remove_table :team_members
    remove_table :speakers
  end
end