class Card
  attr_accessor :portugues, :ingles, :imagem

  def initialize(port, ing = "")
    @portugues = port
    @ingles = ing
    @imagem = "nenhuma"
  end

  def imprimir()
    puts "Card: " + to_s()
  end

  # em Ruby usamos o snake_case para métodos
  def to_s()
    "#{portugues()} => #{ingles()}"
  end

  def ==(outro_card)
    portugues() == outro_card.portugues() &&
    ingles() == outro_card.ingles()
  end

  def include?(texto)
    # true E false => false
    # true E true => true
    # false E false => false
    # true OU false => true
    # true OU true => true
    # false OU false => false
    # E => &&; OU => ||
    portugues().include?(texto) || ingles().include?(texto)
  end

end
