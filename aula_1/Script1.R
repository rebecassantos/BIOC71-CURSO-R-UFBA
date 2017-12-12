######################################################
# Introdução Linguagem R
# Vitor Passos Rios
# Universidade Federal da Bahia
# https://github.com/vrios/Intro-Linguagem-R/wiki
#####################################################

#####Usando o R como calculadora#####

#Digite no R os códigos abaixo.
#Dica: escreva neste arquivo, ao lado do comando, o que ele faz,
#como no exemplo abaixo

1 + 1 #soma os valores

# O símbolo # representa um comentário, isto é, tudo que vier à direita
# dele será ignorado quando o R ler o arquivo

34 - 72.3 #subtrai 72.3 de 34
34 - 72,3 #Error: unexpected ',' in "34 - 72"

# use pontos como separador de decimal. O que acontece se você usar virgula?
#quando usa a virgula aparece uma mensagem de erro

78 / 3 #divide 78 por 3
2 ^ 3 #eleva 2 a 3 potencia
3 * 2 #multiplica 3 por 2
sqrt(2) #calcula a raiz quadrada de 2
pi #da o valor de pi
log(x = 3,base = 10) #calcula o log de 3 na base 10
exp(x = 1) #calcula o exponencial de 1
#o que querem dizer estes valores dentro do parêntese? porque usamos o = aqui? Os valores dentro dos parenteses indicam o vetor. O = e um operador de atribuiçao

#####Atribuição de valores e criação de objetos#####
#O que os comandos abaixo fazem?
objeto1=3 #atribui ao 'objeto1' o valor de 3
objeto1 #mostra no console o valor atribuido a 'objeto1'
objeto = 42 #atribui ao 'objeto' o valor de 42
objeto #mostra no console o valor atribuido a 'objeto'
objeto.2 <- 42 #atribui ao 'objeto.2' o valor de 42
objeto.2 #mostra no console o valor atribuido a 'objeto.2'
# Os símbolos = e <- fazem basicamente a mesma coisa. Que coisa? Eles atribuem valores ao objeto
objeto.cubico <- objeto^3 #atribuiu ao 'objeto.cubico' o valor de 'objeto' elevado a 3 potencia
resultado.1 <- (objeto.cubico / 3) + 7 #atribui a 'resultado.1' a expressão que divide 'objeto.cubico' por 3 e soma a 7
objeto.texto <- "texto sempre vem entre aspas" #atribui a frase ao 'objeto.texto' e serve como lembrete
objeto.texto #mostra no console a frase atribuida a 'objeto.texto'
objeto.texto.2 <- "42" #atribui a 'objeto.texto.2' o numero 42 junto com as aspas

objeto.vetor.1 = 1:34 #atribui a 'objeto.vetor.1' os valores de 1 ate 34
objeto.vetor.1 #mostra no console os valores atribuidos pela funcao anterior
objeto.vetor2 = c(1, 74.5, 48) #cria a funcao combinada dos valores apresentados dentro dos parenteses
objeto.vetor2 #mostra no console os valores atribuidos a 'objeto.vetor2'

?seq #help da funcao 'seq' apresentada na tela na parte inferior direita da tela
objeto.vetor3 = seq(from = 20, to = 32, by = 0.5) #atribui a 'objeto.vetor3' os valores de 20 ate 32 de 0.5 em 0.5
objeto.vetor3

#podemos calcular estatísticas com o r
mean(objeto.vetor3) #media 
var(objeto.vetor3) #variancia
median(objeto.vetor3) #mediana
min(objeto.vetor3) #valor minimo do vetor (menor valor)
max(objeto.vetor3) #valor maximo do vetor (maior valor)
diff(objeto.vetor3) #calcula a diferença entre os elementos sucessivos do vetor

# R também faz comparações entre objetos
42 > 7 #42 é maior que 7
objeto == objeto.2 #ambos possuem o mesmo valor
objeto == objeto.texto.2 #embora existam aspas em 'objeto.texto.2' ambos possuem o mesmo valor
# o que aconteceu acima? Todas as sentenças são verdadeiras.
7.1 <= 7.001 #sequencia reconhecida como falsa
?"<" #mostrou na tela inferior do lado direito da tela qual a funcao do comando '<'

#pedindo ajuda
?pi #mostrou na tela inferior do lado direito da tela qual a funcao do comando 'pi'
?log #mostrou na tela inferior do lado direito da tela qual a funcao do comando 'log'
??lm #mostrou na tela inferior do lado direito da tela quais pacotes de dados possuem a funcao solicitada
help(log) #mostrou na tela inferior do lado direito da tela qual a funcao do comando 'log', desta vez atribuindo o comando 'help' em vez de ?
help.search("anova") #mostrou na tela inferior do lado direito da tela quais os pacotes que possuem a funcao 'anova'

#####Arquivos e diretórios#####
# Como voce descobre o diretorio de trabalho?
getwd() #Para mudar o diretorio setwd(): barra principal de ferramentas (clicar em [Tools]), depois clicar em [Global options …]. Mudar o diretorio clicando em [Browse].

# Como voce lista o conteudo do diretorio de trabalho?
dir() #lista o conteudo do diretorio, e possui varios argumentos para selecao. Informações sobre cada elemento do diretório podem ser obtidas com file.info()

# Como voce define o diretorio de trabalho?
setwd() #pode ser definido via Menu do Windows

# Como voce carrega um arquivo de script?
load()

# Como voce salva os objetos que criou?
save.image() #Ctrl+S ou clicando no disquete

# Como voce carrega os objetos que criou?
ls() #utiliza-se o nome do objeto para a visualiza��o
str(x)

# Como ver quais objetos estao na sua Area de trabalho?
history() #Ou clicando no botao "history"
environment() #Ou clicando no botao �nvironment

# Como remover objetos da Area de trabalho?
rm()
remove()

##### Lidando com erros#####
# O que acontece quando voce digita os comandos abaixo? Como consertar cada erro?
objetol #Error: object 'objetol' not found - Para consertar: verificar o nome do objeto
objeto .texto #Error: unexpected symbol in "objeto .texto" - Para consertar: remover o espaco excedente
Objeto #Error: object 'Objeto' not found - Para consertar: corrigir o nome do objeto criado ou usar somente letras minusculas
source("chuchu.R") #Error in file(filename, "r", encoding = encoding): cannot open the connection. In addition: Warning message: In file(filename, "r", encoding = encoding): cannot open file 'chuchu.R': No such file or directory
#Para consertar: remover as aspas para que seja encontrado o arquivo na extens�o .R no diretorio correto.
source(chuchu.R) #Error in source(chuchu.R) : object 'chuchu.R' not found - Para consertar: criar um arquivo com esse nome e salvar no diretorio de uso do R.
setwd("C:/CavernaDoDragão") #Error in setwd("C:/CavernaDoDragão") : cannot change working directory - Para consertar: fechar o arquivo antes de mudar o diretorio
getwd #function ().Internal(getwd()) <bytecode: 0x11801c6c> <environment: namespace:base> - Para consertar: colocar () apos a funcao
Getwd() #Error in Getwd() : could not find function "Getwd" - Para consertar: retirar letra maicuscula do inicio da funcao

#Dica: dentro dos vetores os valores são elementos
#dica: quando o R der erro, copie e cole a mensagem de erro no google


#NaN - 
#NA - 
#factor - categoricas
#class(nomedoobjeto) - indica que tipo de objeto e esse

#head - mostra as 6 primeiras observacoes feitas 
#summary - resumo estatistico de todas as medidas
#lm - modelo linear
# ~ = 'em funcao de'
#NA domina em qualquer funcao matematica linear. sempre que ele existir.
#NA.rm - remove os NA da tabela
#quando n�o se comenta o numero da linha ou da coluna, sao lidas todas as linhas/colunas do que nao foi dito
#unique - todas as especies que aparecem na coluna uma unica vez (ignora as repeticoes)
#sort - coloca toda a coluna em ordem alfabetica
#== � a compara��o de igualdade. Leia como � igual a?
# != � a compara��o de desigualdade. Leia como � diferente de?
#all.equal() - compara com precisao a igualdade entre operacoes decimais
# <= >= - menor ou igual/maior ou igual
