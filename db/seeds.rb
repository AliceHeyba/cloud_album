# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Event.destroy_all
Attachment.destroy_all
Comment.destroy_all
Like.destroy_all


puts "creating event for Demo..."

john = User.create!(email: "john.john18@gmail.com", password: "123456")

wagon_event = Event.create!(event_date: '2023-11-29', event_name: "Wedding Demo", event_description: "Demo Day Showcase", attendee_email: "wagon@gmail.com", user: john)
wagon_birthday = Event.create!(event_date: '2024-11-29', event_name: "Birthday Demo", event_description: "Demo Day Birthday", attendee_email: "wagon12@gmail.com", user: john)

puts "event #{wagon_event.event_name} created!"

puts "event #{wagon_birthday.event_name} created!"

first_attachment = Attachment.create!(meta_picture: Date.today, caption: "beautiful moment", event_id: wagon_event.id, user: john)
