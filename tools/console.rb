require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

startup1 = Startup.new("startup1", "founder1", "domain1")
startup2 = Startup.new("startup2", "founder2", "domain2")
startup3 = Startup.new("startup3", "founder3", "domain1")

vc1 = VentureCapitalist.new("VC1",1000000005)
vc2 = VentureCapitalist.new("VC2",3748575943)
vc3 = VentureCapitalist.new("VC3",1228349)

funding_round1 = FundingRound.new("type1", 21231, startup1, vc2)
funding_round2 = FundingRound.new("type2", 143143123, startup2, vc3)
funding_round3 = FundingRound.new("type3", 1323, startup3, vc1)
funding_round4 = FundingRound.new("type4", 4324234, startup2, vc3)
funding_round5 = FundingRound.new("type5", 232332, startup2, vc2)
funding_round6 = FundingRound.new("type6", 6453453, startup3, vc2)
funding_round7 = FundingRound.new("type7", 4322, startup1, vc1)
funding_round8 = FundingRound.new("type8", 67455744, startup2, vc3)
funding_round9 = FundingRound.new("type9", 12, startup3, vc3)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line
