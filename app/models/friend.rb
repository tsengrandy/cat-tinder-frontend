class Friend < ApplicationRecord
  validates :name, :age, :enjoys , presence: true
  validates_length_of :enjoys, minimum: 10
end
