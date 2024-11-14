class Comment < ApplicationRecord
  belongs_to :reco
  belongs_to :user
end
