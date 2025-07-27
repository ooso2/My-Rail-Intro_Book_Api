class Book < ApplicationRecord
  belongs_to :author
  has_many :reviews, dependent: :destroy
  has_many :book_subjects, dependent: :destroy
  has_many :subjects, through: :book_subjects
  
  validates :title, presence: true
  validates :isbn, presence: true, uniqueness: true
end
