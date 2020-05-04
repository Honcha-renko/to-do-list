class Task < ApplicationRecord
  enum tag: %i[postponed important urgent]

  validates :title, presence: true, length: { maximum: 100 }
  validates :done, inclusion: { in: [true, false] }
end
