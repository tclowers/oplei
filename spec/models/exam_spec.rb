require 'spec_helper'

describe Exam do
	let(:user) { FactoryGirl.create(:user) }
	let(:fact) { FactoryGirl.create(:fact) }
	before do
		@exam = user.exams.create
	end

	subject { @exam }
 
	it { should respond_to(:user_id) }
	it { should respond_to(:problems) }
	it { should respond_to(:facts) }

	it { should be_valid }

	#its(:facts) { should have_at_least(10).items}

	describe "when user_id is not present" do
		before { @exam.user_id = nil }
		it { should_not be_valid }
	end

	describe "assigning facts" do
		before do
			#@exam.save
			@exam.assign!(fact)
		end

		it { should be_assigned(fact) }
		its(:facts) { should include(fact) }
	end

	describe "checking answers" do
	end

end
