class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :password, 
            format: { 
              with: /\A(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]+\z/, 
              message: 'is invalid. Include both letters and numbers' 
            }

  has_many :recos
  has_many :comments
end