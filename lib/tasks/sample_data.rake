namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name: "Example User",
                         email: "example@oplei.co",
                         password: "foobar",
                         password_confirmation: "foobar",
                         admin: true)
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@oplei.co"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end

    50.times do |n|
      num = n + 1
      question = "Who is User #{num}?"
      answer = "The #{num.ordinalize} user"
      Fact.create!(question: question,
                   answer: answer,
                   question_type: "who is")
    end
  end
end