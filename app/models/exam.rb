class Exam < ActiveRecord::Base
	after_create :assign_facts
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

	def self.get_choices(fact)
		choices = Fact.where(question_type: fact.question_type).where.not(id: fact.id).order('RANDOM()').limit(3)
      choices.push(fact)
      choices.shuffle!
      return choices
	end

	private

		def assign_facts
			facts = Fact.all.sample(15)
			facts.each do |fact|
				self.assign!(fact)
			end
		end

end
