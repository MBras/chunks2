class Chunk < ActiveRecord::Base
	belongs_to :user

	validates :description, presence: true, length: { maximum: 256 }
	validates :user_id, presence: true
	validates :status_id, presence: true
end
