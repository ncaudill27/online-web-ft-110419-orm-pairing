class User

  attr_accessor :id, :name, :email
  #only thigns that have been succesfully stored in the database should have an id

  #user = User.new({name: "Chris", email: "chris@fs.com"})
  def initialize(attr_hash)
    attr_hash.each {|attr, value| self.send("#{attr}=", value)}
    #self.send("name=", "Chris")
    #self.name = "Chris"
    @id ||= nil
    #or/equals operator
  end

  def save
    sql = "INSERT INTO users (name, email) values (?, ?)"
    DB.execute(sql, self.name, self.email)
    id_received_from_db = DB.execute("SELECT last_insert_rowid() FROM users")[0][0]
    self.id = id_received_from_db
  end

  def self.all
    sql = "SELECT * FROM users"
    all_users = DB.execute(sql)
    all_users_as_instances = all_users.map { |user_row| User.new(user_row) } 
  end


  def self.setup_table
    sql = "CREATE TABLE IF NOT EXISTS users (id INTEGER PRIMARY KEY, name TEXT, email TEXT)"
    DB.execute(sql)
  end

end
