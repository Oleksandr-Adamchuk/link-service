FactoryBot.create(:user, email: 'user@example.com', password: '1qaz2wsx')
FactoryBot.create(:user, email: 'admin@example.com', password: '1qaz2wsx', admin: true)

user = User.first

FactoryBot.create_list(:link, 20, user: user)