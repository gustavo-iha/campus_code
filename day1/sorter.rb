input = ""
QUIT = "quit"

people = []

puts("Digite os participantes")

while input != QUIT do
    input = gets.chomp()
    if input != QUIT
        people.push(input)
    end
end




is_inputting = "a"