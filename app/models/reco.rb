class Reco < ApplicationRecord
  belongs_to :user
  has_many_attached :images
  has_many :comments

  validates :title, presence: true
  validates :content, presence: true
end
