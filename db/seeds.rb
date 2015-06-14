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
