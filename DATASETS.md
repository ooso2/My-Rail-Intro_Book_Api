# Dataset Description

## Primary Dataset: Books API
- **Source**: Open Library API (https://openlibrary.org/developers/api)
- **Structure**: JSON format with book information
- **Fields**: title, author, publish_date, ISBN, subjects, description

## Secondary Dataset: Authors CSV
- **Source**: Custom CSV file with author information
- **Structure**: CSV format
- **Fields**: name, birth_date, nationality, biography

## Third Dataset: Faker Generated Reviews
- **Source**: Faker gem
- **Structure**: Generated data
- **Fields**: rating, review_text, reviewer_name, review_date

## Database Integration
- Books will have many Reviews (one-to-many)
- Books will belong to Authors (many-to-one)
- Authors will have many Books (one-to-many)
- Books and Subjects will have many-to-many relationship