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
#Tag.delete_all

###TRANSACTION
#Transaction.delete_all
