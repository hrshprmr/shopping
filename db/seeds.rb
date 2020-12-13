Role.create(name: :admin)
Role.create(name: :client)
user1 = User.create(username: 'harsh',
								    email: 'harsh.prmr1@gmail.com',
								    password: '123456',
								    password_confirmation: '123456')
user1.add_role(:admin)
user2 = User.create(username: 'ajay',
								    email: 'ajay@gmail.com',
								    password: '123456',
								    password_confirmation: '123456')
user2.add_role(:client)
