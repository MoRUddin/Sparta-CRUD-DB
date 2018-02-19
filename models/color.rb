class Color

  attr_accessor :id, :favourite_colour

  def save

    conn = Color.open_connection

    if(!self.id)
      sql = "INSERT INTO colors (favourite_colour) VALUES ( '#{self.favourite_colour}')"
    else

      sql = "UPDATE colors SET favourite_colour='#{self.favourite_colour}' WHERE id = #{self.id}"
    end

    conn.exec(sql)

  end

  def self.open_connection

    conn = PG.connect( dbname: "mockaroo" )

  end

  def self.all

    conn = self.open_connection

    sql = "SELECT * FROM colors ORDER BY id"

    results = conn.exec(sql)

    colors = results.map do |tuple|
      self.hydrate tuple
    end

    colors

  end

  def self.find id

    conn = self.open_connection

    sql = "SELECT * FROM colors WHERE id = #{id} LIMIT 1"

    colors = conn.exec(sql)

    color = self.hydrate colors[0]

    color

  end

  def self.destroy id

    conn = self.open_connection

    sql = "DELETE FROM colors where id = #{id}"

    conn.exec(sql)

  end

  def self.hydrate color_data

    color = Color.new

    color.id = color_data['id']
    color.favourite_colour = color_data['favourite_colour']

    color

  end

end
