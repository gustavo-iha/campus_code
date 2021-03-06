require_relative "opening_collection"
require_relative "company_collection"

selected_step = 0

SAIR = 7

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
        '4 - Alterar empresa de vagas',
        '5 - Menu de empresas',
        '6 - Alterar visibilidade das vagas',
        "#{SAIR} - Sair",
        "\n"
    ])
end

puts('---- Inicializando ----')
openings = Opening_collection.new("Vendas")
openings.load()
companies = Company_collection.new()
companies.create(nil, "Revelo")
companies.create(nil, "QuintoAndar")
puts("---- Pronto ----\n")
print_menu()

def create_new_opening(openings)
    print("Título da vaga: ")
    new_title = gets.chomp()
    print("Descrição da vaga: ")
    new_details = gets.chomp()
    
    opening = openings.create(nil, new_title, new_details)
    openings.save_to_file()
    puts("Você inseriu: \n")
    puts(opening)
end

def create_new_internship(openings)
    print("Título da vaga: ")
    new_title = gets.chomp()
    print("Descrição da vaga: ")
    new_details = gets.chomp()
    print("Cursos aceitos: ")
    new_accepted_courses = gets.chomp()
    print("Data fim: ")
    new_date_end = gets.chomp()
    
    opening = openings.create_internship(nil, new_title, new_details, new_accepted_courses, new_date_end)
    openings.save_to_file()
    puts("Você inseriu: \n")
    puts(opening)
end

while selected_step != SAIR do
    selected_step = gets.to_i()
    if selected_step == 1
        print("Vaga normal (1) ou vaga de estágio (2): ")
        opening_type = gets.to_i()
        if opening_type == 1
            create_new_opening(openings)
        elsif opening_type == 2
            create_new_internship(openings)
        else
            puts("Opção inválida\n")
            return nil
        end
    elsif selected_step == 2
        puts "\nVagas cadastradas:"
        openings.print_all()
    elsif selected_step == 3
        print "Pesquisar em vagas: "
        search = gets.chomp()

        searched_openings = openings.search_by_keyword(search)
        
        puts("\n #{searched_openings.length} vagas encontradas\n")
        searched_openings.each {|opening| puts(opening)}
    elsif selected_step == 4
        puts("Selecione uma vaga digitando seu id:")
        openings.all.each {|opening| puts("#{opening.id}: #{opening.title}")}
        puts("\n")
        id_to_change = gets.to_i()
        opening_to_change = openings.by_id(id_to_change)
        if opening_to_change.nil?()
            puts("Id inválido")
        else
            puts(opening_to_change)
        end
        puts("Empresas disponíveis: \n")
        companies.print_all()
        puts("\n")
        company_id = gets.to_i()
        selected_company = companies.by_id(company_id)
        if selected_company.nil?()
            puts("Id inválido")
        else
            opening_to_change.company = selected_company.name
            openings.save_to_file()
        end
    elsif selected_step == 5
        print("Ver empresas (1) ou cadastrar empresa (2): ")
        company_menu_type = gets.to_i()
        if company_menu_type == 1
            companies.print_all()
        elsif company_menu_type == 2
            companies.create_from_console()
        else
            puts("Opção inválida\n")
            return nil
        end
    elsif selected_step == 6
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
            puts(opening_to_change)
        end
    elsif selected_step == SAIR
        puts 'Saindo'
    end

    print_menu()
    print("\nEscolha uma nova opção: ")
end