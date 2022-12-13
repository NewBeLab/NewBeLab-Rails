# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Tag < ApplicationRecord
  has_many :profile_tags, dependent: :destroy
  has_many :profiles, through: :profile_tags

  validates :name, uniqueness: true
end
