require_relative '../models/merchant.rb'
require_relative '../models/tag.rb'
require_relative '../models/transaction.rb'

### MERCHANT
Merchant.delete_all
p 'DB has been cleared of Merchants'

merchant1 = Merchant.new({ 'name' => 'eBay' })
merchant1.save

merchant2 = Merchant.new({ 'name' => 'Amazon' })
merchant2.save

merchant3 = Merchant.new({ 'name' => 'Argos' })
merchant3.save

merchant4 = Merchant.new({ 'name' => 'John Lewis' })
merchant4.save

merchant5 = Merchant.new({ 'name' => 'Tesco' })
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

tag5 = Tag.new({ 'category' => 'Expense' })
tag5.save

p 'The DB has been populated with Tags'

###TRANSACTION
#Transaction.delete_all

binding.pry
nil
