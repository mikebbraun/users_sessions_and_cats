class Cat < ApplicationRecord
  belongs_to :user
  has_many :lives
end
