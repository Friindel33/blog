class Comment < ApplicationRecord
  validates :body, presence: true, length: { maximum: 300 }
  belongs_to :article
end
