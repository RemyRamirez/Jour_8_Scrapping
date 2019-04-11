require_relative '../lib/Townhall'


#Au final, une bonne solution pourrait être un mix des deux : 
# - vérifier que ton scrappeur récupère au moins x cryptomonnaies
# (comme ça, t'es pas à une près)
# - vérifier la présence de 2-3 cryptomonnaies phares 
# (avec un cours non Nil et non nul).

describe "Scrap url from a website" do
  
  it "extracts the url of the townhall" do
    expect(get_townhall_urls()).to eq(true)
  end
end

describe "Scrap email and name of the townhall in a hash" do
  
    it "extracts at least 2000 currencies" do
      expect(get_townhall_email(test)).to eq(true)
    end
  end