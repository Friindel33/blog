FactoryBot.define do
  factory :article do
    title { "Article title" }
    text { "Article text" }

    # creating factory "article with comments"
    # for creating article with many comments
    factory :article_with_comments do
      # after creatin article
      after :create do |article, evaluator|
        #creating list with 3 comments
        create_list :comment, 3, article: article
      end
    end
  end
end
