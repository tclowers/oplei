require 'spec_helper'

describe "FactPages" do

let(:base_title) { "Oplei" }

	subject { page }

	describe "new fact page" do
		before { visit new_fact_path }

		it { should have_content('Enter New Fact') }
		it { should have_title(full_title('New Fact')) }
	end
end
