class Song < ActiveRecord::Base

  has_many :purchases

  belongs_to :album

  validates_presence_of :title, :price

  def format_name
    replacements = {
      ' ' => '_', '\'' => '', '(' => '', ')' => '', '.' => ''
    }

    self.title.gsub(/./) { |char| replacements.fetch(char, char) }
  end

end
