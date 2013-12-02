require 'spec_helper'

describe "ExamPages" do

	let(:base_title) { "Oplei" }
	let(:user) { FactoryGirl.create(:user) }

	subject { page }

	describe "index" do
		before do
			exam = user.exams.build()
			exam.save
			visit exams_path
		end


		it { should have_title('All exams') }
		it { should have_content('All exams') }
		it { should have_selector('th', text: "Exam#") }

		it "should list each exam" do
			Exam.paginate(page: 1).each do |exam|
			  expect(page).to have_selector('td', text: exam.user.name)
			end
		end

		describe "delete links" do

			it { should_not have_link('delete') }

			describe "as an admin user" do
				let(:admin) { FactoryGirl.create(:admin) }
				before do
					sign_in admin
					visit exams_path
				end

				it { should have_link('delete', href: exam_path(Exam.first)) }
				it "should be able to delete a fact" do
					expect do
						click_link('delete', match: :first)
					end.to change(Exam, :count).by(-1)
				end
			end
		end
	end

	describe "create exam" do
		before do
			sign_in user
			visit exams_path
		end

		let(:submit) { "New exam" }

      it "should create an exam" do
        expect { click_button submit }.to change(Exam, :count).by(1)
      end
	end
end