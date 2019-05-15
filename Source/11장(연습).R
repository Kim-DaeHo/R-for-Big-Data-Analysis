#---------------------------------
# Web Scrawling
# https://medium.freecodecamp.org/an-introduction-to-web-scraping-using-r-40284110c848
#---------------------------------

install.packages('selectr')
install.packages('xml2')
install.packages('rvest')

install.packages('stringr')

install.packages('jsonlite')

library(xml2)
library(rvest)
library(stringr)

# Specifying the url for desired website to be scrapped : OnePlus 6T (Mirror Black, 6GB RAM, 128GB Storage)
url <- 'https://www.amazon.in/dp/B07DJD1Y3Q/ref=dp_prsubs_1'

#Reading the html content from Amazon
webpage <- read_html(url)
webpage

# scrape title of the product
title_html <- html_nodes(webpage, 'h1#title')
title_html <- html_nodes(webpage, 'title')
title <- html_text(title_html)
head(title)

# remove all space and new lines
str_replace_all(title, "[\r\n]" , "")

#--------------------------------------
# Price of the Product
#--------------------------------------

# scrape the price of the product
# price_html <- html_nodes(webpage, 'priceblock_ourprice')
# price_html <- html_nodes(webpage, 'a-price-whole')
price_html <- html_nodes(webpage, 'span#priceblock_ourprice')
price <- html_text(price_html)

# remove spaces and new line
str_replace_all(title, "[\r\n]" , "")

# print price value
head(price)

#--------------------------------------
# Product description
#--------------------------------------

# scrape product description
desc_html <- html_nodes(webpage, 'div#productDescription')
desc <- html_text(desc_html)

# replace new lines and spaces
desc <- str_replace_all(desc, "[\r\n\t]" , "")
desc <- str_trim(desc)
head(desc)


#--------------------------------------
# Rating of the product:
#--------------------------------------

# scrape product rating 
rate_html <- html_nodes(webpage, 'span#acrPopover')
rate <- html_text(rate_html)

# remove spaces and newlines and tabs 
rate <- str_replace_all(rate, "[\r\n]" , "")
rate <- str_trim(rate)

# print rating of the product
head(rate)

#--------------------------------------
# Size of the product:
#--------------------------------------

# Scrape size of the product
size_html <- html_nodes(webpage, 'div#variation_size_name')
size_html <- html_nodes(size_html, 'span.selection')
size <- html_text(size_html)

# remove tab from text
size <- str_trim(size)

# Print product size
head(size)

#--------------------------------------
# Color of the product:
#--------------------------------------

# Scrape product color
color_html <- html_nodes(webpage, 'div#variation_color_name')
color_html <- html_nodes(color_html, 'span.selection')
color <- html_text(color_html)

# remove tabs from text
color <- str_trim(color)

# print product color
head(color)

#--------------------------------------
# Combining all the lists to form a data frame 
#--------------------------------------
# Combining all the lists to form a data frame 
product_data <- data.frame(Title = title, Price = price,Description = desc, Rating = rate, Size = size, Color = color)
product_data

#Structure of the data frame
str(product_data)


#--------------------------------------
#
#--------------------------------------

# Include 'jsonlite' library to convert in JSON form.
library(jsonlite)

# convert dataframe into JSON format
json_data <- toJSON(product_data)

# print output
cat(json_data)