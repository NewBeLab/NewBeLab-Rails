# == Schema Information
#
# Table name: profile_tags
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  profile_id :integer          not null
#  tag_id     :integer          not null
#
# Indexes
#
#  index_profile_tags_on_profile_id  (profile_id)
#  index_profile_tags_on_tag_id      (tag_id)
#
# Foreign Keys
#
#  profile_id  (profile_id => profiles.id)
#  tag_id      (tag_id => tags.id)
#
class ProfileTag < ApplicationRecord
  belongs_to :profile
  belongs_to :tag

  validates :profile_id, presence: true
  validates :tag_id, presence: true
end
