require_relative "opening"

class Opening_collection

    attr_accessor :name, :openings, :file_name

    def initialize(name)
        @name = name
        @openings = []
        @file_name = "openings_db"
    end

    def create(id, title, details, expiration = '12-10-2019', active = true, visible = false)
        new_opening = Opening.new(id || openings.length, title, details, expiration, active, visible)
        @openings << new_opening
        new_opening
    end

    def create_from_string(text)
        values = text.split("; ").map {|value| value.strip()}
        id = values[0].to_i()
        title = values[1]
        details = values[2]
        expiration = values[3]
        active = (values[4] == "true")
        visible = (values[5] == "true")

        self.create(id, title, details, expiration, active, visible)
    end

    def by_id(id)
        @openings.find {|opening| opening.id == id}
    end

    def all()
        @openings
    end

    def print_all()
        self.all.each {|opening| opening.print()}
    end

    def search_by_keyword(search)
        self.all.select {|opening| (opening.title.downcase + opening.details.downcase).include?(search.downcase)}
    end

    def get_active()
        @openings.select {|opening| opening.active?()}
    end

    def get_visible()
        @openings.select {|opening| opening.visible?()}
    end

    def get_private()
        @openings.select {|opening| !opening.visible?()}
    end

    def save_to_file()
        file = File.open(@file_name, "w") do |file|
            self.all.each {|opening| file.puts(opening.serialize() + "\n")}
        end
    end

    def load()
        file = File.read(@file_name).split("\n").each {|row| create_from_string(row.chomp())}
    end
end