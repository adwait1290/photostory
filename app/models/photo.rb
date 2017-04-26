class Photo < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :users, through: :likes
  has_many :likes, through: :users
  validates :title, presence: true, length: { within: 2..25 }
  validates :city, presence: true, length: { within: 2..15 }
  validates :state, presence: true, length: { is: 2 }
  validates :description, presence: true, length: { within: 10..55 }
  validates :story, presence: true, length: { within: 10..255 }
  has_attached_file :image, styles: { large: "600x600>", medium:"300x300>", thumb: "150x150"}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  validates_attachment :image, :presence => true,
  :size => { :in => 0..20000.kilobytes }
end
