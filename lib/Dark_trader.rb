# Gem required
require 'pry'
require 'dotenv'
require 'twitter'
require 'backports/1.9.1/array/sample'
require 'rubygems'
require 'nokogiri'
require 'open-uri'
   
# =============== BEGINNING OF PROGRAM ==================

def crypto_scrapper
  #scraping initialization
  page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))   
  puts page.class   # => Nokogiri::HTML::Document

  #Array name with symbol
  crypto_names = page.xpath('//tr/td[3]')
  
  #Test Array name
  puts "Number of currencies names in the array : #{crypto_names.size}"

  #Array values
  crypto_values = page.xpath('//tr/td[5]')
  
  #Retirer le DOLLARS et les \n ! --> 2 méthodes testées sans succès
  
  #Test Array values
  puts "Number of currencies values in the array : #{crypto_values.size}"
  puts
  puts "OK"
  puts
  #Harmonization
  count=0
  good_crypto_names = []
  good_crypto_values = []

  while count<crypto_names.size do
    good_crypto_names << crypto_names[count].text
    good_crypto_values << crypto_values[count].text
    count += 1  
  end  
  
  #Test Harmonization
  puts "--> Test for the first value of the array good_crypto_names : #{good_crypto_names[0]}"
  puts "Number of currencies names in the new array : #{good_crypto_names.size}"

  puts "--> Test for the first value of the array good_crypto_values : #{good_crypto_values[0]}"
  puts "Number of currencies values in the new array : #{good_crypto_values.size}"
  puts
  puts "OK"
  puts

  #Faire un hash 
  hash_crypto = Hash[good_crypto_names.zip(good_crypto_values)]
  puts "Here is the Hash : #{hash_crypto}"
  
  #TEST return test = good_crypto_names.size,good_crypto_names.grep(/BTC/)]
  return test = good_crypto_names
end
# ======================= END OF PROGRAM ==========================

# ==================== BEGINNING OF TESTS ==========================

#Methode Test 1
def crypto_scrapper_test (x)
    if (x.grep (/(BTC)/) == true) && (x.grep (/(ETH)/) == true) && (x.grep (/(LTC)/) == true)
      return true
    end
end

#Methode Test 2
def crypto_scrapper_test2 (x)
    if x.size >= 2000
      return true
    end

end

# ==================== END OF TESTS ==========================


def perform
  crypto_scrapper
  x = test
  crypto_scrapper_test1(x)
  crypto_scrapper_test2(x)
end

perform

=begin
  ==> BIENVENU DANS LES MEANDRES DES TESTS <==

1)MARCHE : Extraire avec une crypto
--> crypto_name = page.xpath('//*[@id="id-bitcoin"]/td[3]')

2)BUG : Retirer le DOLLARS 
Methode 1 : crypto_values.gsub("$","")
Methode 2 : crypto_values.map! { |value| value.gsub("$","")}

=end