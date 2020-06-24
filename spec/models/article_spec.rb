require 'rails_helper'

describe Article do
  it { should validate_presence_of :title }
  it { should validate_presence_of :text }
  it { should have_many :comments }
end
