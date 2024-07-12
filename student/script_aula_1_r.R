# Titulo: Introdução ao R e Rstudio
# Autora:  Mayres Pequeno
# Descrição: Esse é o primeiro script de linguagem R no Workshop da Secretaria Executiva de Planejamento e Gestão (SEPLAN/SEPLAGTD)

#Pacotes ----------------------------------------------------------------------

install.packages("tidyverse")
install.packages("here")
install.packages("magrittr")
install.packages("rio")
library(tidyverse)
library(here)
library(conflicted)
library(rio)


#Para a motivação
library(gganimate)
library(gapminder)
library(magrittr)
install.packages("conflicted")
install.packages("gganimate")
install.packages("gapminder")

#Motivação --------------------------------------------------------------------

ggplot(gapminder, aes(gdpPercap, lifeExp, size = pop, colour = country)) +
  geom_point(alpha = 0.7, show.legend = FALSE) +
  scale_colour_manual(values = country_colors) +
  scale_size(range = c(2, 12)) +
  scale_x_log10() +
  facet_wrap(~continent) +
  # Here comes the gganimate specific bits
  labs(title = 'Year: {frame_time}', x = 'GDP per capita', y = 'life expectancy') +
  transition_time(year) +
  ease_aes('linear')


#O R como Calculadora-----------------------------------------------------------

#adição
1 + 1

2 * 2 - (4 + 4)/ 2

#subtração
 4 - 2
 
 #multiplicação
 2 * 3
 
 # divisão
 5 / 3
 
 # potência
 
 4 ^ 2 

 # resto de uma divisão
 
 5 %% 3

 #parte inteira da divisão 
 
 5 %/% 3
 
 
 # Se você inserir um input que o R não reconhece ele mostrará uma mensagem de erro
 
 "5 % 2" # NÃO ENTRE EM PÂNICO!
 
 
 
 
#Objetos, Classes e Funções ------------------------------------------------------------
 
 # Salvando 4 am a
 a <- 4
 
 #Avaliando o objeto a
 a
 
 #Substituindo o objeto a
 a <- a * 5
 a <- a + 10
 a <- seq(a, 100, 5)
 View(a)
 

# Existem regras importantes para dar nomes a objetos. A mais importante é: o nome deve começar com uma letra.
# O nome pode conter números mas não começar em números
  
# Permitido para nominar objetos

x <- 1
 
x1 <- 2

objeto <- 3

meu_objeto <- 4

meu.objeto <- 5


#Não é permitido

"1x <- 1"
"_objeto <- 2"

# O R diferencia letras maiúsculas e minúsculas, isto é b é diferente de B.

b <- 2
B <- 3 


# Exercicio 1 ------------------------ 

#Qual a diferença entre os códigos abaixo?

#Code 1
33/11

#Code 2

divisão <- 33/11

# Porque "meu-objeto" não pode ser utilizado para criar um objeto? 
#O que significa a mensagem do erro resultante?

meu-objeto <- 1


# Classes

1 + 1

"a" + "b" # o operador + verifica que a e b não são números (ou que a classe não é númerica)
#ele devolve uma mensagem de erro

a <- 1

a

"a"


#Para conhecer a classe de um objeto, basta rodarmos class()


x <- 1
class(x)

x <- "a"

class(x)


class(mtcars)

# As classes mais básicas dentro do R são

# - numeric (número, valor real, numeric, double)
# - character (texto, string, character, caracteres)
# - logical (lógico, logical, booleano, valor TRUE/FALSE)

# Valores Especiais

vetor <- c(1, 2, 3)

vetor[4]

# Esse valor, o NA, é tratado de forma especial no R. 
#Ele representa a ausência de informação, isto é, a informação existe, mas nós (e o R) não sabemos qual é.


#O NA para o R nada mais é do que o valor faltante ou omisso da Estatística. O famoso missing. 
#Geralmente, quando temos uma base com valores faltando, como a idade para alguns indivíduos da nossa amostra, 
#não significa que a idade deles não existe. Significa apenas que não temos essa informação.

#Vamos entender melhor,
"5 == NA"


idade_ana <- 30
idade_beto <- NA
idade_carla <- NA

idade_ana == idade_beto


idade_beto == idade_carla

#Eu posso saber a idade da Ana, mas se eu não souber a idade do Beto, 
#não sei se os dois tem a mesma idade. 

#Mas e quando queremos saber se um objeto é NA ou não?

is.na(NA)

is.na(c(idade_ana, idade_beto, idade_carla))

#Assim como o NA, existem outros valores especiais muito comuns no R.

#O NaN (not a number) representa indefinições matemáticas,  o Inf (infinito) e o NULL (nulo)


# Exercicio 2 ------------------------ 

#Guarde em um objeto chamado "nome" uma string contendo o seu nome completo


# Guarde em um objeto chamado "cidade" o nome da cidade onde você mora


#Guarde em um objeto chamado "estado" o nome do estado onde você

paste (cidade, estado)

paste (cidade, estado, sep = " - ")



# Vetores

# o R só entenderá que você está compilando uma sequencia de elementos se você usar
# o "c" minusculo à frente do vetor em formação

numeros <- c(1, 4, 10, pi, 1/3)
class(numeros)
texto <- c("a", "b", "GGPLAN", "NGI", "REDE GOVERNANCA")
tudo_junto <- c(numeros, texto) # tudo entre parênteses para mostrar  conteúdo do objeto
View(tudo_junto)
class(tudo_junto) #tudo se tornou caractere


# Note que, quando juntamos números e texto, **todos os elementos viram texto**. 
# Vamos tratar das particularidades de texto mais para a frente.


# Funções

#Enquanto vetores são nomes que guardam valores, funções no R são nomes que guardam um código de R.


# O principal uso das funções é automatizar operações que, se fossem feitas 
# manualmente, demorariam muito tempo, estariam sujeitas a erros ou simplesmente 
# seriam muito tediosas.


?mean

mean(1:1000)

#Um função recebe argumentos e executa sobre ou a partir deles e devolve um resultado

# Mas e se eu quisesse tirar a média dos números ímpares de 1 a 1000? Teria que digitar os números um a um?

# Nesses momentos é bom lembrar que a **preguiça** é um dos traços que separam os bons programadores dos demais. 
#Quase todas as tarefas tediosas e repetitivas na programação podem ser automatizadas de alguma maneira.

# Obviamente, o R tem a função `seq()` que nos permite criar um vetor de números ímpares. 
#Note como são utilizados os argumentos da função.
?seq

impares <- seq(from = 1,  to = 1000,  by = 2)
mean(impares)

# O R vem pré-instalado com diversas funções estatísticas, afinal, essa é uma de suas razões de existir. 
#Além da função `mean()`, que vimos no slide anterior, podemos olhar também para outras estatísticas descritivas


sd(impares) # desvio-padrão
var(impares) # variância
range(impares) # amplitude
IQR(impares) # intervalo interquartil
summary(impares) # nos dá uma visão geral sobre esse vetor


# O objeto mais importante para cientistas de dados é, claro, a base de dados. No R, uma base de dados
# é representada por objetos chamados data frames.


#PAUSA
#DataFrames, Operadores Lógicos e o Pipe------------------------------------------------------------

nomes <- c("Carlos", "Davi", "Ana", "Pedro")
formacao <- c("Ciência Política", "Direito", "Tecnologia da Informação", "Jornalismo")
tempo_empresa <- c(3, 10, 10, 1)

equipe <- data.frame(nomes, formacao, tempo_empresa)

nrow(equipe) # número de linhas
ncol(equipe) # número de colunas
head(equipe) # primeiras obs
summary(equipe) # resumo dos dados


# As ferramentas que vamos ver agora servem para "pinçar" informações que estão na 
# memória do R. Voltando ao vetor de números ímpares que criamos mais cedo, suponha 
# que eu queira saber o valor do 287º elemento

impares <- seq(from = 1,  to = 1000,  by = 2)
impares[287] #posição na lista

impares[c(1, 76, 48)] # seleção de diversos números
impares[-c(1:250)] # todos os números menos os 250 primeiros
impares[impares > 900] # apenas valores maiores que 900


#Listas e Subsetting para Data Frames

equipe[1, 3] # linha 1, coluna 3
equipe[1,] # retorna toda a linha 1
equipe[,3] # retorna toda a coluna 3
equipe[,c(1, 3)] # retorna as colunas 1 e 3


# A diferença é que, com dataframes, é muito comum utilizarmos o operador `$` para selecionar colunas

equipe$tempo_empresa # seleciona a variável "tempo de empresa"
equipe[,3] # mesmo resultado


mtcars

# O matcars é um dataframe nativo do R, que contém inforamções sobre diversos modelos de carros;
#Ele possui 32 linhas e 11 colunas;

#Daqui a pouco aprenderemos a selecionar, criar e modificar colunas, filtar e ordenar linhas, juntar dois data frames
#E assim construir gráficos;

#Mas da mesma forma que é mais fácil fritar um ovo após saber o que é um fofo, uma frigideiro e um ovo
#vamos estudar devagar os componentes dos data frames


# Operadores Lógicos

# Para seleções mais complexas, é comum que se precise recorrer a operadores lógicos.

equipe[equipe$tempo_empresa == 10,] # apenas as pessoas com 10 meses de empresa
equipe[equipe$tempo_empresa < 5,] # apenas as pessoas com menos de 5 meses de empresa
equipe[equipe$tempo_empresa < 5 | equipe$formacao == "Direito",] # menos de 5 meses de empresa OU fazem Direito
equipe[equipe$tempo_empresa > 2 & equipe$tempo_empresa < 5,] # entre 2 e 5 meses de empresa


#Pipe

# O operador %>% (pipi) foi uma das grandes revoluções recentes do R, tornando a escrita e leitura
# de cósigos mais compreensível.


#Vamos calcular a raiz quadrada da soma dos valores de 1 a 4. Primeiro sem o pipi.

x <- c(1,2,3,4)

sqrt(sum(x))

#Agora com o pipe
x %>% sum() %>% sqrt()


# O caminho do último código seguiu foi enviar o objeto X como argumento da função sum(), e em
#seguida, enivar a saida da expressão sum(x) como argumento da função sqrt()


#Exercicio 3 -----------------------------------
#Reescreva a expressao abaixo utilizando o %>% (pipe)

round(mean(sum(1:10)/3), digits = 1)


#Sem rodar, diga, qual a saida do código abaixo. Consulte o help das funções caso precise

2%>%
  add(2)%>%
  c(6, NA)%>%
  mean(na.rm = T)


#PAUSA
#Importando e Exportando Dados--------------------------------------------------------------------------------

# Exercicio 1 - Banco de Dados do Conselho Nacional de Justiça-----------------------------

# Um excelente pacote para auxiliar na tarefa de navegação no diretório do projeto é o pacote `here`. 
# 
# A função que dá nome ao pacote é usada para direcionar o seu programa à pasta correta no 
# diretório do projeto. Vejamos o exemplo: 

cnj <- read_csv2(here("data/tribunais_despesa_2019_cnj.csv"))

cnj <- as.data.frame(cnj)

cnj$dpj <- as.numeric(cnj$dpj)

# **Obs**: O Conselho Nacional de Justiça (CNJ) disponibiliza dados do Sistema de Estatísticas do Poder Judiciário.
# Os dados acima foram obtidos através de download e seleção das colunas com informações sobre os tribunais e suas despesas totais. 
#A coluna de despesa é indicada por "dpj"

glimpse(cnj) 

#Qual a soma de todas as despesas dos Tribunais no ano de 2019?

sum(cnj$dpj)

#Qual Tribunal tem a maior despesa?
max(cnj$dpj)

#Quais as depesas dos tribuanis de Pernambuco?
cnj[cnj$uf_sede == "PE",]


# ## Exportando dados
# 
# Suponha que após você carregar a base de dados, realizou tarefas que mudaram sua 
# configuração e você deseja salvá-las sem reescrever a base original.
# 

write_csv2(cnj, here("data/tribunais_despesa_2019_cnj_filter.csv"))


# Exemplo 2 - Populacao Jovem no Recife-------------------------------------


pop_faixa_etaria_censos <- import("data/POPULACAO_FAIXA_ETARIA_CENSOS.csv")


glimpse(pop_faixa_etaria_censos)

table(pop_faixa_etaria_censos$Idade)


#Quantos Jovens entre 15 anos temos ao longo dos anos do Censo na Cidade do Recife?

pop_faixa_etaria_censos[pop_faixa_etaria_censos$Idade == "15 anos",]


#Quantos Jovens entre 15 a 29 anos temos ao longo dos anos do Censo na Cidade do Recife?



