require 'spec_helper'

describe Problem do
	let(:user) { FactoryGirl.create(:user) }
	let(:exam) { FactoryGirl.create(:exam, user: user) }
	let(:fact) { FactoryGirl.create(:fact) }
	let(:problem) { exam.problems.build(fact: fact) }

	subject { problem }

	it { should be_valid }

	describe "problem methods" do
		it { should respond_to(:exam) }
		it { should respond_to(:fact) }
		it { should respond_to(:correct) }
		its(:exam) { should eq exam }
		its(:fact) { should eq fact }
	end

	describe "when exam id is not present" do
		before { problem.exam_id = nil }
		it { should_not be_valid }
	end

	describe "when fact id is not present" do
		before { problem.fact_id = nil }
		it { should_not be_valid }
	end

	#describe "answering a question" do
	#	problem.answer!("correct").should 
	#end
end
