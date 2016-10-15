require_relative("../db/sql_runner")

class Customer

  attr_reader(:id )
  attr_accessor(:name,:funds)

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @funds = options['funds']
  end

  #------------ Save customer ---------------------
  def save()
    sql = "INSERT INTO customers (name, funds) VALUES ('#{@name}', '#{@funds}') RETURNING *"
    customer = SqlRunner.run(sql).first
    @id = customer['id'].to_i
  end

 #------------ Edit customer ---------------------
   def update
     sql = "UPDATE customers SET 
       name = '#{@name}',
       funds = '#{@funds}'
       WHERE id = #{@id};"
     SqlRunner.run(sql)
     return nil
   end

#------------ Delete customer by id ----------------
  def self.delete(id)
    sql = "DELETE FROM customers WHERE id = #{id}"
    SqlRunner.run(sql)
  end

#------------ Delete all customer ------------------
  def self.delete_all()
   sql = "DELETE FROM customers"
   SqlRunner.run(sql)
  end

#------------ Read all customer ------------------
  def self.all()
    sql = "SELECT * FROM customers"
    return Customer.map_items(sql)
  end

  def self.map_items(sql)
    customers = SqlRunner.run( sql )
    result = customers.map { |customer| Customer.new( customer ) }
    return result
  end

  def self.map_item(sql)
    result = Customer.map_items(sql)
    return result.first
  end

  #------------ Read films per customer ------------------
  def films()
    sql = "SELECT films.* FROM films INNER JOIN tickets ON tickets.film_id = films.id WHERE customer_id = #{id};"
    return Film.map_items(sql)
  end


end #---- Customer class end ------------