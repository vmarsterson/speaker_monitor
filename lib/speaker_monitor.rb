class Team_member < ActiveRecord::Base
    has_many :speakers
end

class Speaker < ActiveRecord::Base
    belongs_to :teamMember
end