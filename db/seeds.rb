FactoryBot.create(:user, email: 'user@example.com', password: '1qaz2wsx')

user = User.first

FactoryBot.create_list(:link, 20, user: user)