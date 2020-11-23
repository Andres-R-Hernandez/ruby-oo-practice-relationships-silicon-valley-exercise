class Startup

  attr_accessor :name, :domain
  attr_reader :founder

  @@all = []

  def initialize(name, founder, domain)
    @name=name
    @founder=founder
    @domain=domain
    self.class.all << self
  end

  def self.all
    @@all
  end

  def pivot(domain,name)
    @domain=domain
    @name=name
  end

  def self.find_by_founder(founder)
    self.all.find{|startup|startup.founder==founder}
  end

  def self.domains
    self.all.map{|startups|startups.domain}
  end

  def sign_contract(venture_capitalist, type, investment)
    FundingRound.new(type, investment.to_f, self, venture_capitalist)
  end

  def find_funding
    FundingRound.all.select{|funding_round|funding_round.startup==self}
  end

  def num_funding_rounds
    find_funding.count
  end

  def total_funds
    find_funding.map{|funding_round|funding_round.investment}.sum
  end

  def investors
    find_funding.map{|FR|FR.venture_capitalist}.uniq
  end

  def big_investors
    big_investors = []
    startup_vcs = find_funding.map{|FR|FR.venture_capitalist}
    tc_vcs = VentureCapitalist.tres_commas_club
    startup_vcs.each do |startup_vcs|
      tc_vcs.each do |tc_vcs|
        if startup_vcs==tc_vcs
          big_investors << tc_vcs
      end
    end
    big_investors.uniq
  end

end
