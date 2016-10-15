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

end #---- Customer class end ------------