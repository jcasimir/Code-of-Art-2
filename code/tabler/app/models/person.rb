class Person < ActiveRecord::Base
  attr_accessible :name
  has_many :grades
end
