class Comment < ApplicationRecord
  belongs_to :article #Automatically included thanks to '$ rails generate model Comment commenter:string body:text article:reference'
end
