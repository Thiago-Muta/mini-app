# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
#Adm user with example tasks
path_adm = Rails.root.join 'app', 'assets', 'images', 'test-update.png'
adm = User.create(email: 'adm@email.com', password: '123123')
Profile.create(nickname: 'Mukuro', bio: 'Just your administration User', user: adm, share: true).avatar.attach(io: File.open(path_adm), filename: "test-image.png")
for i in 0..2 do
  task = Task.create(title: "Example Task \##{i + 1}", description: 'A Task can have a description of up to 280 characters!', priority: (10*i), user: adm, status: 10, share: true)
  Comment.create(body: "This Example Task \##{i + 1} has one Example Comment!", task: task, user: adm)
end
#Normal user 1
path_user = Rails.root.join 'app', 'assets', 'images', 'test-image.png'
user1 = User.create(email: 'a@b.c', password: '123123')
Profile.create(nickname: 'Junko', bio: 'Just your normal User number 1', user: user1).avatar.attach(io: File.open(path_user), filename: "test-image.png")
task1 = Task.create(title: 'Organize Class Trial', description: 'Help organize my classmates for a class debate', priority: 20, user: user1, share: true)
comment = Comment.create(body: "I'll help you out", task: task1, user: adm)
# Pluse.create(comment: comment, user: adm)
# Pluse.create(comment: comment, user: user)
# comment.update(score: 2)

#Normal user 2
# path_user = Rails.root.join 'app', 'assets', 'images', 'test-image.png'
user2 = User.create(email: '1@2.3', password: '123123')
Profile.create(nickname: 'Nagito', bio: 'Just your normal User number 2', user: user2).avatar.attach(io: File.open(path_user), filename: "test-image.png")
task2 = Task.create(title: 'Escape room', description: 'I want to try the new Escape Room in town', priority: 10, user: user2, share: true)
comment = Comment.create(body: "I'll help you out", task: task2, user: user2)


# New user 3
user3 = User.create(email: 'venom@v.v', password: '123123')
Profile.create(nickname: 'Venom', bio: "I'm an alien", user: user3).avatar.attach(io: File.open(path_user), filename: "test-image.png")
task3 = Task.create(title: 'To transform', description: 'I want to transform', priority: 10, user: user3, share: true, status: 10)
comment = Comment.create(body: "Oh my God", task: task3, user: user3)
comment = Comment.create(body: "Nice", task: task3, user: user3)
comment = Comment.create(body: "Let's run away", task: task3, user: user2)

task4 = Task.create(title: 'Eat', description: 'I want to eat until I explode', priority: 10, user: user3, share: true, status: 10)
comment = Comment.create(body: "He is very hungry", task: task4, user: user2)
comment = Comment.create(body: "I want to eat until I die", task: task4, user: user3)
comment = Comment.create(body: "Now i'm very full", task: task4, user: user3)

task5 = Task.create(title: 'To sleep', description: 'I want to sleep for hours', priority: 10, user: user3, share: true, status: 0)
comment = Comment.create(body: "Now i'm very sleepy", task: task5, user: user3)
comment = Comment.create(body: "I hope no one wakes me up", task: task5, user: user3)
comment = Comment.create(body: "H'll help you out", task: task5, user: user3)

task6 = Task.create(title: 'To hunt', description: 'I want to hunt something', priority: 10, user: user3, share: true, status: 10)
comment = Comment.create(body: "He is crazy", task: task6, user: user2)
comment = Comment.create(body: "Wow, how well he hunts", task: task6, user: user1)
comment = Comment.create(body: "I'm very good at hunting", task: task6, user: user3)

# -------
