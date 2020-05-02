class Task < ApplicationRecord
  enum tag: %i[notag postponed important]

  validates :title, presence: true, length: { maximum: 100 }
  validates :tag, presence: true
end
