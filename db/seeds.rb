User.delete_all
Song.delete_all
Album.delete_all
Purchase.delete_all

User.create!(
  email: 'asdf@asdf.com',
  password: 'asdf',
  password_confirmation: 'asdf',
  admin: true
)

User.create!(
  email: 'a@a.com',
  password: 'asdf',
  password_confirmation: 'asdf'
)


# Songs are in order
music = {
  "Rhythm and Dues" => [
    "It's You I Love",
    "Just for You",
    "When it Comes to Love",
    "Love Survives",
    "Hold On (Precious Moment)",
    "Gypsy",
    "Simply Happens",
    "Just in Time to Leave",
    "You Are"
  ],
  "Color of Everything" => [
    "I Do",
    "Color of Everything",
    "Head Game",
    "Winners",
    "Bluejeans",
    "OK",
    "Bobby can Play",
    "No Worries",
    "Nothing but Love"
  ],
  "all MAC too McCain easy" => [
    "All Too Easy",
    "You're an Island",
    "Gypsy",
    "Win Your Love",
    "Be With You",
    "When it Comes to Love",
    "Speechless",
    "All for Love",
    "Simply Happens",
    "Love and Leave",
    "You Are",
    "Time and Changes",
    "Love Survives",
    "Just for You"
  ],
  "Perfect World" => [
    "Color of Everything",
    "Perfect World",
    "I Do",
    "Walk Away",
    "All of These",
    "Hot Fudge",
    "Winners",
    "Head Game",
    "Gypsy",
    "F.M.B.Q."
  ]
}

music.keys.each do |album|
  new_album = Album.create!(
    name: album,
    artist: "Mac McCain",
    price: ((1 * music[album].length).to_f - 0.01)
  )

  music[album].each do |song|
    Song.create!(
      title: song,
      price: 0.99,
      album: new_album
    )
  end
end
