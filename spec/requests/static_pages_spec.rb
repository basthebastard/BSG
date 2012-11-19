require 'spec_helper'

describe "StaticPages" do

	describe "Home page" do

		it "should have the title 'Bearshotgun!'" do
			visit '/static_pages/home'
			page.should have_selector('title',
				:text => "Bearshotgun!")
		end
	end
end
