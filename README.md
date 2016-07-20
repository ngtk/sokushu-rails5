# Sokushu Rails 5

## Setup

通常のrails

```sh
rails new normal
cd normal
rails s
open http://localhost:3000
```

API Modeのrails
```sh
rails new backend --api
cd backend
rails s
```

## API Mode

```sh
cd backend
rails middleware

diff -u <(cd normal && rails middleware) <(cd backend && rails middleware)
```

Generatorでviewやhelperを生成しない
```sh
rails g scaffold Project title:string started_at:datetime
rails g controller issues index show
```

## railsコマンドへの統一

```sh
rails -h
# or
rails
```

```sh
rake -T
```

## ActiveRecord Attributes API

```sh
rails g scaffold Book title:string price_in_cents:decimal
rails db:migrate
rails c
```

```ruby
# in irb
book = Book.create(title: 'Hello Ruby', price_in_cents: 10.1)
book.price_in_cents
```

```ruby
class Book < ActiveRecord::Base
  attribute :price_in_cents, :integer # 追加
end
```

```ruby
# in irb
book = Book.create(title: 'Hello Ruby', price_in_cents: 10.1)
book.price_in_cents
```

## ActiveRecord::Relation#in_batches

```sh
rails g scaffold User name:string email:string verified:boolean
rails db:migrate
```

```ruby
2100.times do |n|
  User.create(name: "user_#{n}", email: "user_#{n}@test.com", verified: false)
end

User.in_batches.class
User.in_batches.update_all(verified: true)
User.in_batches.each do |relation|
  relation.class #=> User::ActiveRecord_Relation
  relation.update_all(verified: true)
  sleep 10
end
```

## ActiveRecordの#saveにtouchオプションが追加

```ruby
book = Book.find(1)
book.title = "new title!"
book.save(touch: false)
```

## `#or`

```ruby
User.where(id: [1,2]).or(User.where(name: "user_0"))
```


## `#left_outer_joins`と`#left_joins`

```sh
rails g migration AddAuthorIdToBooks
```

```ruby
class AddAuthorIdToBooks < ActiveRecord::Migration[5.0]
  def change
    add_reference :books, :author, index: true
  end
end
```

```sh
rails db:migrate
```

```ruby
Author.left_outer_joins(:books)
```

## belongs_toのrequiredがデフォルトでtrueに

```ruby
class Book < ApplicationRecord
  attribute :price_in_cents, :integer

  belongs_to :author # 追加
end
```

```ruby
# in irb
book = Book.create(title: "Hello Rails 5!", author: nil)
book.errors.full_messages
```


## `Enumerable#pluck`, `#without`

```ruby
[{name: 'foo', point: 12}, {name: 'bar', point: 55}].pluck(:name)
```

```ruby
["apple", "chocolate", "milk", "cookie"].without("apple", "milk")
```
