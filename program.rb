require_relative 'emergencial_card'

INSERIR_CARD = 1
VISUALIZAR_CARDS = 2
PESQUISAR_CARDS = 3
SAIR = 4

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

def inserir_card(cards)
  puts 'Insira uma expressão em Português:'
  portugues = gets.chomp
  puts 'Insira uma expressão em Ingles:'
  ingles = gets.chomp
  card = Card.new(portugues, ingles)

  cards.each do |c|
    if c == card
      puts 'Esse card já existe!'
      return
    end
  end

  cards << card
  puts "Você inseriu o card: #{card}"
  puts
end

def imprimir_cards(cartoes)
  puts "Cards Cadastrados:"
  puts
  cartoes.each do |cartao|
    cartao.imprimir()
  end
  puts
end

def limpar_tela
  system('clear')
end

def salvar_cards(cards)
  byebug
  File.open('cards.data', 'w') do |f|
    cards.each do |card|
      f.puts card.to_s
    end
  end
end

def carregar_cards(cards)
  if File.exist?('cards.data')
    text = File.open('cards.data').read
    text.each_line do |line|
      port, ing = line.chomp.split('=>')
      cards << Card.new(port.strip, ing.strip)
    end
  end
end

cards = []
carregar_cards(cards)
limpar_tela()
puts 'Bem vindo ao Cards System'
opcao = menu()

while opcao != SAIR
  if opcao == INSERIR_CARD

    limpar_tela()
    inserir_card(cards)

  elsif opcao == VISUALIZAR_CARDS

    limpar_tela()
    imprimir_cards(cards)

  elsif opcao == PESQUISAR_CARDS
    limpar_tela()
    print "Informe o texto que está procurando: "
    texto_busca = gets.chomp

    cards_encontrados = []
    cards_encontrados = cards.select do |c|
      c.include?(texto_busca)
    end

    if cards_encontrados.empty?
      puts 'Nenhum card foi encontrado'
      puts
    else
      puts 'Encontramos os cards:'
      puts cards_encontrados
      puts
    end
  else
    limpar_tela()
    puts 'Entre com uma opcao válida'
    puts
  end
  opcao = menu()
end

salvar_cards(cards)
puts 'Obrigado por usar o Cards System!'

