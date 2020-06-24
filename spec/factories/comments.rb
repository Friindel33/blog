FactoryBot.define do
  factory :comment do
    author { "Friindel" }
    sequence(:body) { |n| "comment body #{n}" }
  end
end
