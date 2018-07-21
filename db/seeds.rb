# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Site.create!(id: "1", sospeso: "false")
User.create!(name: "Jack Jones",
			email: "jackjones@gmail.com",
			password:
			"foobar",
			password_confirmation: "foobar",
			admin: true,
			activated: true,
			activated_at: Time.zone.now)

99.times do |n|
	name = Faker::Name.name
	email = "utente-#{n+1}@gmail.com"
	password = "password"
	User.create!(name: name, email: email, password: password, password_confirmation: password, activated: true, activated_at: Time.zone.now)
end

#Microposts
users = User.order(:created_at).take(6)
50.times do
 content = Faker::Lorem.sentence(5)
 users.each { |user| user.microposts.create!(content: content) }
end

#Following

users = User.all
user = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }


# Creazione Tutorial
file = File.open("db/tutorial.txt", "rb")
contenuto = file.read
contenuto = contenuto.force_encoding('UTF-8').gsub("\u2028", " ")
tutorial = contenuto.split("|")

(0..4).step(3) do |n|

    titolo = tutorial[n].split("£")[1]
    linguaggio = tutorial[n+1].split("£")[1]
    lezione = tutorial[n+2].split("£")[1]
    Tutorial.create!(titolo: titolo, linguaggio: linguaggio, lezione: lezione)
end


# Creazione Tutorial
file = File.open("db/quiz.txt", "rb")
contenuto = file.read
contenuto = contenuto.force_encoding('UTF-8').gsub("\u2028", " ")
quiz = contenuto.split("|")

(0..52).step(28) do |n|

    titolo = quiz[n].split("£")[1]
    nex = quiz[n+1].split("£")[1]
    tutorial_id = quiz[n+2].split("£")[1]
    d1 = quiz[n+3].split("£")[1]
    r1_1 = quiz[n+4].split("£")[1]
    r1_2 = quiz[n+5].split("£")[1]
    r1_3 = quiz[n+6].split("£")[1]
    g1 = quiz[n+7].split("£")[1]
    d2 = quiz[n+8].split("£")[1]
    r2_1 = quiz[n+9].split("£")[1]
    r2_2 = quiz[n+10].split("£")[1]
    r2_3 = quiz[n+11].split("£")[1]
    g2 = quiz[n+12].split("£")[1]
    d3 = quiz[n+13].split("£")[1]
    r3_1 = quiz[n+14].split("£")[1]
    r3_2 = quiz[n+15].split("£")[1]
    r3_3 = quiz[n+16].split("£")[1]
    g3 = quiz[n+17].split("£")[1]
    d4 = quiz[n+18].split("£")[1]
    r4_1 = quiz[n+19].split("£")[1]
    r4_2 = quiz[n+20].split("£")[1]
    r4_3 = quiz[n+21].split("£")[1]
    g4 = quiz[n+22].split("£")[1]
    d5 = quiz[n+23].split("£")[1]
    r5_1 = quiz[n+24].split("£")[1]
    r5_2 = quiz[n+25].split("£")[1]
    r5_3 = quiz[n+26].split("£")[1]
    g5 = quiz[n+27].split("£")[1]
    Quiz.create!(titolo: titolo, next: nex, tutorial_id: tutorial_id, d1: d1, r1_1: r1_1,r1_2: r1_2, r1_3: r1_3, g1: g1, d2: d2, r2_1: r2_1,r2_2: r2_2, r2_3: r2_3, g2: g2, d3: d3, r3_1: r3_1,r3_2: r3_2, r3_3: r3_3, g3: g3, d4: d4, r4_1: r4_1,r4_2: r4_2, r4_3: r4_3, g4: g4, d5: d5, r5_1: r5_1,r5_2: r5_2, r5_3: r5_3, g5: g5)
end