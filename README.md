# Sokushu Rails 5

## Setup
通常のrails
```
rails new normal
cd normal
rails s
open http://localhost:3000
```

API Modeのrails
```
rails new backend --api
cd backend
rails s
```

## API Mode
```
cd backend
rails middleware

diff -u <(cd normal && rails middleware) <(cd backend && rails middleware)
```

Generatorでviewやhelperを生成しない
```
rails g scaffold Project title:string started_at:datetime
rails g controller issues index show
```

## railsコマンドへの統一
```
rails -h
# or
rails
```

```
rake -T
```

## ActiveRecord Attributes API

```
rails g scaffold Book title:string price_in_cents:decimal
rails db:migrate
rails c
```

```
# in irb
book = Book.create(title: 'Hello Ruby', price_in_cents: 10.1)
book.price_in_cents
```

```
class Book < ActiveRecord::Base
  attribute :price_in_cents, :integer # 追加
end
```

```
# in irb
book = Book.create(title: 'Hello Ruby', price_in_cents: 10.1)
book.price_in_cents
```

## ActiveRecord::Relation#in_batches
```
rails g scaffold User name:string email:string verified:boolean
rails db:migrate
```

```
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
