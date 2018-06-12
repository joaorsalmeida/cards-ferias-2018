def menu()
  puts "Digite a opção desejada"
  puts "[1] Inserir um novo card"
  puts "[2] Exibir todos os cards"
  puts "[3] Buscar um card"
  puts "[4] Sair"
  puts
  print 'Escolha uma opção: '
  gets.to_i
end

cards = []

puts 'Bem vindo ao Cards System'
opcao = menu()

while opcao != 4
  if opcao == 1
    puts 'Insira uma expressão em Português:'
    portugues = gets.chomp
    puts 'Insira uma expressão em Ingles:'
    ingles = gets.chomp

    #card = "Portugues: #{ portugues } -> Ingles: #{ ingles }"
    card = { portugues: portugues, ingles: ingles } # hash

    cards << card
    puts "Você inseriu o card: #{ card } "
    puts
  elsif opcao == 2
    puts "Cards Cadastrados:"
    puts
    puts cards
    puts
  elsif opcao == 3
    print "Informe o texto que está procurando: "
    texto_busca = gets.chomp

    cards.each do |c|
      if c[:portugues].include?(texto_busca)
        puts "Card Encontrado: #{c}"
      end
    end

    # XX cards encontrados

  else
    puts 'Entre com uma opcao válida'
    puts
  end
  opcao = menu()
end

puts 'Obrigado por usar o Cards System!'

