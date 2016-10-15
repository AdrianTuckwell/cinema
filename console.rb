require_relative( 'models/film' )
require_relative( 'models/customer' )
require_relative( 'models/ticket' )

require( 'pry-byebug' )

# ---- Delete objects ----------------
Customer.delete_all()
Film.delete_all()
Ticket.delete_all()

# ---- create customer objects --------
customer1 = Customer.new({'name' => 'Tom', 'funds' => "100" })
customer1.save()
customer2 = Customer.new({'name' => 'Dick', 'funds' => "100" })
customer2.save() 
customer3 = Customer.new({'name' => 'Harry', 'funds' => "100" })
customer3.save() 


# ---- create fiml objects --------
film1 = Film.new({'title' => 'Titanic', 'price' => "10" })
film1.save()
film2 = Film.new({'title' => 'Moby Dick', 'price' => "10" })
film2.save() 
film3 = Film.new({'title' => 'Big', 'price' => "10" })
film3.save() 

# ---- create film objects --------
ticket1 = Ticket.new({ 'customer_id' => customer1.id , 'film_id' => film1.id })
ticket1.save()
ticket2 = Ticket.new({ 'customer_id' => customer2.id , 'film_id' => film2.id })
ticket2.save()
ticket3 = Ticket.new({ 'customer_id' => customer3.id , 'film_id' => film3.id })
ticket3.save()
ticket4 = Ticket.new({ 'customer_id' => customer1.id , 'film_id' => film1.id })
ticket4.save()
ticket5 = Ticket.new({ 'customer_id' => customer2.id , 'film_id' => film2.id })
ticket5.save()
ticket6 = Ticket.new({ 'customer_id' => customer3.id , 'film_id' => film3.id })
ticket6.save()
ticket7 = Ticket.new({ 'customer_id' => customer1.id , 'film_id' => film1.id })
ticket7.save()
ticket8 = Ticket.new({ 'customer_id' => customer2.id , 'film_id' => film2.id })
ticket8.save()
ticket9 = Ticket.new({ 'customer_id' => customer3.id , 'film_id' => film3.id })
ticket9.save()

#---- break point to jump into pry ---
binding.pry
nil