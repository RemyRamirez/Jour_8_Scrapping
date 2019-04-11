# Gem required
require 'rubygems'
require 'nokogiri'
require 'open-uri'

# =============== BEGINNING OF PROGRAM ==================

#Collect urls for the 577 french deputies
def deputy_information_url 

    #scraping initialization
    page = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr/deputes/liste/alphabetique"))   
    
    good_deputy_urls = []

    count=0

    #Array deputy_urls
    deputy_urls = page.xpath('//*[@id="deputes-list"]//*[@class="clearfix col-container"]//@href')
    

    #Test Array good_deputy_urls
    puts "--> Test for the first raw extraction for array deputy_urls : #{deputy_urls[0]}"
    puts "Number of deputy_urls in the array : #{deputy_urls.size}"
    puts
    puts "Ok we have the urls !"
    puts

    return deputy_urls

end


def deputy_name_and_email (deputy)
    #Test Array good_deputy_urls
    count2 = 0
    puts deputy[0]
    good_deputy_name = []
    good_deputy_email = []

    while count2<deputy.size do

        #scraping initialization
        page = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr/#{deputy[count2]}"))   

        #Array deputy_name
        deputy_name = page.xpath('//h1')
        good_deputy_name << deputy_name.to_s.gsub("<h1>","").gsub("</h1>","").gsub("M. ","").gsub("Mme ","")

        #Array deputy_email
        deputy_email = page.xpath('/html/body/div[3]/div/div/div/section[1]/div/article/div[3]/div/dl/dd[4]/ul/li[2]/a')
        good_deputy_email << deputy_email.text
    count2 += 1
    end

    #Test Array deputy_name
    puts "Let's find the name !"
    puts "=====>"
    puts "--> Test for the first raw extraction for array deputy_name : #{deputy_name[0]}"
    puts "Number of deputy_name in the array : #{deputy_name.size}"
    puts
    puts "Ok we have the name !"
    puts
    puts "=====>"
    puts "--> Test for the first raw extraction for array good_deputy_name : #{good_deputy_name[0]}"
    puts "Number of good_deputy_name in the array : #{good_deputy_name.size}"
    puts
    puts "Ok we have the name !"
    puts

    #Test Array deputy_email
    puts "Let's find the email !"
    puts "=====>"
    puts "--> Test for the first raw extraction for array deputy_email : #{deputy_email[0]}"
    puts "Number of deputy_email in the array : #{deputy_email.size}"
    puts
    puts "Ok we have the email !"
    puts
    puts "=====>"
    puts "--> Test for the first raw extraction for array good_deputy_email : #{good_deputy_email[0]}"
    puts "Number of good_deputy_email in the array : #{good_deputy_email.size}"
    puts
    puts "Ok we have the email !"
    puts

    #Faire un hash et le mettre dans un tableau 
    a=[]
    i=0
    while i<good_deputy_name.size do
        a << hash_cities = Hash[good_deputy_name[i], (good_deputy_email[i])]
        i += 1
    end
        puts "Here is the array expected : #{a}"

end


# ================= END OF PROGRAM ======================

def perform
    x = []
    x = deputy_information_url
    deputy_name_and_email (x)
end

perform