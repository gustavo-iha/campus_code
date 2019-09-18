openings = []
selected_step = 0

SAIR = 5

# Conceito que vai levantar várias questões de boas práticas, porém utilizando apenas para testar uma lógica reaproveitável
def print_opening(opening)
    print("Título: #{opening[:title]}; Descrição: #{opening[:details]}")
end

puts([
    'Selecione uma opção:',
    '1 - Adicionar nova vaga',
    '2 - Ver todas vagas',
    '3 - Consultar vaga',
    '4 - Exportar para arquivo',
    "#{SAIR} - Sair",
    "\n"
])

while selected_step != 5 do
    selected_step = gets.to_i()
    if selected_step == 1
        # input data
        print("Título da vaga: ")
        new_title = gets.chomp()
        print("Descrição da vaga: ")
        new_details = gets.chomp()

        # Saving and notifying user
        new_opening = {
            title: new_title,
            details: new_details,
        }
        
        openings << new_opening
        puts("Você inseriu: \n")
        print_opening(new_opening)
    elsif selected_step == 2
        puts "\nVagas cadastradas:"

        openings.each_with_index do |opening, index|
            puts("#{index}: \n")
            print_opening(opening)
            puts("\n")
        end
    elsif selected_step == 3
        print "Pesquisar em vagas: "
        search = gets.chomp.downcase()

        # versão criando um novo array:
        # searched_openings = []
        # openings.each do |opening|
        #     if opening[:title].include?(search) || opening[:details].include?(search)
        #         searched_openings << opening
        #     end
        # end

        # searching in openings - is array.select the best way?
        searched_openings = openings.select {|opening| opening[:title].downcase.include?(search) || opening[:details].downcase.include?(search) }
        
        # print results
        if searched_openings.length > 0
            puts("\nVagas encontradas:")
            searched_openings.each do |opening|
                print_opening(opening)
                puts("\n")
            end
        else
            puts("Nenhuma vaga encontrada")
        end
    elsif selected_step == 4
        print("Nome do arquivo: ")
        file_name = gets.chomp()

        file = File.open(file_name, "w") do |file|
            file.puts("Vaga; Descrição\n")
            openings.each {|opening| file.puts("#{opening[:title]}; #{opening[:details]}\n")}
        end

        puts("Arquivo #{file_name}.txt salvo com sucesso")
    elsif selected_step == 5
        puts 'Saindo'
    end

    print("\nEscolha uma nova opção: ")
end