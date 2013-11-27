require 'spec_helper'

describe Problem do
	let(:user) { FactoryGirl.create(:user) }
	let(:exam) { FactoryGirl.create(:exam, user: user) }
	let(:fact) { FactoryGirl.create(:fact) }
	let(:problem) { exam.problems.build(fact: fact) }

	subject { problem }

	it { should be_valid }

	describe "fact methods" do
		it { should respond_to(:exam) }
		it { should respond_to(:fact) }
		its(:exam) { should eq exam }
		its(:fact) { should eq fact }
	end
end
