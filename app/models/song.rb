class Song < ActiveRecord::Base

  belongs_to :album

  validates_presence_of :title, :price

  def format_name
    replacements = {
      ' ' => '_', '\'' => '', '(' => '', ')' => '', '.' => ''
    }

    self.title.gsub(/./) { |char| replacements.fetch(char, char) }.downcase
  end

end
