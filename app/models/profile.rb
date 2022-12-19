class Profile < ApplicationRecord
  belongs_to :user
  has_many :profile_tags, dependent: :destroy
  has_many :tags, through: :profile_tags

  validates :times_link, length: { maximum: 50 }
  validates :self_introduction, length: { maximum: 100 }
  validates :user_id, presence: true

  def save_with_tags(name:)
    ActiveRecord::Base.transaction do
      self.tags = name.map { |name| Tag.find_or_initialize_by(name: name.strip) }
      save!
    end
      true
    rescue StandardError
      false
    end
end
