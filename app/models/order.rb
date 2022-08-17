class Order < ApplicationRecord
 belongs_to :customer
 has_one :order_detail
 
 enum payment_method:{ "クレジットカード": 0, "銀行振込": 1}
 
 def full_name
         self.last_name + " " + self.first_name
 end
 
 def full_address
    self.postal_code + " " + self.address + " " + self.name
 end
 
end
