require 'spec_helper'

describe Exam do
	let(:user) { FactoryGirl.create(:user) }
	before { @exam = user.exams.build() }

	subject { @exam }

	it { should respond_to(:user_id) }
	it { should respond_to(:problems)}

	it { should be_valid }

	describe "when user_id is not present" do
		before { @exam.user_id = nil }
		it { should_not be_valid }
	end
end
