require 'spec_helper'

describe "FactPages" do

let(:base_title) { "Oplei" }

	subject { page }

	describe "index" do
		before do
			###sign_in FactoryGirl.create(:user)
			FactoryGirl.create(:fact, question: "Who is Bob?", answer: "A guy")
			FactoryGirl.create(:fact, question: "Who is Jane", answer: "A lady")
			visit facts_path
		end

		it { should have_title('All facts') }
		it { should have_content('All facts') }

		it "should list each fact" do
			Fact.all.each do |fact|
			  expect(page).to have_selector('div', text: fact.question)
			end
		end

		describe "delete links" do

			it { should_not have_link('delete') }

			describe "as an admin user" do
				let(:admin) { FactoryGirl.create(:admin) }
					before do
					sign_in admin
					visit facts_path
				end

				it { should have_link('delete', href: fact_path(Fact.first)) }
				it "should be able to delete a fact" do
					expect do
						click_link('delete', match: :first)
					end.to change(Fact, :count).by(-1)
				end
			end
		end
	end

	describe "show fact page" do
		let(:fact) { FactoryGirl.create(:fact) }
		before { visit fact_path(fact) }

		it { should have_title(fact.question) }
		it { should have_content(fact.question) }
		it { should have_content(fact.answer) }

		describe "delete button" do

			it { should_not have_link('delete') }

			describe "as an admin user" do
				let(:admin) { FactoryGirl.create(:admin) }
					before do
					sign_in admin
					visit fact_path(Fact.first)
				end

				it { should have_link('delete', href: fact_path(Fact.first)) }
				it "should be able to delete a fact" do
					expect do
						click_link('delete', match: :first)
					end.to change(Fact, :count).by(-1)
				end
			end
		end
	end

	describe "new fact page" do
		before { visit new_fact_path }

		it { should have_content('Enter New Fact') }
		it { should have_title(full_title('New Fact')) }
	end

	describe "enter fact" do
		before { visit new_fact_path }

		let(:submit) { "Enter fact" }

		describe "with invalid information" do
			it "should not create a fact" do
				expect{ click_button submit }.not_to change(Fact, :count)
	      end
	   end

	   describe "with valid information" do
	      before do
	        fill_in "Question",  with: "What is an Encounter?"
	        fill_in "Answer", with: "A type of class"
	        select("What is__?", :from => "fact_question_type")
	      end

	      it "should create a fact" do
	        expect { click_button submit }.to change(Fact, :count).by(1)
	      end
	   end
	end
end
