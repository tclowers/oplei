class Problem < ActiveRecord::Base
	belongs_to :exam
	belongs_to :fact
	validates :exam_id, presence: true
	validates :fact_id, presence: true
end
