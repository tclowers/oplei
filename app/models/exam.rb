class Exam < ActiveRecord::Base
	belongs_to :user
	default_scope -> { order('created_at DESC') }
	validates :user_id, presence: true
	has_many :problems
	has_many :facts, through: :problems

	def assigned?(fact)
		problems.find_by(fact_id: fact.id)
	end

	def assign!(fact)
		problems.create!(fact_id: fact.id)
	end

end
