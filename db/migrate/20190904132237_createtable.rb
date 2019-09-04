class Createtable < ActiveRecord::Migration[5.2]
    def up
    create_table :teamMembers do |col|
      col.string :name
      col.string :title
      col.string :avatar
  end
  
    create_table :speakers do |col|
      col.string :name
      col.string :company
      col.string :talk
      col.string :bio
      col.string :food
      col.string :avatar
      col.integer :teamMember_id
  end
end

  def down
    remove_table :teamMembers
    remove_table :speakers
  end
end