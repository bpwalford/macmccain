class Song < ActiveRecord::Base

  has_many :purchases

  belongs_to :album

  validates_presence_of :title, :price

end
