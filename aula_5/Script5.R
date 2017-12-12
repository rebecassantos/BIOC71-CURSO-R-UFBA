############## Aluna: Rebeca Santos ##############
riqueza <- c(15,18,22,24,25,30,31,34,37,39,41,45) #carrega os dados do objeto 'riqueza'
area <- c(2,4.5,6,10,30,34,50,56,60,77.5,80,85) #carrega os dados do objeto 'area'
area.cate <- rep(c("pequeno", "grande"), each=6) #repete os nomes 'pequeno' e 'grande' seis vezes no objeto 'area.cate'

x11() #abre uma nova janela
plot(riqueza~area) #plota um grafico com x=area(0:80) e y=riqueza(15:45)
plot(area,riqueza) #o mesmo que o anterior
boxplot(riqueza~area.cate) #plota um grafico com boxplot dos dados
barplot(riqueza) #plota um grafico de barras

####
#dap e ht 
arv = read.csv("esaligna.csv") #le o arquivo em extensao csv
x11() #abre uma nova janela
plot(x= arv$dap, y=arv$ht) #plota um grafico de dispersao dos dados de 'dap' em funcao dos dados de 'ht'
boxplot(x= arv$dap, y=arv$ht) #plota um grafico de boxplot dos dados de 'dap' em funcao dos dados de 'ht'
barplot(arv$dap) #plota em grafico de barras os dados de 'dap'
barplot(arv$ht) #plota um grafico de barras com os dados de 'ht'
 
#ht e tronco
plot(x= arv$ht, y=arv$tronco) #plota o objeto com o plot dos dados de 'ht' em funcao dos dados de 'tronco'
boxplot(x= arv$ht, y=arv$tronco) #plota um grafico de boxplot com os dados de 'ht' em funcao de 'tronco'
barplot(arv$ht) #plota em grafico de barras os dados de 'ht'
barplot(arv$tronco) #plota em grafico de barras os dados de 'tronco'

#dap e classe
plot(x= arv$dap, y=arv$classe) #plota os dados de 'dap' em funcao de 'classe'
boxplot(x= arv$dap, y=arv$classe) #plota o grafico boxplot com os dados da coluna 'dap' em funcao da coluna 'classe'
barplot(arv$dap) #plota em grafico de barras os dados de 'dap'
barplot(arv$classe) #barplot e um vetor numerico, logo, nao le os elementos da coluna 'classe'

#dap e talhao
plot(x= arv$dap, y=arv$talhao) #plota os dados de 'dap' em funcao de 'talhao'
boxplot(x= arv$dap, y=arv$talhao) #plota o grafico boxplot com os dados da coluna 'dap' em funcao da coluna 'talhao'
barplot(arv$dap) #plota em grafico de barras os dados de 'dap'
barplot(arv$talhao) #plota em grafico de barras os dados de 'talhao'

#dap
plot(x= arv$dap) #plota um grafico dos valores de 'dap' em funcao das linhas do arquivo
boxplot(arv$dap) #plota o boxplot da coluna 'dap'
barplot(arv$dap) #plota o grafico de barras da coluna 'dap'

#ht
plot(x= arv$ht) #plota um grafico dos valores de 'ht' em funcao das linhas do arquivo
boxplot(arv$ht) #plota o boxplot da coluna 'ht' com outlier
barplot(arv$ht) #plota o grafico de barras da coluna 'ht'

par(las=1) #mantem a legenda dos eixos na posicao vertical
plot(riqueza~area, las=3) #modifica a posicao da legenda dos eixos para horizontal
par(cex=2) #modifica o tamanho da fonte das legendas no grafico
plot(riqueza~area, cex=4) #aumenta o tamanho/diametro dos pontos

####
?plot
riqueza <- c(15,18,22,24,25,30,31,34,37,39,41,45) #carrega os dados do objeto 'riqueza'
area <- c(2,4.5,6,10,30,34,50,56,60,77.5,80,85) #carrega os dados do objeto 'area'

x11()
plot(x = riqueza, y = area
, xlab = "Tamanho da Ilha (ha)" #muda o nome do eixo x para “Tamanho da Ilha (ha)"
, ylab = "Riqueza de Especies" #muda o nome do eixo y para “Riqueza de Espécies"
, main= "Aves das Ilhas Samoa" #muda o título do gráfico para “Aves das Ilhas Samoa”
, pch = 8 #muda o tipo de ponto (0:25)
, cex = 3 #muda o tamanho dos pontos e legendas
, las = 3 #muda a direcao da escala do gráfico para horizontal
, family = "serif" #muda o tipo de fonte das legendas para "Times New Roman"
)

####
par(mfrow=c(2,1)) #define dois gráficos num mesmo painel, duas linhas em uma coluna
plot(riqueza~area) #plota os dados do objeto 'riqueza' em funcao do objeto 'area'
boxplot(riqueza~area.cate) #plota em boxplot o objeto 'riqueza' em funcao do objeto 'area.cate'

par(mfrow=c(1,2)) #define dois gráficos num mesmo painel, uma linha e duas colunas
plot(riqueza~area) #plota os dados do objeto 'riqueza' em funcao do objeto 'area'
boxplot(riqueza~area.cate) #plota em boxplot o objeto 'riqueza' em funcao do objeto 'area.cate'

par(mfrow=c(2,1)) #define dois gráficos num mesmo painel, duas linhas em uma coluna
par(mar=c(4,14,2,6)) #define as margens do grafico
plot(riqueza~area) #plota os dados do objeto 'riqueza' em funcao do objeto 'area'
boxplot(riqueza~area.cate) #plota em boxplot o objeto 'riqueza' em funcao do objeto 'area.cate'

par(mfrow=c(1,2)) #define dois gráficos num mesmo painel, uma linha e duas colunas
par(mar=c(14,4,8,2)) #define as margens do grafico
plot(riqueza~area) #plota os dados do objeto 'riqueza' em funcao do objeto 'area'
boxplot(riqueza~area.cate) #plota em boxplot o objeto 'riqueza' em funcao do objeto 'area.cate'

par(mfrow=c(1,2))  #define dois gráficos num mesmo painel, uma linha e duas colunas
par(mar=c(8,4,8,1)) #define as margens do grafico
plot(riqueza~area) #plota os dados do objeto 'riqueza' em funcao do objeto 'area'
par(mar=c(14,2,4,0.5)) #define as margens do grafico
boxplot(riqueza~area.cate) #plota em boxplot o objeto 'riqueza' em funcao do objeto 'area.cate'

####
x11() #abre uma nova janela
plot(riqueza~area) #plota um grafico com x=area(0:80) e y=riqueza(15:45)

riqueza <- c(15,18,22,24,25,30,31,34,37,39,41,45) #carrega os dados do objeto 'riqueza'
area <- c(2,4.5,6,10,30,34,50,56,60,77.5,80,85) #carrega os dados do objeto 'area'
area.cate <- rep(c("pequeno", "grande"), each=6) #repete os nomes 'pequeno' e 'grande' seis vezes no objeto 'area.cate'
x11()
plot(riqueza~area) #plota um grafico com x=area(0:80) e y=riqueza(15:45)
plot(riqueza~area, bty="l", tcl=0.3) #plota o grafico anterior, onde 'bty' indica modificacao no formato da caixa em "l" e 'tcl' modifica o tamanho dos simbolos de pontuacao nos eixos
boxplot(riqueza~area.cate, bty="l", tcl=0.3) #plota o grafico em boxplot da 'riqueza' pela 'area.cate' onde 'bty' indica modificacao no formato da caixa em "l" e 'tcl' modifica o tamanho dos simbolos de pontuacao nos eixos

par(bty="l")
par(tcl=0.3)
boxplot(riqueza~area.cate)


####
riqueza <- c(15,18,22,24,25,30,31,34,37,39,41,45) #cria objeto com dados de 'riqueza'
area <- c(2,4.5,6,10,30,34,50,56,60,77.5,80,85) #cria objeto com dados de 'area'
abundancia <- rev(riqueza) #cria o objeto 'abundancia' com os dados invertidos de 'riqueza' 

plot(riqueza~area) #plota grafico de 'riqueza' pela 'area'
lines(lowess(area, riqueza)) #plota uma linha reta não-paramétricas no grafico, usando os valores da regressao polinomial ponderada local
model <-  lm(riqueza~area) #cria um objeto 'model' com os valores do modelo linear de 'riqueza' e 'area' 
plot(riqueza~area) #plota grafico de 'riqueza' pela 'area'
abline(model) #plota uma linha com intercepto e inclinação nao indicados, mas assumindo os valores dentro do objeto 'model'
plot(riqueza~area) #plota grafico de 'riqueza' pela 'area'
abline(15,0.4) #define os valores de intercepto e inclinacao (respectivamente) da reta plotada no grafico anterior
plot(riqueza~area) #plota grafico de 'riqueza' pela 'area'
abline(v=mean(area)) #plota uma linha vertical no grafico com o valor da media dos valores da 'area'
abline(h=mean(riqueza)) #plota uma linha horizontal no grafico com o valor da media dos valores da 'riqueza'
plot(riqueza~area) #plota grafico de 'riqueza' pela 'area'
text(20,40,"texto") #plota a palavra 'texto' na posicao x=20 e y=40
plot(riqueza~area) #plota grafico dos valores de 'riqueza' pelos valores da 'area'
mtext("legenda no lado errado" #plota o texto 'legenda no lado errado' na margem do grafico
      , side=4 #confere ao texto a localizacao do texto
      , line=0.9 #confere distancia de 0.9 afastada do eixo
      , at=20 #confere a posicao de alinhamento a direita do eixo
      , cex=2 #mofica o tamanho dos pontos
      , family="serif" #confere ao texto a fonte 'Times New Roman'
)

plot(riqueza~area) #plota grafico dos valores de 'riqueza' pelos valores de 'area'
par(new=TRUE) #plota um novo grafico em cima do grafico anterior
plot(abundancia~area) #plota os graficos dos valores de 'abundancia' pelos valores de 'area'

plot(riqueza~area) #plota grafico dos valores de 'riqueza' pelos valores de 'area'
par(new=TRUE) #plota um novo grafico em cima do grafico anterior
plot(abundancia~area #plota grafico dos valores de 'abundancia' pelos valores de 'area' sobreposto
     , axes=FALSE #suprime a criacao dos eixos do grafico citado
     , ann=FALSE #suprime a legenda da 'abundancia' no lado direito
     , pch=16 #exemplifica o tipo de ponto como uma bola fechada para os dados de 'abundancia~area'
)
axis(4) #plota o eixo y no lado direito (4) do grafico

plot(riqueza~area) #plota grafico dos valores de 'riqueza' pelos valores de 'area'
rect(20,20,40,40) #insere no grafico um retangulo nas posicoes citadas

jpeg(filename = "chuchu.jpg") #cria o nome do arquivo 'chuchu'
jpeg(filename = "chuchu.jpg", width = 480, height = 480, 
     units = "px", pointsize = 12, quality = 100,
     bg = "white",  res = NA, restoreConsole = TRUE) #salva em jpg o arquivo 'chuchu' nos parametros citados

par(mfrow=c(1,2))
par(mar=c(14,4,8,2))
plot(riqueza~area) 
boxplot(riqueza~area.cate)

dev.off() #fecha a funcao e salva o arquivo de figura na extensao desejada

png("meugrafico%02d.png") #salva uma sequência de gráficos sem precisar dar vários comandos de abertura de arquivos
bmp(filename = "Rplot%03d.bmp") #salva arquivo na extensao bmp, com o nome desejado
jpeg(filename = "Rplot%03d.jpg") #salva arquivo na extensao jpg, com o nome desejado
png(filename = "Rplot%03d.png") #salva arquivo na extensao png, com o nome desejado
tiff(filename = "Rplot%03d.tiff") #salva arquivo na extensao tiff, com nome desejado

#### Exercicio 5 ####
#1
arv = read.csv("esaligna.csv") #le o arquivo em extensao csv
x11()
par(cex = 2) #muda o tamanho das fontes do grafico
par(bty="l") #modifica dois eixos "l"
plot(x = arv$dap, y = arv$ht
     , xlab = "Valores de DAP" #muda o nome do eixo x para “Valores de DAP"
     , ylab = "Altura das arvores" #muda o nome do eixo y para “Altura das arvores"
     , main= "Biomassa de Eucalyptus saligna" #muda o título do gráfico para “Biomassa de Eucalyptus saligna”
    , tcl=0.3 #marca os eixos para dentro do grafico
)

#2
x11()
mean(arv$dap)
par(mfrow=c(1,2)) #define dois gráficos num mesmo painel, uma linha e duas colunas
boxplot(arv$dap~arv$talhao) #plota o grafico boxplot com os dados da coluna 'dap' em funcao da coluna 'talhao'
text(22,"a") #plota a palavra 'a' na posicao y=22

m1=mean(arv$dap[arv$talhao==16]);m2=mean(arv$dap[arv$talhao==17])
m3=mean(arv$dap[arv$talhao==18]);m4=mean(arv$dap[arv$talhao==22])
m5=mean(arv$dap[arv$talhao==23]);m6=mean(arv$dap[arv$talhao==32]
,na.rm = T)

s1=sd(arv$dap[arv$talhao==16]);s2=sd(arv$dap[arv$talhao==17])
s3=sd(arv$dap[arv$talhao==18]);s4=sd(arv$dap[arv$talhao==22])
s5=sd(arv$dap[arv$talhao==23]);s6=mean(arv$dap[arv$talhao==32],na.rm = T)
avg=c(m1,m2,m3,m4,m5,m6)
sdev=c(s1,s2,s3,s4,s5,s6)
x11()
plot(x= 1:6, y= avg,cex=1.5,pch=16, col=1:6,ylim=range(c(avg-sdev, avg+sdev)))
arrows(x0=1:6, y0=avg-sdev, x1=1:6, y1=avg+sdev, length=0.05, angle=90, code=3)
abline(h=mean(avg), col="red")#media total
text(20,"b") #plota a palavra 'b' na posicao y=20

#3
adv = read.csv("exercicio3.csv") #le o arquivo em extensao csv
x11()
par(mfrow=c(1,2))
par(cex=2)
