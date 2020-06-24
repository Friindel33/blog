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
end
