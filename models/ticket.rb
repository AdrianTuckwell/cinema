require_relative("../db/sql_runner")

class Ticket

  attr_reader :id, :trainer_id, :pokemon_id

  def initialize( options )
    @id = options['id'].to_i
    @customer_id = options['customer_id'].to_i
    @film_id = options['film_id'].to_i
  end

  # ----- Save Ticket ----------------------
  def save()
    sql = "INSERT INTO tickets (customer_id, film_id) VALUES (#{ @customer_id }, #{ @film_id }) RETURNING *"
    ticket = SqlRunner.run(sql).first
    @id = ticket['id'].to_i
  end

  #------------ Edit ticket ---------------------
  def update
    sql = "UPDATE tickets SET 
      customer_id = '#{@customer_id}',
      film_id = '#{@film_id}'
      WHERE id = #{@id};"
    SqlRunner.run(sql)
    return nil
  end

  #------------ Delete ticket by id ----------------
  def self.delete(id)
    sql = "DELETE FROM tickets WHERE id = #{id}"
    SqlRunner.run(sql)
  end

  #------------ Delete all tickets ------------------
  def self.delete_all()
    sql = "DELETE FROM tickets"
    SqlRunner.run(sql)
  end

  #------------ Read all tickets ------------------
  def self.all()
    sql = "SELECT * FROM tickets"
    return Ticket.map_items(sql)
  end

  def self.map_items(sql)
    tickets = SqlRunner.run( sql )
    result = tickets.map { |ticket| Ticket.new( ticket ) }
    return result
  end

  def self.map_item(sql)
    result = Ticket.map_items(sql)
    return result.first
  end

end #--- Ticket class end ------------------