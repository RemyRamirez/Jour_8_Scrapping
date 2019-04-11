require_relative '../lib/Dark_trader'


#Au final, une bonne solution pourrait être un mix des deux : 
# - vérifier que ton scrappeur récupère au moins x cryptomonnaies
# (comme ça, t'es pas à une près)
# - vérifier la présence de 2-3 cryptomonnaies phares 
# (avec un cours non Nil et non nul).

describe "Scrap data from website and make a hash" do
  
  it "extracts at least 2000 currencies" do
    expect(crypto_scrapper_test2(test)).to eq(true)
  end

  it "return at least 3 well known currencies" do
    expect(crypto_scrapper_test1(["BTC","LTC"])).to eq(false)
    expect(crypto_scrapper_test1(["BTC","LTC", "ETH"])).to eq(true)
    expect(crypto_scrapper_test1(["BTC","LTC","ETH","EOS"])).to eq(false)

  end

end