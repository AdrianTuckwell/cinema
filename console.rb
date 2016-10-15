require_relative( 'models/film' )
require_relative( 'models/customer' )
require_relative( 'models/ticket' )

require( 'pry-byebug' )

# ---- Delete objects ----------------
Customer.delete_all()



# ---- create customer objects --------
customer1 = Customer.new({'name' => 'Tom', 'funds' => "100" })
customer1.save()
customer2 = Customer.new({'name' => 'Dick', 'funds' => "100" })
customer2.save() 
customer3 = Customer.new({'name' => 'Harry', 'funds' => "100" })
customer3.save() 







#---- break point to jump into pry ---
binding.pry
nil