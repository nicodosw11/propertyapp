class Photo < ApplicationRecord
  belongs_to :deal

  # has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>", carousel: "800x535>" }
  has_attached_file :image,
    :styles => { mini: '48x48>', thumb: '100x100>', medium: '300x300>', carousel: '800x535>' },
    :storage => :cloudinary,
    :path => ':class/:id/:style/:filename'
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  # private
  def title_from_image_file_name
    File.basename(self.image_file_name, File.extname(self.image_file_name)).scan(/\w+/).join(' ').downcase.capitalize
  end
end
