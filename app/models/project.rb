class Project < ApplicationRecord
  belongs_to :user
  has_one_attached :photo

  validates :name, presence: true, uniqueness: true
  # validates :type, presence: true
  validates :description, length: { maximum: 140 }
  # validates :used_techno, presence: true
  validates :link, presence: true, uniqueness: true

  def project_image
    if image.attached?
      image.key
    else
      "default_profile_pic_xl837y"
    end
  end

end
