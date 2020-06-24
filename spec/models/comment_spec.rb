require 'rails_helper'

describe Comment do
  describe "belonging" do
    it { should belong_to :article }
  end
  describe "length" do
    it { should validate_length_of(:body).is_at_most(300) }
  end
end
