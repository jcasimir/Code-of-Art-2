class Grade < ActiveRecord::Base
  attr_accessible :value, :person_id, :assignment_id
  belongs_to :person
  belongs_to :assignment
end
