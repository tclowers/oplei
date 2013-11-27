FactoryGirl.define do
	factory :fact do
		question     "Who is Peccinini?"
		answer    "The founder of Wall Street English"
		question_type	"who is"
	end

	factory :user do
		sequence(:name)  { |n| "Person #{n}" }
		sequence(:email) { |n| "person_#{n}@example.com"}
		password "foobar"
		password_confirmation "foobar"

		factory :admin do
			admin true
		end
	end

	factory :exam do
		user :user
	end
end