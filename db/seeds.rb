require_relative '../models/merchant.rb'
require_relative '../models/tag.rb'
require_relative '../models/transaction.rb'

### CLEAR DB
Transaction.delete_all
Merchant.delete_all
Tag.delete_all

### MERCHANT
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

###TAG
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

###TRANSACTION
transaction1 =  Transaction.new({
  'description' => 'Peppers panini',
  'amount' => 8.00,
  'transaction_date' => '2018-08-01',
  'merchant_id' => merchant1.id,
  'tag_id' => tag3.id
})
transaction1.save

transaction2 =  Transaction.new({
  'description' => 'New shoes',
  'amount' => 49.99,
  'transaction_date' => '2018-08-17',
  'merchant_id' => merchant3.id,
  'tag_id' => tag3.id
})
transaction2.save

transaction3 =  Transaction.new({
  'description' => 'Train ticket',
  'amount' => 4.89,
  'transaction_date' => '2018-08-19',
  'merchant_id' => merchant2.id,
  'tag_id' => tag4.id
})
transaction3.save

transaction4 =  Transaction.new({
  'description' => 'Had a pint',
  'amount' => 3.50,
  'transaction_date' => '2018-08-24',
  'merchant_id' => merchant4.id,
  'tag_id' => tag2.id
})
transaction4.save

transaction5 =  Transaction.new({
  'description' => 'Electricity and gas',
  'amount' => 56.00,
  'transaction_date' => '2018-08-27',
  'merchant_id' => merchant5.id,
  'tag_id' => tag5.id
})
transaction5.save

binding.pry
nil
