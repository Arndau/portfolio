class Project < ApplicationRecord
  belongs_to :user

  validates :name, presence: true, uniqueness: true
  validates :project_type, presence: true
  validates :description, length: { maximum: 140 }
  # validates :used_techno, presence: true
  validates :link, presence: true, uniqueness: true

  has_one_attached :image

  COLLECTION = ["E-commerce", "Showcase", "Marketplace", "Social network"]
  TYPE = ["RoR", "JavaScript","HTML5","SCSS"]

  def project_image
    if image.attached?
      image.key
    else
      "default_profile_pic_xl837y"
    end
  end

end
