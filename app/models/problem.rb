class Problem < ActiveRecord::Base
	belongs_to :exam
	belongs_to :fact
end
