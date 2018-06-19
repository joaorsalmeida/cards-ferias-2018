class Card
  attr_reader :ingles
  attr_writer :ingles
  # quando tiver reader E writer, pode usar attr_accessor

  def initialize(port, ing = "")
    @portugues = port
    @ingles = ing
  end

  # podemos trocar por um attr_writer
  def portugues=(valor)
    @portugues = valor
  end

  #podemos trocar por um attr_reader
  def portugues()
    return @portugues
  end

  def imprimir()
    "Card: #{@portugues} => #{@ingles}"
  end

  def to_s
    imprimir()
  end

  def ==(outro_card)

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
