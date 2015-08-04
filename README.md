# Princeton Ruby Roundtable Active Record querying examples

Look at the [Ruby On Rails Active Record Query Guide](http://guides.rubyonrails.org/active_record_querying.html) page 

This repo is just sample data for all the examples on that page so you can run the same examples.

## Getting started

```
bundle install
```
When that is done:
```
rake db:setup
```
Finally, kick off console and query away.
```
rails c
```

##The following are queries I have run

### find
```
User.find(100)
User.find(10001)
```

###take
```
Client.take
Client.take(3)
Empty.take!
```

###first
```
Client.first
Client.first(5)
Empty.first!
```

###last
```
Client.last
Client.last(6)
Empty.last!

name = User.find(4000).name
User.find_by(name: name) ### what does it return?
```

###find_each
```
User.find_each do |a_single_user|
  puts a_single_user.username
end
```

###find_in_batches
```
User.find_in_batches do |an_array_of_users|
  puts an_array_of_users.map(&:username).join(', ')
end
```

### where
```
Order.where("quantity >= 4")

User.where(name: name)
User.where("name LIKE #{some_value}")

#params = {}
#params[:first_name] = "bill'; drop table users; '"
#Client.where("first_name LIKE '%#{params[:first_name]}%'") ### sql injection vulnerability

User.where("name LIKE ?", 'Ja%')

Client.where("orders_count = ? AND locked = ?", 1, false)

Client.where("created_at >= :start_date AND created_at <= :end_date", {start_date: 30.minutes.ago, end_date: Time.current})
```

###passing a hash
```
Client.where(locked: true)
```

###range condition
```
Client.where(created_at: (Time.now.midnight - 1.day)..Time.now.midnight)
```

###array subset
```
Client.where(orders_count: [1,3,5])

Client.where.not(orders_count: 1)
```

###ordering
```
Client.order(:created_at)

Client.order(created_at: :desc)
```

###multiple fields
```
Client.order(orders_count: :asc, created_at: :desc)

Client.where(locked: true).order(created_at: :desc) ###chaining

Client.select("viewable_by, locked") ### notice id: nil
```

### distinct
```
User.select(:name).count
query = User.select(:name).distinct.count
query.distinct(false).count
```

### limit and offset
```
Client.limit(5)
Client.limit(5).offset(30)
Client.limit(5).offset(30) == Client.offset(30).limit(5)
```

### Group by
```
Order.select("date(created_at) as ordered_date, sum(price) as total_price").group("date(created_at)")
Order.select("date(created_at) as ordered_date, sum(price) as total_price").group(ordered_date)

Order.group(:status).count
```

###having 
_skipped_

###unscope 
_skipped_
###only 
_skipped_
###reorder 
_skipped_
###reverse_order 
_skipped_

###rewhere 
_skipped_

###none
```
Article.none ###never used it.
```

###readonly
```
client = Client.readonly.first
client.name = 'Bilbo'
client.save
```

### locking 
_skipped_

###joining

###strings
```
Client.joins('LEFT OUTER JOIN addresses ON addresses.client_id = clients.id')
Address.joins('LEFT OUTER JOIN clients ON addresses.client_id = clients.id')
```

###hashes (INNER JOINs only)
```
Category.joins(:articles) ###article is plural because of the relationship (category has_many articles)
Article.joins(:category)
```

###nested association (single level)
```
Article.joins(comments: :guest)
```

###nested association (multipl level)
```
Category.joins(articles: [{ comments: :guest }, :tags])
```

###Eager Loading and N+1
```
clients_with_addresses = Client.includes(:address)

clients_with_addresses.each do |cwa|
  puts cwa.address.zip
end
```

### array of multiple associations
```
Article.includes(:category, :comments)
```

###  Nested Associations Hash
```
Category.includes(articles: [{ comments: :guest }, :tags]).find(1)
```

###scopes 
_skipped_

###dynamic finders
```
User.find_by_username('jules_verne')
```

### find or create/build
```
Client.find_or_create_by(name: 'Andy Warhol', first_name: 'Andy')
Client.find_or_create_by!(first_name: 'Andy') ### raises error if validation fails

Client.find_or_initialize_by!(name: 'Andy Warhol', first_name: 'Andy') ### raises error if validation fails
```

###find_by_sql 
_skipped_

###existence
```
Client.exists?(1)
Client.exists?(name: ['John', 'Sergei'])
Client.where(first_name: 'Ryan').exists?
Client.exists?
```


