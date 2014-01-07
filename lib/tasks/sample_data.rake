namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_facts
    make_exams
  end
end

def make_users
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
end

def make_facts
  #50.times do |n|
  #  num = n + 1
  #  question = "Who is User #{num}?"
  #  answer = "The #{num.ordinalize} user"
  #  Fact.create!(question: question,
  #               answer: answer,
  #               question_type: "who is")
  #end

  question = "Who is Henry Ford?"
  answer = "The founder of the Ford Motor Company"
  question_type = "who is"
  Fact.create!(question: question,
               answer: answer,
               question_type: question_type)
  Fact.create!(question: "Who is Alan Mulally?",
               answer: "The President and CEO of the Ford Motor Company",
               question_type: question_type)
  Fact.create!(question: "Who is Daniel Akerson?",
               answer: "The Chairman and CEO of General Motors",
               question_type: question_type)
  Fact.create!(question: "Who is Reid Bigland?",
               answer: "The CEO of Dodge",
               question_type: question_type)
  Fact.create!(question: "How many miles per gallon does the 2014 Dodge Challenger get on the highway?",
               answer: "27",
               question_type: "how many")
  Fact.create!(question: "How many miles per gallon does the 2014 Ford Fiesta get on the highway?",
               answer: "45",
               question_type: "how many")
  Fact.create!(question: "How many miles per gallon does the 2014 Ford Mustang get on the highway?",
               answer: "29",
               question_type: "how many")
  Fact.create!(question: "How many miles per gallon does the Tesla Model S get on the highway?",
               answer: "None. This vehicle is electric.",
               question_type: "how many")
  Fact.create!(question: "How much does the Tesla Model S (60 kWh) cost?",
               answer: "$62,400",
               question_type: "how much money")
  Fact.create!(question: "What is the starting MSRP of the 2014 Ford Focus ST?",
               answer: "$23,625",
               question_type: "how much money")
  Fact.create!(question: "What is the starting MSRP of the 2014 Chevy Volt?",
               answer: "$34,185",
               question_type: "how much money")
  Fact.create!(question: "What is the starting MSRP of the 2014 Dodge Durango?",
               answer: "$29,795",
               question_type: "how much money")
  Fact.create!(question: "What is Cruise Control?",
               answer: "A system that allows the driver to maintain speed without pressing the accelerator",
               question_type: "what is")
  Fact.create!(question: "What is Bluetooth?",
               answer: "A short-range wireless communication system that allows the driver to connect other devices, such as a mobile phonne, to the vehicle's systems",
               question_type: "what is")
  Fact.create!(question: "What is Sequential shift?",
               answer: "A feature that allows drivers to shift between gears manually without the use of a clutch",
               question_type: "what is")
  Fact.create!(question: "What is a Tercel?",
               answer: "Either a male falcon, or a mid-sized Toyota from the 20th century",
               question_type: "what is")
end

def make_exams
  users = User.all
  99.times do
    @user = users.shuffle.sample
    @exam = @user.exams.build()
    @exam.save
  end
end