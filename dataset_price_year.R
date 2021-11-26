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

#Foi lido todos os meses para que a gente possa fazer em seguida o dataset ANO
#E em seguida renomear as variaveis e tirar insights do dataset usado

base_jan_fev <- bind_rows(base_janeiro,base_Fevereiro)
base_mar_abril <- bind_rows(base_marco,base_abril)
base_mai_jun <- bind_rows(base_maio,base_junho)
base_julho_agos <- bind_rows(base_julho,base_agosto)
base_set_out <- bind_rows(base_setembro,base_outubro)
base_nov_dez <- bind_rows(base_novembro,base_dezembro)

#Mais uma vez vou pegar os datasets e juntar para tirar alguns insights
#Por isso vou utlizar novamente o bindrows para juntar os datasets

base_1 <- bind_rows(base_jan_fev,base_mar_abril)
base_2 <- bind_rows(base_mai_jun,base_julho_agos)
base_3 <- bind_rows(base_set_out,base_nov_dez)

base_4 <- bind_rows(base_1,base_2)
base_ano <- bind_rows(base_4, base_3)

#Agora que já temos o dataset ano, podemos excluir as variaveis de junção
#Deixando apenas os datasets meses individuais e o ano.

rm(base_1,base_2,base_3,base_4)
rm(base_jan_fev,base_mar_abril,base_mai_jun,base_julho_agos)
rm(base_jan_fev_filter)
rm(base_nov_dez)
rm(base_set_out)
#Agora já podemos vê o nosso Environment mais limpo e objetivo
#Vamos verificar qual o produto que mais vendeu no ano 2019
#Pra isso precisaremos limpar algumas váriaveis e renomea-las para fazer a análise
#Também será necessario converter os valores que estão em caracteres

names(base_ano)
base_ano_clean <- base_ano %>% rename(id = "Order.ID",
                                      produto = "Product",
                                      quantidade ="Quantity.Ordered",
                                      preco = "Price.Each",
                                      data = "Order.Date",
                                      endereco ="Purchase.Address") %>% 
  select(produto,quantidade,preco)

view(base_ano_clean)     

#Após ter feito o rename e o select,é preciso converter o caracter para númerico
#Para isso iremos usar o as.numerico, para que em seguida possamos tirar métrica

base_num1 <- as.numeric(str_sub(base_ano_clean$quantidade,1,))
base_num2 <- as.numeric(str_sub(base_ano_clean$preco,1,5))
base_ano_clean <- base_ano_clean %>% mutate(quantidade_2 = base_num1,
                                            preco2= base_num2) %>% select(
                                              produto,quantidade_2,preco2)
base_ano_clean <- base_ano_clean %>% rename(quantidade="quantidade_2",
                                            preco="preco2")

#Após fazermos nossa conversão, agora podemos extrair informações com summarise
#E também poderemos respoder a primeira questão das perguntas feitas
