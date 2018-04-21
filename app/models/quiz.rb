class Quiz < ApplicationRecord
  has_many :questions
  has_many :users

  belongs_to :user
end
