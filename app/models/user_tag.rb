# == Schema Information
#
# Table name: user_tags
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  tag_id     :integer          not null
#  user_id    :integer          not null
#
# Indexes
#
#  index_user_tags_on_tag_id   (tag_id)
#  index_user_tags_on_user_id  (user_id)
#
# Foreign Keys
#
#  tag_id   (tag_id => tags.id)
#  user_id  (user_id => users.id)
#
class UserTag < ApplicationRecord
  belongs_to :user
  belongs_to :tag

  validates :user_id, presence: true
  validates :tag_id, presence: true
end
