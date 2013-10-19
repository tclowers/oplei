require 'spec_helper'

describe Fact do
	before { @fact = Fact.new(question: "Who is Peccinini", answer: "The founder of Wall Street English") }

	subject { @fact }

	it { should respond_to(:question) }
	it { should respond_to(:answer) }
	it { should respond_to(:type) }

	it { should be_valid }

	describe "when question is not present" do
		before { @fact.question = " " }
		it { should_not be_valid }
	end

	describe "when answer is not present" do
		before { @fact.answer = " " }
		it { should_not be_valid }
	end

	describe "when question is already entered" do
		before do
			fact_with_same_question = @fact.dup
			fact_with_same_question.save
		end

		it { should_not be_valid }
	end
end
