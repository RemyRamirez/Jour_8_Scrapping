# Gem required
require 'rubygems'
require 'nokogiri'
require 'open-uri'

# =============== BEGINNING OF PROGRAM ==================


#Collect email in an url
def get_townhall_email(townhall_url)
    
    city=0
    cities_emails = []
    good_cities_emails = []
    cities_name = []
    good_cities_name = []


    while city<townhall_url.size do

    #scraping initialization
    page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/#{townhall_url[city]}"))   

    #Array good_cities_emails
    cities_emails << page.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]')
    good_cities_emails << cities_emails[city].text

    #Array good_cities_name
    cities_name << page.xpath('/html/body/div/main/section[1]/div/div/div/h1')
    good_cities_name << cities_name[city].text.to_s.gsub(" - ","").tr("0-9", "")
    
    city += 1
    end

    #Test Array good_cities_email
    puts "Number of good_cities_emails in the array : #{good_cities_emails.size}"
    puts "--> Test for the first value of the array good_cities_emails : #{good_cities_emails[0]}"
    puts "OK"
    puts

    #Test Array good_cities_name
    puts "Number of good_cities_name in the array : #{good_cities_name.size}"
    puts "--> Test for the first value of the array good_cities_name : #{good_cities_name[0]}"
    puts "OK"
    puts
    
    #Faire un hash et le mettre dans un tableau 
    a=[]
    i=0
    while i<good_cities_name.size do
        a << hash_cities = Hash[good_cities_name[i], (good_cities_emails[i])]
        i += 1
    end
        puts "Here is the array expected : #{a}"


end

#Get townhall urls
def get_townhall_urls
    #scraping initialization
    page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))   
    puts page.class   # => Nokogiri::HTML::Document

good_cities_urls = []

    #Array cities_urls
    cities_urls = page.xpath('//tr//td//p//a[@class="lientxt"]/@href')
    cities_urls.each do |link|
        link = link.to_s
        good_cities_urls << link[2..-1]
    end
    
    #Test Array good_cities_urls
    puts "Number of cities_urls in the array : #{good_cities_urls.size}"
    puts "--> Test for the first value of the array good_cities_urls : #{good_cities_urls[0]}"
    puts
    puts "Wait for it ...."
    puts

    return good_cities_urls
end

# =================== END OF PROGRAM ======================

def perform
    x =[]
    x = get_townhall_urls
    get_townhall_email(x)
end

perform


=begin

Methode 1 voir au dessus

Methode 2

def get_townhall_urls (cities_urls)
    #scraping initialization
    page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))   
    puts page.class   # => Nokogiri::HTML::Document

    #Array cities_urls
    cities_urls = page.xpath('//tr//td//p//a[@class="lientxt"]/@href')
    
    #Test Array cities_urls
    puts "Number of cities_urls in the array : #{cities_urls.size}"
    puts "--> Test for the first value of the array cities_urls : #{cities_urls[0]}"
    puts
    puts "OK"
    puts

    #Harmonization
    count=0
    good_cities_urls = []

    while count<cities_urls.size do
        good_cities_urls << cities_urls[count].text
        count += 1  
    end  

    #Test Harmonization
    puts "--> Test for the first value of the array cities_urls : #{good_cities_urls[0]}"
    puts "Number of currencies names in the new array : #{good_cities_urls.size}"
    puts
    puts "OK"
    puts

    return cities_urls
end


def perform
    x =[]
    get_townhall_urls(x)

    get_townhall_email(x)
end
perform

=end