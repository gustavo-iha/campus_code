openings = []

puts("Selecione uma opção")
selected_step = gets.to_i()

while selected_step != 3 do
    if selected_step == 1

        print("Insira uma nova vaga: ")
        new_opening = gets.chomp()
        # opening.push(new_opening)
        openings << new_opening
        puts("Você inseriu: " + new_opening)
    elsif selected_step == 2
        puts openings
    end
end

# interpolação
# "1 + 1 = #{1+1}"

# array each

# variavel = _
# linha anterior

# padrão: pessoa[valor]

# hash + symbol

# hash
# key => valor -- string
# key: valor -- symbol