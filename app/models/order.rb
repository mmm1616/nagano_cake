class Order < ApplicationRecord
 enum payment_method:{ "クレジットカード": 0, "銀行振込": 1}
 
 def full_name
         self.last_name + " " + self.first_name
 end
end
