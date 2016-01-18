class Answer < ActiveRecord::Base
  belongs_to :question

  validates :username, presence: true
  validates :description, presence: true
  validates :question_id, presence: true
  validates :description, length: {minimum: 50}
end
