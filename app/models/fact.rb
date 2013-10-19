class Fact < ActiveRecord::Base
	validates(:question, presence: true, uniqueness: { case_sensitive: false })
	validates(:answer, presence: true)
end
