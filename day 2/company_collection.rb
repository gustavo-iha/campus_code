require_relative "company"

class Company_collection

    private
    attr_accessor :companies

    public
    def initialize()
        @companies = []
    end

    def create(id, name)
        new_company = Company.new(id || companies.length + 1, name)
        companies << new_company
        new_company
    end

    def create_from_console()
        print("Nome: ")
        new_name = gets.chomp()
        
        company = create(nil, new_name)
        puts("Você inseriu: \n")
        puts(company)
    end

    def by_id(id)
        @companies.find {|company| company.id == id}
    end

    def all()
        @companies
    end

    def print_all()
        self.all.each {|company| puts(company)}
    end
end