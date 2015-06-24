class Contraband < ActiveRecord::Base
  belongs_to :user

  validates :user_id, presence: true

  has_attached_file :contraband
  validates_attachment :contraband, presence: true,
    size: { in: 0..10.megabytes }
end