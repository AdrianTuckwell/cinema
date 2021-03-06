require_relative("../db/sql_runner")

class Film 

  attr_reader( :id  )
  attr_accessor(:title, :price)

  def initialize( options )
    @id = options['id'].to_i
    @title = options['title']
    @price = options['price']
  end

  #------------ Save film ---------------------
  def save()
    sql = "INSERT INTO films (title, price) VALUES ('#{@title}', '#{@price}') RETURNING *"
    film = SqlRunner.run(sql).first
    @id = film['id'].to_i
    end

  #------------ Edit film ---------------------
  def update
    sql = "UPDATE films SET 
    title = '#{@title}',
    price = '#{@price}'
    WHERE id = #{@id};"
    SqlRunner.run(sql)
    return nil
  end

  #------------ Delete film by id ----------------
  def self.delete(id)
    sql = "DELETE FROM films WHERE id = #{id}"
    SqlRunner.run(sql)
  end

  #------------ Delete all films ------------------
  def self.delete_all()
   sql = "DELETE FROM films"
   SqlRunner.run(sql)
  end

 #------------ Read all films ------------------
  def self.all()
    sql = "SELECT * FROM films"
    return Film.map_items(sql)
  end

  def self.map_items(sql)
    films = SqlRunner.run( sql )
    result = films.map { |film| Film.new( film ) }
    return result
  end

  def self.map_item(sql)
    result = Film.map_items(sql)
    return result.first
  end

  #------------ Read customers that have watched a film -------
  def customers()
    sql = "SELECT customers.* FROM customers INNER JOIN tickets ON tickets.customer_id = customers.id WHERE film_id = #{id};"
    return Customer.map_items(sql)
  end
end #-- Film class end ----------