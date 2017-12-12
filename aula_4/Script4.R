######################################################
# Introdução Linguagem R                          ####
# Vitor Passos Rios                               ####
# Universidade Federal da Bahia                   ####
# https://github.com/vrios/Intro-Linguagem-R/wiki#####
######################################################

#diferencie a função source da função load() - A source executa todos os arquivos do diretorio, enquanto o load() coloca o conteúdo do arquivo para dentro do objeto.

#baixe para seu diretório de trabalho o arquivo toroidal.distance.R, disponível
#em https://raw.githubusercontent.com/vrios/Intro-Linguagem-R/master/arquivos/toroidal.distance.R, e o arquivo distancias.csv,
#disponivel em https://raw.githubusercontent.com/vrios/Intro-Linguagem-R/master/arquivos/distancias.csv
source("https://raw.githubusercontent.com/vrios/Intro-Linguagem-R/master/arquivos/toroidal.distance.R")
distancias = read.csv("https://raw.githubusercontent.com/vrios/Intro-Linguagem-R/master/arquivos/distancias.csv")
download.file("https://raw.githubusercontent.com/vrios/Intro-Linguagem-R/master/arquivos/toroidal.distance.R"), destfile = ("chuchu".r"")

#Abra toroidal.distances.R no R
# O que você precisa fazer para que as funções contidas nesse arquivo estejam disponíveis para uso no R? Usar o source()

# Faça o procedimento que você descreveu acima

# Dentro do script toroidal.distance.R, altere o nome da função toroidal.distances para distance.matrix
#(substitua o nome dentro do arquivo) e salve o arquivo

# Carregue o arquivo distancias.csv para dentro do objeto distancias
#chame a função distance.matrix() com o objeto distancias, e o argumento tam = 100
dir()
setwd("C:/Users/Edson LIma/Documents/R")
source("toroidal.distance.R")
a=distance.matrix(distancias, tam = 100)

# O que aconteceu? Abriu uma matriz onde os elementos estao dispostos de 10 a 10, de 1 até 100

# O que você precisa fazer para que você possa usar a função distance.matrix? Executar a funcao distance.matrix(distancias, tam = 100)

# Salve o resultado do comando acima com o nome de matriz.distancias.csv
write.csv(a, file = "matriz.distancias.csv")

# Usando a linha de comando, importe o arquivo dragoes.xsls para o objeto DnD
#https://raw.githubusercontent.com/vrios/Intro-Linguagem-R/master/arquivos/dragoes.xlsx
#(não abra o excel nem salve em .csv)
download.file("https://raw.githubusercontent.com/vrios/Intro-Linguagem-R/master/arquivos/dragoes.xlsx", destfile = DnD)
getwd()
setwd("C:/Users/Edson LIma/Documents/R")
DnD = ("dragoes.xlsx")
View(DnD)
DnD = read_xlsx("dragoes.xlsx")

# Confira a estrutura do arquivo

# Há algum NA? houve algum problema com o cabeçalho? Ha! O cabecalho apresentou acento na palavra 'dragão', espaço entre os nomes da coluna e parenteses. Alem disso, a primeira coluna (com NA) nao traz informacoes das medidas.

# Refaça o script da aula 2, salvando o objeto caixeta, adicionando
#a coluna coletor e desvio, em um arquivo chamado 
#caixeta_com_desvio.csv
caixeta = read.table("caixeta.csv", header=T, sep=",", as.is=T)
caixeta$coletor= "Darwin"
caixeta$desvio = caixeta$h - mean(caixeta$h)
caixeta
write.table(caixeta, "caixeta_com_desvio.csv")
