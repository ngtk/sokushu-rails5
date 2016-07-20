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
