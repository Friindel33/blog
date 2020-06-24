require 'rails_helper'

describe Article do
  describe "validations" do
    it { should validate_presence_of :title }
    it { should validate_presence_of :text }
  end

  describe "associations" do
    it { should have_many :comments }
  end

  describe "#subject" do
    it "returns article title" do
      # create object Article other way
      article = create(:article, title: 'Lorum Ipsum')
      # assert, check
      expect(article.subject).to eq 'Lorum Ipsum'
    end
  end

  describe "length" do
    it { should validate_length_of(:title).is_at_most(140) }
    it { should validate_length_of(:text).is_at_most(4000) }
  end

  describe "#last_comment" do
    it "returns last comment" do
      # creating article but with comments
      article = create(:article_with_comments)
      # check
      expect(article.last_comment.body).to eq "comment body 3"
    end
  end
end
