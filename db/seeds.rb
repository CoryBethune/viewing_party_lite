  User.destroy_all

  user_1 = User.create(name: 'John Doe', email: 'JohnDoe@gmail.com', password: '12345')
  user_2 = User.create(name: 'Homer Simpson', email: 'HomerSimpson@gmail.com', password: '12345')