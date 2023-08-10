# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


faculty = Faculty.create(
  name: 'Faculty1',
  email: "faculty@gmail.com",
  type: 'Faculty'
)
faculty_image = Image.create(url: 'https://faculty-profile.jpg',imageable: faculty)

students = []
20.times do |i|
  students << Student.create(
    name: "Student #{i+1}",
    email: "student#{i+1}@gmail.com",
    type: 'Student'
  )
end

categories = []
categories = 5.times do |i|
    Category.create!(
    name: "Category #{i+1}"
  )
end

#  5.times do |i|
#   student = students.sample
#   book = Book.all.sample
#   BookIssueRequest.create(
#     student: student,
#     faculty: faculty,
#     book: book,
#     status: ['requested', 'submitted'].sample
#   )
# end




