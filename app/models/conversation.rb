class Conversation < ApplicationRecord
  belongs_to :user
  belongs_to :trainer
  has_many :messages
  validates :topic, presence: true
end
