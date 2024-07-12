#Exercicio para casa - AULA 1 R 

#O código abaixo carrega uma base de dados de projetos do Banco Mundial. Sabendo 
#que a base de dados está ordenada em ordem crescente pelo valor corrente do projeto em USD, alocamos 
#a coluna com o nome dos projetos no objeto `project_name`.
#Sua tarefa é consultar a pergunta [How to access the last value in a vector?]
#(https://stackoverflow.com/questions/77434/how-to-access-the-last-value-in-a-vector)
#no StackOverflow e apresentar qual é o nome do projeto mais caro.
#Current Project Cost é o valor do proejto atual, fique atento pois existem valores NA. Você deve tratá-los!

wb <- read_csv2(here("data/WB_Projects_downloaded_9_13_2021.csv"))