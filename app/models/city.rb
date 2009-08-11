class City < ActiveRecord::Base
  validates_presence_of :name
  belongs_to :province, :include => [:country]
  delegate :country, :country_id, :country_id=, :to =>:province, :allow_nil => true
end
