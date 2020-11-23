class VentureCapitalist

  attr_accessor :name, :total_worth

  @@all = []

  def initialize(name,total_worth)
    @name=name
    @total_worth=total_worth
    self.class.all << self
  end

  def self.all
    @@all
  end

  def self.tres_commas_club
    self.all.select{|vc|vc.total_worth>1000000000}
  end

  def offer_contract(startup, type, investment)
    investment = investment.to_f
    FundingRound.new(type, investment, startup, self)

  end 

  def funding_rounds
    FundingRound.all.select { |venture| venture.venture_capitalist == self }
  end 

  def portfolio
    funding_rounds.map { |start| start.startup}.uniq
  end 

  def biggest_investment
    funding_rounds.map{ |biggest| biggest.investment}.max 

  end 

  # def invested(domain)
  #   #  funding_rounds.map{ |the_domain| the_domain.domain == domain }.map {|invested| invested.investment}.sum
  # end 

end
