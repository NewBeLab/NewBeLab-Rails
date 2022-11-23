# == Schema Information
#
# Table name: profiles
#
#  id                :integer          not null, primary key
#  commitment        :string           not null
#  editor            :string
#  grade             :integer          not null
#  motivation        :string           not null
#  phase             :string           not null
#  position          :string           not null
#  self_introduction :text
#  times_link        :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  user_id           :integer          not null
#
# Indexes
#
#  index_profiles_on_user_id                 (user_id)
#  index_profiles_on_user_id_and_times_link  (user_id,times_link) UNIQUE
#
# Foreign Keys
#
#  user_id  (user_id => users.id)
#
class Profile < ApplicationRecord
  belongs_to :user

  validates :times_link, length: { maximum: 100 },
                         format: { with: /\A(https\:\/\/chat\.runteq\.jp\/runteq\/channels) }
  validates :commitment, presence: true
  validates :position, presence: true
  validates :motivation, presence: true
  validates :self_introduction, length: { maximum: 100 }
  validates :phase, presence: true
  validates :grade, presence: true
  validates :editor
  validates :user_id, presence: true
end
