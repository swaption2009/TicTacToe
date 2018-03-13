class Player
  attr_accessor :name, :active, :sign

  def initialize(name, active, sign)
    @name = name
    @active = active
    @sign = sign
  end
end