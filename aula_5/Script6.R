#### Discente: Rebeca Silva Santos ####

aves.c <- read.table("aves_cerrado.csv", row.names=1, header=T, sep=";", dec=",", as.is=T) #cria um objeto com os dados do arquivo
aves.c <- read.csv2("aves_cerrado.csv", row.names=1, as.is=T) #outra forma de carregar arquivo em formato csv

# Diferentes formas de Verificação inicial do data frame.
head(aves.c)
tail(aves.c)
str(aves.c)
summary(aves.c)

aves.c[aves.c$urubu==NA,]
#nao executa.O teste logico para NA e feito pela funcao 'is.na'
is.na(aves.c) #testa a presenca de NA no objeto 'aves.c'
is.na(aves.c$urubu) #testa a presenca de NA na coluna 'urubu'

aves.c[is.na(aves.c$urubu),] #mostra os demais valores das colunas para a linha que tem o NA em 'urubu'
aves.c[is.na(aves.c$urubu)|is.na(aves.c$carcara)|is.na(aves.c$seriema),] #mostra os valores de NA das colunas de uma vez só

temp1 <- aves.c[is.na(aves.c$urubu)|is.na(aves.c$carcara)|is.na(aves.c$seriema),] #cria um objeto temporário
aves.c$urubu[is.na(aves.c$urubu)] <- 0 #corrige o valor de NA por 0 na coluna 'urubu'
aves.c[is.na(aves.c$urubu),2] <- 0 #corrigr o valor de NA por 0, a partir da indicacao da posição da coluna
aves.c[is.na(aves.c[,2]), 2] <- 0 #corrigr o valor de NA por 0, a partir da indicao da posição da coluna
aves.c$carcara[is.na(aves.c$carcara)] <- 0 #corrige o valor de NA por 0 na coluna 'carcara'
aves.c$seriema[is.na(aves.c$seriema)] <- 0 #corrige o valor de NA por 0 na coluna 'seriema'

aves.c[aves.c$urubu==0|aves.c$carcara==0|aves.c$seriema==0,]
temp1 #resgata o objeto 'temp1', o que mostra que o valor "0" so foi substituída para a coluna 'urubu'

table(aves.c$fisionomia) #tabula os dados da coluna 'fisionomia'
aves.c$fisionomia[aves.c$fisionomia=="ce"] <- "Ce" #corrige o erro, trocando 'ce' por 'Ce'
table(aves.c$fisionomia) #tabula os dados da coluna 'fisionomia' com as correções feitas para 'Ce'

aves.c$fisionomia <- factor(aves.c$fisionomia, levels=c("CL","CC","Ce")) #converte a coluna 'fisionomia' para um fator organizado por níveis do mais aberto para o menos
str(aves.c) #verifica a estrutura dos dados
summary(aves.c) #resumo dos dados, suas medias e medianas

#Média, Mediana e Quantis
mean(aves.c[,2:4]) #calcula a media da coluna 2:4
sapply(aves.c[,2:4],mean) #calcula a media  da coluna 2:4, usando a funcao 'sapply'
sapply(aves.c[,2:4],median) #calcula a mediana  da coluna 2:4, usando a funcao 'sapply'

apply(aves.c[,2:4],2,median) #calcula a mediana da coluna 2:4, usando a funcao 'apply', especificando a margem 2 que corresponde a todas as colunas
apply(aves.c[,2:4], 2, mean, trim=0.1) #calcula a media truncada

quantile(aves.c$urubu) #o mesmo que o retornado pelo 'summary', mas nao e executado pela presenca dos NA
summary(aves.c$urubu)

quantile(aves.c$urubu, probs= seq(from=0,to=1,by=0.1)) #nao executa peka presenca dos NA
summary(aves.c[,2:4])

##Exploracao de uma Variavel Categorica
caixeta <- read.csv("caixeta.csv", as.is=T) #cria um objeto com os dados do arquivo 'caixeta.csv'
names(caixeta) #titulos das colunas
table(caixeta$especie) #tabula os valores coluna especie com o valor de quantas vezes aparece na tabela
sort(table(caixeta$especie), decreasing=T) #organiza os valores do maior para o menor

barplot(sort(table(caixeta$especie), decreasing=T)) #plota os valores das especies do maior para o menor
barplot(table(caixeta$local)) #plota a coluna 'local' em um grafico de barras

#Graficos para uma Variavel
par(mfrow=c(2,2)) #define a posicao dos graficos: duas linhas e duas colunas
boxplot(aves.c$urubu) #Bplota o boxplot da coluna 'urubu'
hist(aves.c$urubu) #plota o histograma da coluna 'urubu'
plot(density(aves.c$urubu)) #plota a densidade da coluna 'urubu'
stripchart(aves.c$urubu, method="stack")
par(mfrow=c(1,1)) #define a posicao dos graficos: uma linha e uma coluna

#Variações do Histograma
## Histograma com os valores(funcao rug)
hist(aves.c$urubu) #plota o histograma da coluna 'urubu'
rug(jitter(aves.c$urubu)) #nao ficou clara a funcao
rug(aves.c$urubu) #nao ficou clara a funcao
?rug

hist(aves.c$urubu, prob=T) #plota o histograma da coluna 'urubu'
lines(density(aves.c$urubu),col="blue") #insere uma linha de ajuste nao parametrica de densidade probabilística

hist(aves.c$urubu, prob=T) #plota o histograma da coluna 'urubu'
curve(expr = dnorm(x,mean=mean(aves.c$urubu),sd=sd(aves.c$urubu)),add=T, col="red") #insere a curva normal no histograma
plot(density(aves.c$urubu),col="blue", ylim=c(0,0.08)) #plota a curva de densidade
curve(expr = dnorm(x,mean=mean(aves.c$urubu),sd=sd(aves.c$urubu)),add=T, col="red") #plota a curva normal, baseada na media e desvio padrao

#table e aggregate
table(caixeta$especie,caixeta$local) #tabula a variavel 'especie' e 'local' (com suas frequencias)
caixeta.alt <- aggregate(caixeta$h, by=list(local=caixeta$local,especie=caixeta$especie),
                         FUN=mean) #cria o objeto 'caixeta.alt' em um data frame com a altura media de cada espécie por local 
caixeta.alt

#xtabs
Titanic.df <- read.csv("titanic.csv", as.is=T) #cria o objeto 'Titanic.df' com arquivo 'Titanic.csv'
Titanic.df 
xtabs(Freq~Sex+Survived, data=Titanic.df) #cria uma tabela de contigencia
?xtab
prop.table(xtabs(Freq~Sex+Survived, data=Titanic.df), margin=1) #resultado da tabela de contigencia em proporçao
?prop.table
xtabs(Freq~Class+Survived, data=Titanic.df) #cria uma tabela de contigencia
prop.table(xtabs(Freq~Class+Survived, data=Titanic.df), margin=1) #resultado da tabela de contigencia em proporçao
table(Titanic.df$Sex,Titanic.df$Survived)

#Formula Estatistica em Graficos
boxplot(urubu~fisionomia, data=aves.c) #plota o boxplot da coluna 'urubu' em funçao da 'fisionomia'
plot(seriema~urubu, data=aves.c, subset=fisionomia=="Ce") #plota a variável 'seriema' em funcao de 'urubu'

plot(seriema~urubu, data=aves.c, subset=fisionomia=="CC") #plota a variavel 'seriema' em funcao de 'urubu', quando a 'fisionomia' for 'CC'
plot(seriema~urubu, data=aves.c, subset=fisionomia!="CL") #plota a variavel 'seriema' em funcao de 'urubu', quando a 'fisionomia' for 'CL'

library(lattice)
?lattice
xyplot(seriema~urubu|fisionomia, data= aves.c) #plota a variavel 'seriema' em funcao de 'urubu', sob a condicionante 'fisionomia'

#O quarteto de Anscombe
data(anscombe) #carrega para a area de trabalho
ls() #carrega o objeto para o workspace
names(anscombe) #carrega para a area de trabalho

apply(anscombe[1:4], MARGIN=2, FUN=mean) #calcula a media das colunas 1:4
apply(anscombe[5:8], 2, mean) #calcula a media das colunas 5:8

apply(anscombe[1:4], 2, var)   #calcula a variancia das colunas 1:4
apply(anscombe[5:8], 2, var) #calcula a variancia das colunas 5:8

with(anscombe,cor(x1,y1)) #testa a relacao entre as variaveis
with(anscombe,cor(x2,y2)) #testa a relacao entre as variaveis
with(anscombe,cor(x3,y3)) #testa a relacao entre as variaveis
with(anscombe,cor(x4,y4)) #testa a relacao entre as variaveis

par(mfrow=c(2,2)) #abre quatro graficos em uma janela
plot(y1~x1, data=anscombe) #plota Y1 em funcao de X1
plot(y2~x2, data=anscombe) #plota Y2 em funcao de X2
plot(y3~x3, data=anscombe) #plota Y3 em funcao de X3
plot(y4~x4, data=anscombe) #plota Y4 em funcao de X4
par(mfrow=c(1,1)) #

par(mfrow=c(2,2)) #abre quatro graficos em uma janela
plot(y1~x1, data=anscombe,
     xlim=range(anscombe[,1:4]),ylim=range(anscombe[,5:8]))
abline(lm(y1~x1, data=anscombe))
plot(y2~x2, data=anscombe,
     xlim=range(anscombe[,1:4]),ylim=range(anscombe[,5:8]))
abline(lm(y2~x2, data=anscombe))
plot(y3~x3, data=anscombe,
     xlim=range(anscombe[,1:4]),ylim=range(anscombe[,5:8]))
abline(lm(y3~x3, data=anscombe))
plot(y4~x4, data=anscombe,
     xlim=range(anscombe[,1:4]),ylim=range(anscombe[,5:8]))
abline(lm(y4~x4, data=anscombe))
par(mfrow=c(1,1))

######################
#Cervejas
cervejas = c("chope","lata","garrafa","chope","garrafa", "garrafa","lata","lata","nenhuma","lata","garrafa","garrafa", "garrafa","lata","lata","lata","garrafa","lata","chope","nenhuma", "garrafa","garrafa","garrafa","chope","garrafa","garrafa","chope","garrafa","lata","lata")
cerveja.tab = table(cervejas)
cerveja.tab
barplot(cerveja.tab)
dotchart(as.vector(cerveja.tab), labels=names(cerveja.tab))
#Qual tem maior razão dado/tinta? Garrafa

#Caixetais
caixet = read.table("caixeta.csv", header=T, sep=",", dec=",", as.is=T)
caixet
hist(caixet$cap/2*pi)
caixeta.alt.arv = caixet[caixet$fuste == 1, -4]
caixeta.alt.arv
caixeta.distr.alt = aggregate(caixet$h, by=list(especie=caixet$especie, local=caixet$local, parcela=caixet$parcela,arvore=caixet$arvore), FUN=max)
caixeta.distr.alt

#Eucalyptus grandis
e.grandis <- read.table("egrandis.csv",sep=";",dec=".", header=T)
e.grandis
boxplot(dap~regiao,data=e.grandis)
boxplot(dap~rotacao,data=e.grandis)
boxplot(dap~regiao+rotacao,data=e.grandis)
qqnorm(e.grandis$ht)
qqline(e.grandis$ht)
hist(e.grandis$ht, prob=T)
curve(dnorm(x,mean=mean(e.grandis$ht),
            sd=sd(e.grandis$ht)),add=TRUE,col="red")