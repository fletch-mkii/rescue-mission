class Question < ActiveRecord::Base
  has_many :answers

  validates :title, presence: { message: "you suck, user!" }
  validates :description, presence: true
  validates :title, length: {minimum: 40}
  validates :description, length: {minimum: 150}
end
