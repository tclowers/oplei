require 'spec_helper'

describe "ExamPages" do

let(:base_title) { "Oplei" }
let(:user) { FactoryGirl.create(:user) }

	subject { page }

	describe "index" do
		before do
			#FactoryGirl.create(:fact, question: "Who is Bob?", answer: "A guy")
			exam = user.exams.build()
			visit exams_path
		end

		it { should have_title('All Exams') }
		it { should have_content('All Exams') }

		it "should list each fact" do
			Exam.all.each do |fact|
			  expect(page).to have_selector('div', text: exam.user)
			end
		end
	end
end