require_relative "opening"

class Intership_opening < Opening

    attr_accessor :accepted_courses, :date_start, :date_end

    def initialize(id, title, details, expiration, active, visible, accepted_courses, date_end)
        super(id, title, details, expiration, active, visible)
        @date_end = date_end
    end

    def to_s()
        "(estágio) - #{super()}, Cursos aceitos: #{accepted_courses}, Data fim: #{date_end}"
    end

end