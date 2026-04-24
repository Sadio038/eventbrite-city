# On supprime les données existantes pour repartir propre
Attendance.destroy_all
Event.destroy_all
User.destroy_all

# Création de quelques utilisateurs
user1 = User.create!(
  email: "alice@yopmail.com",
  encrypted_password: "password123",
  first_name: "Alice",
  last_name: "Dupont",
  description: "Passionnée d'événements culturels"
)

user2 = User.create!(
  email: "bob@yopmail.com",
  encrypted_password: "password123",
  first_name: "Bob",
  last_name: "Martin",
  description: "Amateur de concerts et de sport"
)

user3 = User.create!(
  email: "clara@yopmail.com",
  encrypted_password: "password123",
  first_name: "Clara",
  last_name: "Diallo",
  description: "Organisatrice d'evenements à Dakar"
)

# Creation de quelques evenements
event1 = Event.create!(
  title: "Concert Jazz à Dakar",
  description: "Un magnifique concert de jazz en plein air au coeur de Dakar. Venez nombreux profiter de cette soirée inoubliable.",
  start_date: DateTime.now + 10.days,
  duration: 120,
  price: 15,
  location: "Place de l'Independance, Dakar",
  user: user1
)

event2 = Event.create!(
  title: "Tournoi de Football",
  description: "Grand tournoi de football inter-quartiers. Inscrivez votre équipe et venez montrer votre talent sur le terrain.",
  start_date: DateTime.now + 5.days,
  duration: 180,
  price: 5,
  location: "Stade Leopold Sedar Senghor, Dakar",
  user: user2
)

puts "Seed termine !"
puts "#{User.count} utilisateurs crees"
puts "#{Event.count} événements crees"
