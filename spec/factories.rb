FactoryGirl.define do
	factory :fact do
		question     "Who is Peccinini?"
		answer    "The founder of Wall Street English"
	end

	factory :user do
		name     "Tom Jones"
		email    "tjones@example.com"
		password "foobar"
		password_confirmation "foobar"
	end
end