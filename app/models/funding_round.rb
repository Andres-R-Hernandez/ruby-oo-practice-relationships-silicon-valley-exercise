class FundingRound

  attr_accessor :type
  attr_reader :startup, :venture_capitalist, :investment


  @@all = []

  def initialize(type, investment, startup, venture_capitalist)
    @type = type
    @startup = startup
    @investment = investment
    @venture_capitalist = venture_capitalist
    self.class.all << self
  end

  def self.all
    @@all
  end

  def investment=(investment)
    if investment <= 0
      0.0
    else
      @investment=investment.to_f
    end
  end

end
