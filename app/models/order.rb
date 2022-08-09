class Order < ApplicationRecord
#   enum prefecture: {入金待ち: 0, 入金確認: 1, 製作中: 2, 発送準備中: 3, 発送済み: 4}

 def full_name
         self.last_name + " " + self.first_name
 end
end
