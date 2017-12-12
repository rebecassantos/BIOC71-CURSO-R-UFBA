######################################################
# Introducao Linguagem R
# Vitor Passos Rios
# Universidade Federal da Bahia
# https://github.com/vrios/Intro-Linguagem-R/wiki
#####################################################

#quando possivel, sua resposta deve ser um codigo do R

#####Trabalhando com dados#####
# o que e um dataframe? Qual a diferneca entre um dataframe e um list?
#dataframe e uma variavel que armazena valores que podem ser de tipos diferente. Entretanto, cada coluna armazena somente valores do mesmo tipo. Os dados sao bidimensionais. Ela difere de list, pois este e um vetor generico que contem outros objetos. 

#is antes e sempre uma pergunta
# o que as funcoes abaixo fazem? O que elas retornam?
is.vector() #verifica se e um vetor. Retorna TRUE se for  um vetor do modo especificado sem outros atributos que nÃ£o sejam nomes,ou retorna FALSE 
is.numeric() #testa se e um objeto do tipo numerico. Retorna TRUE ou FALSE
is.character(n) #testa ou cria um objeto do tipo 'character', ou seja, com letras. Retorna TRUE ou FALSE.
is.matrix(peso) #testa se e uma matriz com conjunto de valores. Neste caso, de peso. Retorna TRUE ou FALSE.
is.na() #funcao generica para indicar elementos faltantes. Retorna TRUE ou FALSE
is.data.frame() #funcao que checa se um objeto e um dataframe ou um coerce se possivel.Retorna TRUE se for um dataframe e FALSE se nao for. 


#o que queremos dizer quando dizemos uma funcao "retorna" alguma coisa? E o valor final que o R da depois de excetuar a ordem dada
#o que a funcao summary() faz? E uma funcao generica usada para produzir resumos de resultados de varias funcoes de criacao do modelo.Faz as estatisticas primarias do objeto.


#Tres areas foram submetidas aplicacao de tres adubos diferentes, e uma foi
#mantida como controle. A biomassa seca (kg) por parcela foi medida para
#verificar se houve efeito do adubo. Os dados obtidos foram:

#(Controle)	A	37	34	36	42	31  33
#B	62	54	57	64	60
#C	63	58	60	62	61 44
#D	41	37	38	49	35 49
#Crie um dataframe com estes dados

controleA = c(37, 34, 36, 42, 31, 33)
aduboB = c(62, 54, 57, 64, 60)
aduboC = c(63, 58, 60, 62, 61, 44)
aduboD = c(41, 37, 38, 49, 35, 49)

experimento = c(rep("controleA", 6), rep("aduboB", 5), rep("aduboC", 6), rep("aduboD", 6))
areas = data.frame(x = experimento, y = c("controleA", "aduboB", "aduboC", "aduboD"))
is.data.frame(areas)


#Calcule a media de cada tipo de adubo, sem usar summary(), usando o dataframe
#que voce criou acima
media.a=mean(objeto$coluna[objeto$colunadesejada == "a"]) #outra opcao

mean(controleA)
mean(aduboB)
mean(aduboC)
mean(aduboD)


#que problemas voce teve ao fazer o exercicio acima? O tratamento B possuia um elemento a menos que os outros

# O que a funcao unique() faz? # reconhece o objeto que aparece na coluna uma unica vez (ignora as repeticoes)

#Usando o conjunto de dados caixeta.csv, disponivel em
#http://ecologia.ib.usp.br/bie5782/doku.php?id=dados:dados-caixeta, calcule
#quantas especies estao presentes na coluna especie. Para ler o arquivo, execute
#o codigo abaixo

#Ha 43 especies 

caixeta = read.table("caixeta.csv", header=T, sep=",", as.is=T)
# o arquivo deve estar no seu diretorio de trabalho
str(caixeta) #o que este comando faz? - alternativa ao 'summary'. Exibe a estrutura interna de um objeto, mostrando apenas uma linha para cada estrutura, mostrando como eles estao organizados.
summary(caixeta)
species = (caixeta$especie)
unique(species)

#podemos criar uma coluna a mais no nosso dataframe apenas dizendo ao R o que
#colocar la. Por exemplo, criamos uma coluna com o nome do coletor do dado
caixeta$coletor= "Darwin" #regra da reciclagem
str(caixeta)

#agora adicione no objeto caixeta uma coluna chamada "desvio" com o quanto a
#altura de cada arvore difere da media de todas as arvores
caixeta$desvio = caixeta$h - mean(caixeta$h) #outra opcao

media.arvores = mean(caixeta$h)
media.arvores
dsv.h = caixeta$h -media.arvores
dsv.h
caixeta$desvio = dsv.h
head(caixeta)

#Usando a funcao table(), conte quantos individuos de cada especie existem
table(caixeta$especie)

#A funcao table() tambem pode contar por especie em cada local, depois por local
#em cada especie. Como?
table(caixeta$especie, caixeta$local)
table(caixeta$local, caixeta$especie)

#crie um objeto chamado pequenas que contenha todas as arvores com altura (h)
#menor que um metro.(Os dados no arquivo estao em centimetros)
pequenas = caixeta[caixeta$h < 100,]

pequenas = (caixeta$h < 100) #teste logico
pequenas
pequenas = caixeta[caixeta$h < 100, c(4, 6, 2)] #chamar algumas colunas

#crie um objeto chamado grandes que contenha todas as arvores acima de 3 metros
grandes = caixeta[caixeta$h > 300,]

#crie um objeto chamado medias que todas as arvores com alturas entre um metro e
#tres metros
medias = caixeta[caixeta$h >= 100 & caixeta$h <= 300,]

####agora em uma linha de comando, crie um objeto que contenha a quantidade de
#arvores pequenas, medias e grandes, separadamente
qtdd.arvores = c(length(pequenas$local), length(medias$local), length(grandes$local))
qtdd.arvores

#Crie um objeto chamado obj somente com os individuos de "Alchornea
#triplinervia" Em quantas localidades esta especie ocorre? Qual comando para
#encontrar essa informacao?
obj = caixeta [caixeta$especie == "Alchornea triplinervia",]
obj = caixeta [c(caixeta$especie == "Alchornea triplinervia")] #outra opcao
obj

table(obj$local) #Jureia (3) e Retiro (12)
unique(obj$local)

#podemos remover dados de um dataframe, usando o sinal de menos

caixeta.sem.tabebuia = caixeta[ - which(caixeta$especie=="Tabebuia cassinoides"),]
sort(unique(caixeta.sem.tabebuia$especie))

#agora crie um objeto removendo todas as "Tabebuia cassinoides" do local retiro
#(somente do local retiro)

cx.s.retiro = caixeta[ !c(caixeta$local == "retiro" & caixeta$especie == "Tabebuia cassinoides"),]
cx.s.retiro
unique(cx.s.retiro$local == "retiro")

#crie os objetos abaixo, junte eles num dataframe de duas colunas chamado comNA,
#depois crie um novo objeto chamado semNA, removendo todas as linhas que
#contenham NA, usando a notacao acima (dica: so se usa "" para valores do tipo
#character)
id = 1:80
a = c(121.72355, 103.79754, 130.15442, 98.29305, 103.43365, 102.44998, NA, 111.07215, 113.74047, 103.16081, 80.87149, 98.66692, 65.09549, 155.74965, 88.30168, 147.43610, 114.60806, 109.87433, 149.54772, 83.54137)
b = c(77.91352, 78.07251, 81.95604, 75.64862, 78.45213, 79.11058, 79.98952, 79.18127, 840.1635, 74.86860, 82.01886, 78.26936, 77.94691, 78.75372, 77.64901, NA, 77.19803, 72.48175, 83.45336, 78.99681)
c = c(127.9366, 201.7158, NA, 136.5880, 131.7213, 118.1486, 125.7534, 139.6544, 163.5890, 139.7455, NA, 141.4450, 110.7311, 157.5921, 176.8437, 102.8659, 121.8286, 134.7097, 157.1392, 166.7133)
d = c(191.3721, 216.1671, 165.4380, 196.2730, 172.6565, 178.2955, 193.6687, NA, 160.2968, 208.4400, 204.0934, 208.1798, 186.6380, 193.9446, NA, 198.6853, 213.8838, 210.1881, 209.9109, 210.9228)

comNA = data.frame (id, c(a, b, c, d))
View(comNA)

semNA = comNA[ !is.na(comNA$c.a..b..c..d.),]
View(semNA)
semNA = na.omit(comNA1) #outra opcao

#Abaixo temos dados de tamanho de mandíbula de chacal dourado. Crie um dataframe
#com esses dados. Qual a média por sexo? E para a espécie? Guarde estes valores
#em tres objetos diferentes.
#machos: 120 107 110 116 114 111 113 117 114 112
#femeas: 110 111 107 108 110 105 107 106 111 111 Quantos machos têm a mandíbula
#maior do que a média das fêmeas?
machos = c(120, 107, 110, 116, 114, 111, 113, 117, 114, 112)
femeas = c(110, 111, 107, 108, 110, 105, 107, 106, 111, 111)
chacais = data.frame(machos, femeas)
media.m = mean(machos)
media.f = mean(femeas)
media.sp = mean(c(machos,femeas))
machos.grandes = machos [machos > media.f]
machos.grandes2 = chacais$machos[chacais$machos > media.f]

#escreva **uma** linha de código que testa se um número é par, e caso seja,
#manda uma mensagem dizendo "par". dica: use a função %% (resto da divisão, ou
#remainder em inglês) e a função message()
if(par){message("par")}
if(8 %% 2 == 0){message("par")}

#agora crie um código  como acima, mas que diga "par" se for par e "impar" se
#for impar. Dica: leia sobre as funções else e ifelse
if(8 %% 2 == 0){message ("par")} else{message("impar")}

#crie um ciclo (for) que mostre o console todos os inteiros de 1 até 10, um por
#um
for(i in 1:10){
    message(i) 
}

#crie um ciclo (for) que some todos os inteiros de 25 até 43, guardando esses
#valores num objeto soma (dica: crie o objeto soma com valor zero antes do
#código do ciclo)
soma=0
for (i in 25:43) {
    soma = soma + i
message(soma)
}


#####Desafio level Hard#####
#Escreva um código que escreva os números de um a 100, com as seguintes
#condições: Se o número for multiplo de 3, ao invés do dígito, escreva "Fu". Se
#o número for múltiplo de 5, ao invés do dígito, escreva "bá". Para números que
#forem multiplos tanto de 3 quanto de 5, escreva "Fubá". A melhor solução ganha
#um chocolate

for (i in 1:100) {
  if(i %% 3 == 0){message ("Fu")}
  if(i %% 5 == 0){message ("bá")}
  if(i %% 3 & i %% 5 == 0){message ("Fubá")} else{message(i)}
}

