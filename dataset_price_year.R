library(tidyverse)
library (readxl)
base_janeiro <- read.csv("Sales_January_2019.csv")
base_Fevereiro <- read.csv("Sales_February_2019.csv")
base_marco <- read.csv("Sales_March_2019.csv")
base_abril <- read.csv("Sales_april_2019.csv")
base_maio <- read.csv("Sales_may_2019.csv")
base_junho <- read.csv("Sales_june_2019.csv")
base_julho <- read.csv("Sales_july_2019.csv")
base_agosto <- read.csv("Sales_August_2019.csv")
base_setembro <- read.csv("Sales_September_2019.csv")
base_outubro <- read.csv("Sales_October_2019.csv")
base_novembro <- read.csv("Sales_November_2019.csv")
base_dezembro <- read.csv("Sales_December_2019.csv")

#Foi lido todos os meses para que a gente possa fazer em seguida o merge do ano
#E em seguida renomear as variaveis e tirar insights do dataset usado
