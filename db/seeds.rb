# Clear existing data
puts "Clearing existing data..."
BookSubject.destroy_all
Review.destroy_all
Book.destroy_all
Author.destroy_all
Subject.destroy_all

# Create Subjects
puts "Creating subjects..."
subjects = {
  "Fiction" => "Imaginative literature including novels and short stories",
  "Science Fiction" => "Fiction dealing with futuristic science and technology",
  "Mystery" => "Fiction involving crime and detective work",
  "Romance" => "Fiction focusing on romantic relationships",
  "Science" => "Non-fiction books about scientific topics",
  "History" => "Non-fiction books about historical events and periods",
  "Technology" => "Books about computers, software, and technology",
  "Philosophy" => "Books about philosophical concepts and ideas",
  "Biography" => "Books about people's lives and experiences",
  "Self-Help" => "Books designed to help readers improve themselves"
}

subjects.each do |name, description|
  Subject.create!(name: name, description: description)
end

# Create Authors
puts "Creating authors..."
authors = [
  {
    name: "Jane Austen",
    nationality: "English",
    birth_date: Date.new(1775, 12, 16),
    biography: "Jane Austen was an English novelist known primarily for her six major novels, which interpret, critique and comment upon the British landed gentry at the end of the 18th century."
  },
  {
    name: "George Orwell",
    nationality: "English",
    birth_date: Date.new(1903, 6, 25),
    biography: "Eric Arthur Blair, known by his pen name George Orwell, was an English novelist, essayist, journalist and critic. His work is characterised by lucid prose, biting social criticism, opposition to totalitarianism, and outspoken support of democratic socialism."
  },
  {
    name: "Isaac Asimov",
    nationality: "American",
    birth_date: Date.new(1920, 1, 2),
    biography: "Isaac Asimov was an American writer and professor of biochemistry at Boston University. He was known for his works of science fiction and popular science."
  },
  {
    name: "Agatha Christie",
    nationality: "English",
    birth_date: Date.new(1890, 9, 15),
    biography: "Dame Agatha Mary Clarissa Christie, Lady Mallowan, DBE was an English writer known for her sixty-six detective novels and fourteen short story collections."
  },
  {
    name: "Stephen King",
    nationality: "American",
    birth_date: Date.new(1947, 9, 21),
    biography: "Stephen Edwin King is an American author of horror, supernatural fiction, suspense, crime, science-fiction, and fantasy novels."
  }
]

authors.each do |author_data|
  Author.create!(author_data)
end

# Create Books
puts "Creating books..."
books = [
  {
    title: "Pride and Prejudice",
    isbn: "9780141439518",
    publish_date: Date.new(1813, 1, 28),
    description: "A classic romance novel about the relationship between Elizabeth Bennet and Mr. Darcy.",
    author: Author.find_by(name: "Jane Austen"),
    subjects: ["Fiction", "Romance"]
  },
  {
    title: "1984",
    isbn: "9780451524935",
    publish_date: Date.new(1949, 6, 8),
    description: "A dystopian social science fiction novel and cautionary tale about totalitarianism.",
    author: Author.find_by(name: "George Orwell"),
    subjects: ["Fiction", "Science Fiction"]
  },
  {
    title: "Animal Farm",
    isbn: "9780451526342",
    publish_date: Date.new(1945, 8, 17),
    description: "An allegorical novella about a group of farm animals who rebel against their human farmer.",
    author: Author.find_by(name: "George Orwell"),
    subjects: ["Fiction", "Philosophy"]
  },
  {
    title: "Foundation",
    isbn: "9780553293357",
    publish_date: Date.new(1951, 5, 1),
    description: "A science fiction novel about the fall of a galactic empire and the establishment of a new order.",
    author: Author.find_by(name: "Isaac Asimov"),
    subjects: ["Science Fiction", "Technology"]
  },
  {
    title: "Murder on the Orient Express",
    isbn: "9780062073501",
    publish_date: Date.new(1934, 1, 1),
    description: "A detective novel featuring Hercule Poirot investigating a murder on a train.",
    author: Author.find_by(name: "Agatha Christie"),
    subjects: ["Fiction", "Mystery"]
  },
  {
    title: "The Shining",
    isbn: "9780385121675",
    publish_date: Date.new(1977, 1, 28),
    description: "A horror novel about a family isolated in a haunted hotel during the winter.",
    author: Author.find_by(name: "Stephen King"),
    subjects: ["Fiction", "Mystery"]
  }
]

books.each do |book_data|
  subjects = book_data.delete(:subjects)
  book = Book.create!(book_data)
  
  subjects.each do |subject_name|
    subject = Subject.find_by(name: subject_name)
    BookSubject.create!(book: book, subject: subject) if subject
  end
end

# Create Reviews
puts "Creating reviews..."
reviews = [
  {
    book: Book.find_by(title: "Pride and Prejudice"),
    rating: 5,
    review_text: "A timeless classic that perfectly captures the social dynamics of 19th century England. Austen's wit and character development are unmatched.",
    reviewer_name: "BookLover",
    review_date: Date.today
  },
  {
    book: Book.find_by(title: "1984"),
    rating: 5,
    review_text: "A chilling and prophetic novel that remains incredibly relevant today. Orwell's vision of totalitarianism is both terrifying and thought-provoking.",
    reviewer_name: "LiteraryCritic",
    review_date: Date.today
  },
  {
    book: Book.find_by(title: "Animal Farm"),
    rating: 4,
    review_text: "A brilliant allegory that uses farm animals to explore political corruption and the abuse of power. Simple yet profound.",
    reviewer_name: "PoliticalReader",
    review_date: Date.today
  },
  {
    book: Book.find_by(title: "Foundation"),
    rating: 4,
    review_text: "A masterpiece of science fiction that explores the fall of civilizations and the role of knowledge in preserving human culture.",
    reviewer_name: "SciFiFan",
    review_date: Date.today
  },
  {
    book: Book.find_by(title: "Murder on the Orient Express"),
    rating: 4,
    review_text: "A perfectly crafted mystery with an ingenious plot twist. Christie's detective work is always entertaining and clever.",
    reviewer_name: "MysteryLover",
    review_date: Date.today
  },
  {
    book: Book.find_by(title: "The Shining"),
    rating: 5,
    review_text: "A masterpiece of horror that goes beyond simple scares to explore themes of isolation, addiction, and the supernatural.",
    reviewer_name: "HorrorFan",
    review_date: Date.today
  }
]

reviews.each do |review_data|
  Review.create!(review_data)
end

puts "Seed data created successfully!"
puts "Created #{Author.count} authors"
puts "Created #{Book.count} books"
puts "Created #{Subject.count} subjects"
puts "Created #{Review.count} reviews"
