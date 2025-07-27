class Author < ApplicationRecord
  has_many :books, dependent: :destroy
  has_many :subjects, through: :books
  
  validates :name, presence: true
end
