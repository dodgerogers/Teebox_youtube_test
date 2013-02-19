FactoryGirl.define do
  factory :user do
    name "Andy"
    email "dodgerogers@hotmail.com"
    provider "google"
    oauth_token "11111"
  end
  
  factory :question do
    title "fix my slice"
    body "Islice the ball too much"
  end
  
  factory :invalid_question do
    body nil
  end
end