require_relative "opening"

class Opening
    
    attr_accessor :id, :title, :details, :expiration, :visible, :active

    def initialize(id, title, details, expiration, active, visible)
        @id = id
        @title = title
        @details = details
        @expiration = expiration
        @active = active
        @visible = visible
    end

    def search_contains?(text)
        title.downcase.include?(text.downcase) || details.downcase.include?(text.downcase)
    end

    def visible_text()
        @visible ? 'Pública' : 'Privada'
    end

    def to_s()
        "Título: #{title}, Descrição: #{details}, Validade: #{expiration}, Visibilidade: #{visible_text()}"
    end

    def set_private!()
        @visible = false
    end

    def set_visible!()
        @visible = true
    end

    def switch_visibility!()
        @visible = !@visible
    end

    def serialize()
        "#{id}; #{title}; #{details}; #{expiration}; #{active}; #{visible}"
    end
end