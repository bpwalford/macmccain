class Album < ActiveRecord::Base

  # has_many :songs

  validates_presence_of   :name, :artist, :price
  validates_uniqueness_of :name

end
