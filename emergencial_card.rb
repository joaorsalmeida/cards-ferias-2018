require_relative 'card'

class EmergencialCard < Card
  attr_reader :emergency_message, :emergency_phone

  def initialize(p, i = "")
    super(p, i)
    @emergency_phone = "193"
    @emergency_message = "Emergencia? Ligue para os bombeiros!"
  end

  def to_s()
    "#{super()}\n#{emergency_message()} #{emergency_phone()}"
  end
end
