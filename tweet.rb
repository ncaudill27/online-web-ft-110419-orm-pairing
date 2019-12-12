class Tweet

        
    attr_accessor :text, :user_id, :id

    def self.setup_table
        sql = <<-SQL
            CREATE TABLE tweets (
                id INTEGER PRIMARY KEY,
                text TEXT,
                user_id INTEGER
            );
        SQL
        DB.execute(sql)
    end

    def initialize(tweet_hash)
        tweet_hash.each{|key, val| self.send("#{key}=", val)}
    end

    def save
        if !!@id
            sql = <<-SQL
                UPDATE tweets SET text, user_id VALUES (?, ?)
                WHERE id = ?
            SQL
            DB.execute(sql, self.text, self.user_id, self.id)
        else
            sql = <<-SQL
                INSERT INTO tweets (text, user_id)
                VALUES (?, ?);
            SQL
            DB.execute(sql, self.text, self.user_id)
        end
    end

end