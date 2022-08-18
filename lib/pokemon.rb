class Pokemon
    def initialize atr
        atr.each { |k, v| 
            self.class.attr_accessor(k)
            self.send("#{k}=", v)}
    end

    def save name, type, id
        sql = <<-SQL
            INSERT INTO pokemon (name, type)
            VALUES (?, ?)
        SQL
        DB[:conn].execute(sql, name, type)
        @id = DB[:conn].execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
    end

end
