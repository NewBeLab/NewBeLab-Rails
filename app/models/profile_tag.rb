class ProfileTag < ApplicationRecord
  belongs_to :profile
  belongs_to :tag

  validates :profile_id, presence: true
  validates :tag_id, presence: true
end
