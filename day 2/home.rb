require_relative "opening_collection"

selected_step = 0

SAIR = 6

# Conceito que vai levantar várias questões de boas práticas, porém utilizando apenas para testar uma lógica reaproveitável
def print_opening(opening)
    print("Título: #{opening[:title]}; Descrição: #{opening[:details]}")
end

def print_menu()
    puts([
        "\n",
        'Selecione uma opção:',
        '1 - Adicionar nova vaga',
        '2 - Ver todas vagas',
        '3 - Consultar vaga',
        '4 - Exportar para arquivo',
        '5 - Alterar visibilidade das vagas',
        "#{SAIR} - Sair",
        "\n"
    ])
end

puts('---- Inicializando ----')
openings = Opening_collection.new("Vendas")
openings.load()
puts("---- Pronto ----\n")
print_menu()

while selected_step != SAIR do
    selected_step = gets.to_i()
    if selected_step == 1
        # input data
        print("Título da vaga: ")
        new_title = gets.chomp()
        print("Descrição da vaga: ")
        new_details = gets.chomp()
        
        opening = openings.create(nil, new_title, new_details)
        openings.save_to_file()
        puts("Você inseriu: \n")
        opening.print()
    elsif selected_step == 2
        puts "\nVagas cadastradas:"
        openings.print_all()
    elsif selected_step == 3
        print "Pesquisar em vagas: "
        search = gets.chomp()

        searched_openings = openings.search_by_keyword(search)
        
        puts("\n #{searched_openings.length} vagas encontradas\n")
        searched_openings.each {|opening| opening.print()}
    elsif selected_step == 4
    elsif selected_step == 5
        puts("Digite o id da vaga que deseja alterar a visibilidade")
        openings.all.each {|opening| puts("#{opening.id}: #{opening.title}")}
        puts("\n")
        id_to_change = gets.to_i()
        opening_to_change = openings.by_id(id_to_change)
        if opening_to_change.nil?()
            puts("Id inválido")
        else
            opening_to_change.switch_visibility!()
            openings.save_to_file()
            opening_to_change.print()
        end
    elsif selected_step == SAIR
        puts 'Saindo'
    end

    print_menu()
    print("\nEscolha uma nova opção: ")
end