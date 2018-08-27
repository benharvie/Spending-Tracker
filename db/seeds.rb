require_relative '../models/merchant.rb'
require_relative '../models/tag.rb'
require_relative '../models/transaction.rb'

### MERCHANT
Merchant.delete_all
p 'DB has been cleared of Merchants'

merchant1 = Merchant.new({ 'name' => 'Peppers' })
merchant1.save

merchant2 = Merchant.new({ 'name' => 'National Rail' })
merchant2.save

merchant3 = Merchant.new({ 'name' => 'Argos' })
merchant3.save

merchant4 = Merchant.new({ 'name' => 'The Chanter' })
merchant4.save

merchant5 = Merchant.new({ 'name' => 'Scottish Power' })
merchant5.save

p 'The DB has been populated with Merchants'

###TAG
Tag.delete_all
p 'DB has been cleared of Tags'

tag1 = Tag.new({ 'category' => 'Shopping' })
tag1.save

tag2 = Tag.new({ 'category' => 'Entertainment' })
tag2.save

tag3 = Tag.new({ 'category' => 'Food' })
tag3.save

tag4 = Tag.new({ 'category' => 'Travel' })
tag4.save

tag5 = Tag.new({ 'category' => 'Bill' })
tag5.save

p 'The DB has been populated with Tags'

###TRANSACTION
Transaction.delete_all
p 'DB has been cleared of Transactions'

transaction1 =  Transaction.new({
  'description' => 'Peppers panini',
  'amount' => 8.00,
  'date' => '2018-08-01',
  'merchant_id' => merchant1.id,
  'tag_id' => tag3.id
})
transaction1.save

transaction2 =  Transaction.new({
  'description' => 'New shoes',
  'amount' => 49.99,
  'date' => '2018-08-17',
  'merchant_id' => merchant1.id,
  'tag_id' => tag3.id
})
transaction2.save

transaction3 =  Transaction.new({
  'description' => 'Train ticket',
  'amount' => 4.89,
  'date' => '2018-08-19',
  'merchant_id' => merchant1.id,
  'tag_id' => tag4.id
})
transaction3.save

transaction4 =  Transaction.new({
  'description' => 'Had a pint',
  'amount' => 3.50,
  'date' => '2018-08-24',
  'merchant_id' => merchant4.id,
  'tag_id' => tag2.id
})
transaction4.save

transaction5 =  Transaction.new({
  'description' => 'Electricity and gas',
  'amount' => 56.00,
  'date' => '2018-08-27',
  'merchant_id' => merchant5.id,
  'tag_id' => tag5.id
})
transaction5.save

p 'The DB has been populated with Transactions'

binding.pry
nil
