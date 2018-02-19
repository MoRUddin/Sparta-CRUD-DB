class User

  attr_accessor :id, :first_name, :last_name, :email

  def save

    conn = User.open_connection

    if(!self.id)
      sql = "INSERT INTO users (first_name , last_name, email) VALUES ( '#{self.first_name}', '#{self.last_name}', '#{self.email}')"
    else
      sql = "UPDATE users SET first_name='#{self.first_name}', last_name='#{self.last_name}', email='#{self.email}' WHERE id = #{self.id}"
    end

    conn.exec(sql)

  end

  def self.open_connection

    conn = PG.connect( dbname: "mockaroo" )

  end

  def self.all

    conn = self.open_connection

    sql = "SELECT * FROM users ORDER BY id"

    results = conn.exec(sql)

    users = results.map do |tuple|
      self.hydrate tuple
    end

    users

  end

  def self.find id

    conn = self.open_connection

    sql = "SELECT * FROM users WHERE id = #{id} LIMIT 1"

    users = conn.exec(sql)

    user = self.hydrate users[0]

    user

  end

  def self.destroy id

    conn = self.open_connection

    sql = "DELETE FROM users where id = #{id}"

    conn.exec(sql)

  end

  def self.hydrate user_data

    user = User.new

    user.id = user_data['id']
    user.first_name = user_data['first_name']
    user.last_name = user_data['last_name']
    user.email = user_data['email']

    user

  end

end
