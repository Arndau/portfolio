class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  validates :email, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :description, length: { maximum: 140 }
  validates :facebook, uniqueness: true
  validates :instagram, uniqueness: true
  validates :twitter, uniqueness: true
  validates :linkedin, uniqueness: true

end
