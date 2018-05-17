# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
learning_rails = Article.create(title: 'Best place to start learning Rails?', text: 'Are these resources anygood? http://guides.rubyonrails.org/getting_started.html and https://www.railstutorial.org/')
learning_rails_comment_one = Comment.create(commenter: 'John', body: 'Yes those are both informative and begginer friendly.', article_id: learning_rails.id)
learning_rails_comment_two = Comment.create(commenter: 'Mike', body: 'I also recommend https://pragprog.com/book/rails51/agile-web-development-with-rails-5-1', article_id: learning_rails.id)

buying_bitcoin = Article.create(title: 'Where to buy Bitcoin in Australia?', text: 'Apart from local BitCoins, where else could I purchase from?')
buying_bitcoin_comment_one = Comment.create(commenter: 'Satoshi', body: 'Checkout https://www.coinjar.com.au/', article_id: buying_bitcoin.id)
buying_bitcoin_comment_two = Comment.create(commenter: 'random', body: 'https://www.coinspot.com.au/', article_id: buying_bitcoin.id)
