http://guides.rubyonrails.org/getting_started.html

<pre><code>
$ <b>rails generate controller Welcome index</b>
</pre></code>

`app/routes.rb`:
```ruby
Rails.application.routes.draw do
  get 'welcome/index'
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
```

`app/views/welcome/index.html.erb`:
```html
<h1>Hello, Rails!</h1>
```
