`config/routes.rb`:
```ruby
Rails.application.routes.draw do
  get 'welcome/index'
  root 'welcome#index'
  resources :articles do
    resources :comments
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
```

<pre><code>
$ <b>rails generate controller Comments</b>

$ <b>rails generate model Comment commenter:string body:text article:references</b>

$ <b>rake db:migrate</b>
== 20180327054904 CreateComments: migrating ===================================
-- create_table(:comments)
   -> 0.0038s
== 20180327054904 CreateComments: migrated (0.0039s) ==========================

$ <b>touch app/views/comments/_comment.html.erb touch app/views/comments/_form.html.erb</b>
</pre></code>

`app/models/comment.rb`:
```ruby
class Comment < ApplicationRecord
  belongs_to :article #Automatically included thanks to '$ rails generate model Comment commenter:string body:text article:reference'
end
```

`app/models/article.rb`:
```ruby
class Article < ApplicationRecord
  has_many :comments, dependent: :destroy #Manually added
  validates :title, presence: true, length: { minimum: 5 }
end
```

`app/controllers/comments_controller.rb`:
```ruby
class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end
```

`app/views/articles/show.html.erb`:
```html
<p>
  <strong>Title:</strong>
  <%= @article.title %>
</p>

<p>
  <strong>Text:</strong>
  <%= @article.text %>
</p>

<h2>Comments</h2>
<%= render @article.comments %>

<h2>Add a comment:</h2>
<%= render 'comments/form' %>

<%= link_to 'Edit', edit_article_path(@article) %> |
<%= link_to 'Back', articles_path %>
```

`app/views/comments/_comment.html.erb`:
```html
<p>
  <strong>Commenter:</strong>
  <%= comment.commenter %>
</p>

<p>
  <strong>Comment:</strong>
  <%= comment.body %>
</p>

<p>
  <%= link_to 'Destroy Comment', [comment.article, comment], method: :delete, data: { confirm: 'Are you sure?' } %>
</p>
```

`app/views/comments/_form.html.erb`:
```html

<%= form_with(model: [ @article, @article.comments.build ]) do |form| %>
  <p>
    <%= form.label :commenter %><br>
    <%= form.text_field :commenter %>
  </p>
  <p>
    <%= form.label :body %><br>
    <%= form.text_area :body %>
  </p>
  <p>
    <%= form.submit %>
  </p>
<% end %>
```
