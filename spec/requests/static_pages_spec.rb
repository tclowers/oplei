require 'spec_helper'

describe "Static pages" do

	let(:base_title) { "Oplei" }

	describe "Home page" do

	 it "should have the content 'Oplei'" do
	   visit root_path
	   expect(page).to have_content('OPLEI')
	 end

	 it "should have the title 'Home'" do
	   visit root_path
	   expect(page).to have_title(full_title('Home'))
	 end
	end

  describe "Help page" do

    it "should have the content 'Help'" do
      visit help_path
      expect(page).to have_content('Help')
    end

    it "should have the title 'Help'" do
	   visit help_path
	   expect(page).to have_title(full_title('Help'))
	 end
  end

  describe "About page" do

    it "should have the content 'About'" do
      visit about_path
      expect(page).to have_content('About')
    end

    it "should have the title 'About'" do
	   visit about_path
	   expect(page).to have_title(full_title('About'))
	 end
  end

  describe "Contact page" do

    it "should have the content 'Contact'" do
      visit contact_path
      expect(page).to have_content('Contact')
    end

    it "should have the title 'Contact'" do
      visit contact_path
      expect(page).to have_title(full_title('Contact'))
    end
  end
end
