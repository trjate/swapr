class Curation < ActiveRecord::Base
  belongs_to :user
  has_many :contrabands
end
