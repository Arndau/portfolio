class Project < ApplicationRecord
  belongs_to :user
  has_one_attached :photo

  validates :name, presence: true, uniqueness: true
  # validates :type, presence: true
  validates :description, length: { maximum: 140 }
  # validates :used_techno, presence: true
  validates :link, presence: true, uniqueness: true
end
