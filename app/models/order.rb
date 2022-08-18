class Order < ApplicationRecord
 belongs_to :customer
 has_many :order_details
 
 enum payment_method:{ credit_card: 0, transfer: 1 }
 
 def full_name
         self.last_name + " " + self.first_name
 end
 

def sum_of_price
        item.add_tax_price*amount  
end  

end
