#### Aluna: Rebeca Santos ####

media <-function(x)
{
  soma=sum(x)
  nobs=length(x)
  media=soma/nobs
  return(media)
} #cria a funcao 'media'

ls() #lista os objetos presentes na media
media #mostra como esta organizada a funcao
media() #Error in media() : argument "x" is missing, with no default
dados=rnorm(20,2,1) #cria o objeto 'dados', com uma sequencia de 20 elementos, media=2 e sd=1
media(dados) #retorna o valor da funcao 'media' para o objeto 'dados'
dados1=rnorm(200,2,1) #cria o objeto 'dados1', com uma sequencia de 200 elementos, media=2 e sd=1
media(dados1) #retorna o valor da funcao 'media' para o objeto 'dados1'
dados2=(rnorm(10000,2,1)) #cria o objeto 'dados2', com uma sequencia de 10000 elementos, media=2 e sd=1
media(dados2) #retorna o valor da funcao 'media' para o objeto 'dados2'
sd(dados) #retorna o desvio padrao para o objeto 'dados'
dados3=rnorm(20,2,0.01) #cria o objeto 'dados3', com uma sequencia de 20 elementos, media=2 e sd=0.01
media(dados3) #retorna o valor da funcao 'media' para o objeto 'dados3'
dados4=rnorm(200,2,0.01) #cria o objeto 'dados4', com uma sequencia de 200 elementos, media=2 e sd=0.01
media(dados4) #retorna o valor da funcao 'media' para o objeto 'dados4'
dados[2]<-NA #coloca um NA na segunda posicao da sequencia de 'dados'
dados #chama o objeto 'dados' com a alteracao do comando anterior
media(dados) #retorna o valor NA como resultado da funcao 'media' para o objeto 'dados' apois modificacao, pois a funcao nao le NA

media<-function(x,rmNA=TRUE)  
{
  if(rmNA==TRUE)
  {
    dados=(na.omit(x))
    n.NA=length(x)-length(dados)
    cat("\t", n.NA," valores NA excluídos\n")
  }
  else
  {
    dados=x
  }
  soma=sum(dados)
  nobs=length(dados)
  media=soma/nobs
  return(media)
} #cria uma modificacao na funcao 'media'. Retorna uma mensagem para o valor de NA

media(dados) #retorna o valor da funcao 'media' para os dados do objeto 'dados' excluindo os valores de NA

var.curso<-function(x)
{
  media=media(x)
  dados=na.omit(x)	
  disvquad=(dados-media)^2
  var.curso=sum(disvquad)/(length(dados)-1)
  return(var.curso)
} #cria a funcao 'var.curso' para calcular a variancia

var.curso(dados) #retorna a variancia do objeto 'dados' excluindo os valores de NA
var(dados) #retorna a variancia do objeto 'dados' seguindo a funcao 'var' do R. Neste caso, le-se o NA ### dica: veja o help dessa função "help(var)"
var(dados,na.rm=TRUE) #retorna a variancia do objeto 'dados', excluindo NA quando ele esta presente na sequencia
var(dados,na.rm=FALSE)#retorna a variancia do objeto 'dados' sem excluir o NA

ID.curso<-function(x)
{
  id=var.curso(x)/media(x)
  return(id)
} #cria a funcao 'ID.curso' para calcular o padrao de distribuicao das amostras (aleatório, agregado ou uniforme)

aleat=rpois(200,2) #cria o objeto 'aleat' com uma sequencia de 200 dados de distribuicao aleatoria
aleat

unif=runif(200,0,4) #cria o objeto 'unif' com uma sequencia de 200 dados de distribuicao uniforme, no internvalo minimo de 0 e maximo de 4
unif #chama o objeto criado acima
unif=round(unif,0) #arredonda as 200 parcelas do objeto 'unif' para valores inteiros mais proximo
unif #retorna o objeto 'unif' com valores arredondados

agreg=round(c(runif(100,0,1),runif(100,5,10))) #cria o objeto 'agreg' para os dados combinados 'c(runif(100,0,1),runif(100,5,10)', fazendo uma distribuicao agregada
agreg #retorna os valores do objeto criado acima

ID.curso(aleat) #calcula o coeficiente de dispersao do objeto 'aleat' com distribuicao aleatoria

ID.curso(unif) #calcula o coeficiente de dispersao do objeto 'unif' com distribuicao uniforme

ID.curso(agreg) #calcula o coeficiente de dispersao do objeto 'agreg' com distribuicao agregada
#Todos os comandos acima excluem os valores de NA

test.ID <- function(x, nsim=1000)
{ 
  ID.curso=function(x){var(x)/mean(x)}# essa função precisa das funcoes media e ID.curso
  dados=na.omit(x)
  ndados=length(dados)
  med=mean(dados)
  id=var(dados)/med
  simula.aleat=rpois(length(dados)*nsim, lambda=med)
  sim.dados=matrix(simula.aleat,ncol= ndados)
  sim.ID=apply(sim.dados,1,ID.curso)
  quant.ID=quantile(sim.ID, probs=c(0.025,0.975))
  if(id>=quant.ID[1] & id<=quant.ID[2])
  { 
    cat("\n\n\n\t distribuição aleatória para alfa=0.05 \n\t ID= ",id,"\n\n\n")
  }
  if(id < quant.ID[1]) 
  { 
    cat("\n\n\n\t distribuição uniforme, p<0.025 \n\t ID= ",id,"\n\n\n")
  }
  if(id>quant.ID[2])
  { 
    cat("\n\n\n\t distribuição agregado, p>0.975 \n\t ID= ",id,"\n\n\n")
  }
  resulta=c(id,quant.ID)
  names(resulta)<-c("Indice de Dispersão", "critico 0.025", "critico 0.975")
  return(resulta)
} #cria a funcao 'test.ID' para calcular o teste de significancia do ID

test.ID(aleat) #retorna os dados abaixo, para a significancia dos valores simulados do objeto 'aleat' 
# distribuição agregado, p>0.975 , ID=  3.404706 , 
#Indice de Dispersão       critico 0.025       critico 0.975 
#3.4047062           0.8188279           1.2124051 
test.ID(agreg)#retorna os dados abaixo, para a significancia dos valores simulados do objeto 'agreg' 
#distribuição agregado, p>0.975 , ID=  3.404706 , 
#Indice de Dispersão       critico 0.025       critico 0.975 
#3.4047062           0.8188279           1.2124051
test.ID(unif)#retorna os dados abaixo, para a significancia dos valores simulados do objeto 'unif' 
#distribuição uniforme, p<0.025 , ID=  0.7944068 , 
#Indice de Dispersão       critico 0.025       critico 0.975 
#0.7944068           0.8284496           1.2051707 

eda.shape <- function(x)
{
  x11() #abre uma janela extra
  par(mfrow = c(2,2))	#muda o dispositivo grafico para 2x2
  hist(x) #produz histograma de x
  boxplot(x) #produz boxplot de x
  iqd <- summary(x)[5] -	summary(x)[2] #faz a diferenca entre o quinto elemento x e o segundo
  plot(density(x,width=2*iqd),xlab="x",ylab="",type="l") #produz grafico de densidade
  qqnorm(x) #produz grafico QQNorm
  qqline(x) #produz linha no grafico
  par(mfrow=c(1,1)) #muda o dispositivo grafico para 1x1
  
} #cria a funcao 'eda.shape' com os parametros acima

#Abaixo, dados simulados com 20 valores simulando a densidade de arvores por parcelas
set.seed(22) #estabelece uma semente aleatoria 
dados.pois20<-rpois(20,lambda=6) #sorteia dados aleatorios de uma funcao poisson com media 6 (lambda)
sum(dados.pois20) #a somatoria aqui sempre dara 131, somente porque a semente e a mesma
set.seed(22) #estabelece uma semente aleatoria
dados.norm20<-rnorm(20,mean=6, sd=2) #sorteia 20 dados de uma funcao normal com media 6 e sd = 2
sum (dados.norm20) #aqui o resultado dara sempre 130.48

eda.shape(dados.pois20) #aplica eda.shape para dados.pois20
eda.shape(dados.norm20) #aplica eda.shape para dados.norm20

eda.shape(rpois(500,6)) #aplica eda.shape no poison aumentado para 500 parcelas e lambda = 6
eda.shape(rnorm(500,6)) #aplica eda.shape na normalidade aumentada para 500 parcelas e lambda = 6

eda.shape1 <- function(x)
{
  x11() #abre uma janela extra
  par(mfrow = c(2,2)) #muda o dispositivo grafico para 2x2
  hist(x,main="Histograma de x") #produz histograma de x
  boxplot(x, main="BoxPlot de x") #produz boxplot de x
  iqd <- summary(x)[5] -	summary(x)[2] #faz a diferenca entre o quinto elemento x e o segundo
  plot(density(x,width=2*iqd),xlab="x",ylab="",type="l", main="Distribuição de densidade de x") #produz grafico de densidade, com modificacoes nos parametros
  qqnorm(x,col="red",main="Gráfico Quantil x Quantil",xlab="Quantil Teórico",ylab="Quantil da Amostra")  #produz grafico QQNorm, com modificacoes nos parametros
  qqline(x) #produz linha no grafico
  par(mfrow=c(1,1)) #muda o dispositivo grafico para 1x1
  
} #modifica a funcao 'eda.shape' para 'eda.shape1'

eda.shape1(rnorm(500,6)) #aplica a funcao 'eda.shape1' na normalidade aumentada para 500 parcelas e lambda = 6

x1=rpois(20,1) #cria o objeto 'x1' no poison com 20 parcelas e mean = 1
x2=rpois(20,2) #cria o objeto 'x2' no poison com 20 parcelas e mean = 2
x3=rpois(20,3) #cria o objeto 'x3' no poison com 20 parcelas e mean = 3
x4=rpois(20,1) #cria o objeto 'x4' no poison com 20 parcelas e mean = 1
sp.oc=matrix(c(x1,x2,x3,x4), ncol=4) #cria o objeto 'sp.oc' com uma matriz de 4 colunas
colnames(sp.oc)<-c("plot A", "plot B", "plot C", "plot D") #da nome as colunas da matriz
rownames(sp.oc)<-paste("sp", c(1:20)) #da nome para as linhas da matriz, com repeticao de "sps", 1:20
str(sp.oc) #mostra a estrutura interna do objeto 'sp.oc'
dim(sp.oc) #mostra a dimensao do objeto 'sp.oc' com 20 linhas e 4 colunas
head(sp.oc) #retorna os seis primeiros elementos da matriz criada

n.spp<-function(dados)
{
  nplot=dim(dados)[2]
  resultados=rep(0,nplot)
  names(resultados)<-paste("n.spp", c(1:nplot))
  dados[dados>0]=1
  for(i in 1:(dim(dados)[2]))
  {
    cont.sp=sum(dados[,i])
    resultados[i]=cont.sp
  }
  return(resultados)
} #cria a funcao 'n.spp'para contar especies por parcelas

n.spp(sp.oc) #aplica a funcao 'n.spp' no objeto 'sp.oc', indicando o numero de especies por coluna

sim<-function(dados)
{
  nplot=dim(dados)[2]
  similar=matrix(1,ncol=nplot,nrow=nplot)
  rownames(similar)<-paste("plot", c(1:nplot))
  colnames(similar)<-paste("plot", c(1:nplot))
  dados[dados>0]=1
  for(i in 1:nplot-1)
  {
    m=i+1
    for(m in m:nplot)
    {
      co.oc=sum(dados[,i]>0 & dados[,m]>0)
      total.sp=sum(dados[,i])+sum(dados[,m])-co.oc
      similar[i,m]=co.oc/total.sp 
      similar[m,i]=co.oc/total.sp 
    }
    
  }
  return(similar)
} #cria a funcao 'sim'para calcular a similaridade entre os dados

sim(sp.oc) #aplica a funcao 'sim' para o objeto 'sp.oc'

#### Exercicios 9 ####
#9.1 - Funcoes simples (notaR)

#9.2 - Analise exploratoria simultanea de duas variaveis
#saída (return) deve apresentar o sumário das duas variáveis e o coeficiente de correlação.

analise.expl <- function(x, y)
{
  if(length(x) != length(y)){message ("Verificar dados")}
  x11() #abre uma janela extra
  par(mfrow = c(2,2))	#muda o dispositivo grafico para 2x2
  boxplot(x, main = "Variavel X") #produz boxplot de x
  boxplot(y, main = "Variavel Y") #produz boxplot de y
  iqd <- summary(x)[5] -	summary(x)[2] #faz a diferenca entre o quinto elemento x e o segundo
  plot(density(x,width=2*iqd),xlab="x",ylab="",type="l", main="Distribuição de x") #produz grafico de densidade, com modificacoes nos parametros
  qqnorm(x,col="green", main="Gráfico Quantil x Quantil",xlab="Dados x",ylab="Dados y")  #produz grafico QQNorm, com modificacoes nos parametros
  qqline(x)
  par(mfrow=c(1,1)) #muda o dispositivo grafico para 1x1
return(list(cor(x,y), summary))
}
analise.expl(x1, x2)

#9.3 - Indice de diversidade de especies (notaR)

#9.4 - Ultima Tarefa (Youtube)