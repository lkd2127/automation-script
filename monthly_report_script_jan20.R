# About this file
## This is the automation script to generate the "Monthly Report". 
## Please follow below instructions and input necessary information to generate the report for the month

#-------------------------------------------------------------------------------

# Related files
## The report template: Template -- Monthly Report.rmd

## The input data files are required to generate report of the month - Note:
## The data files below need contain the same columns as stated in each file.

### 1- customers data (customer_id, age, gender, income, region), 
### 2- products data (category, product_id, price), 
### 3- transactions data (customer_id, product_id, price, quantity, time);
### 4- views data (customer_id, product_id, time).

  
#-------------------------------------------------------------------------------

# Report generating instructions 
  
#-------------------------------------------------------------------------------

## Environment set up
rm(list=ls())
setwd(getwd())

if (!require(data.table)) install.packages("data.table")
if (!require(DT)) install.packages("DT")
if (!require(scales)) install.packages("scales")
if (!require(ggplot2)) install.packages("ggplot2")

library(data.table)
library(DT)
library(scales)
library(ggplot2)
  
#-------------------------------------------------------------------------------

## 1 - Save this script, the report template and input data files in the same file 

## 2 - Input the required data below

### a.  Report general information

author_name <- "Linh Do" # Fill your name in "" as the report generator (e.g. "Linh Do")
report_name <- "January 2020 Monthly Report" #Fill in "" Month & Year of the report generated (e.g. "January 2020 Monthly Report")
the_year <- "2020" # Fill the year of the generating report 
the_month <- "01" # Fill the month of the generating report 

## b. Data
### Input the corresponding exact data file names showed in the file location where the all the related files are saved.

customers_data <- fread(input = "customers.csv")
products_data <- fread(input = "products.csv")
trans_data <- fread(input = "transactions -- January 2020.csv")
views_data <- fread(input ="views -- January 2020.csv")

## c. Generate the report
### Choose all this script, then clink "Run" button in the upper right corner to generate the report.

#-------------------------------------------------------------------------------
#---END---Do NOT modify any information below this line---

params <- list(author_name = author_name, 
               report_name = report_name, 
               customers_data = customers_data, 
               products_data = products_data,
               trans_data = trans_data, 
               views_data= views_data)

out_path <- sprintf("../Reports/Monthly Reports/%s/%s", the_year, the_month)

dir.create(path = out_path, showWarnings = F, recursive = T)

rmarkdown::render(input = "Template -- Monthly Report.Rmd", 
                  output_file = sprintf("%s/%s.html", out_path, report_name),
                  params = params)











