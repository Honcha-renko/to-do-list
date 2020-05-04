# frozen_string_literal: true

# Task class with defined enum and validation of title field
class Task < ApplicationRecord
  enum tag: %i[postponed important urgent]
  validates :title, presence: true, length: { maximum: 100 }
end
