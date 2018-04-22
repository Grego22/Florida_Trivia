class Quiz < ApplicationRecord
  has_many :questions
  belongs_to :user

  accepts_nested_attributes_for :questions
end
