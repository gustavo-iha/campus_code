class Company
    
    attr_accessor :id, :name

    def initialize(id, name)
        @id = id
        @name = name
    end

    def to_s()
        "Id: #{id}, Nome: #{name}"
    end
end