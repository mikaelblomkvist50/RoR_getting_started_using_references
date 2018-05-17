`Gemfile`:
```ruby
group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
  gem 'hirb', '~> 0.7.3'
end
```

<pre><code>
$ <b>bundle install --without production</b>
</pre></code>

`db/seeds.rb`:
```ruby
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
```

<pre><code>
$ <b>rails console</b>
2.4.1 :001 > Article.destroy_all
.
.
2.4.1 :002 > Comment.destroy_all
.
.
2.4.1 :003 > exit

$ <b>rails db:seed</b>

$ <b>rails console</b>
Running via Spring preloader in process 50931
Loading development environment (Rails 5.1.4)
2.4.1 :001 > Hirb.enable
 => true
2.4.1 :002 > Article.all
  Article Load (2.3ms)  SELECT "articles".* FROM "articles"
+----+-------------------------------+-------------------------------+-------------------------+-------------------------+
| id | title                         | text                          | created_at              | updated_at              |
+----+-------------------------------+-------------------------------+-------------------------+-------------------------+
| 5  | Best place to start learni... | Are these resources anygoo... | 2018-03-28 03:39:45 UTC | 2018-03-28 03:39:45 UTC |
| 6  | Where to buy Bitcoin in Au... | Apart from local BitCoins,... | 2018-03-28 03:39:45 UTC | 2018-03-28 03:39:45 UTC |
+----+-------------------------------+-------------------------------+-------------------------+-------------------------+
2 rows in set
2.4.1 :003 > Comment.all
  Comment Load (0.3ms)  SELECT "comments".* FROM "comments"
+----+-----------+--------------------------------------+------------+-------------------------+-------------------------+
| id | commenter | body                                 | article_id | created_at              | updated_at              |
+----+-----------+--------------------------------------+------------+-------------------------+-------------------------+
| 7  | John      | Yes those are both informative an... | 5          | 2018-03-28 03:39:45 UTC | 2018-03-28 03:39:45 UTC |
| 8  | Mike      | I also recommend https://pragprog... | 5          | 2018-03-28 03:39:45 UTC | 2018-03-28 03:39:45 UTC |
| 9  | Satoshi   | Checkout https://www.coinjar.com.au/ | 6          | 2018-03-28 03:39:45 UTC | 2018-03-28 03:39:45 UTC |
| 10 | random    | https://www.coinspot.com.au/         | 6          | 2018-03-28 03:39:45 UTC | 2018-03-28 03:39:45 UTC |
+----+-----------+--------------------------------------+------------+-------------------------+-------------------------+
4 rows in set
2.4.1 :004 >
</pre></code>

 `db/schema.rb`:
 ```ruby
 # This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180327054904) do

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.text "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string "commenter"
    t.text "body"
    t.integer "article_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_comments_on_article_id"
  end

end
```
