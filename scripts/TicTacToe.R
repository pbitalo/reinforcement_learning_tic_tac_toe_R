verificavitoria = function()
{

  decvit = paste(estado,collapse="") 
  if ( 
    (substr(decvit,1,3) %in% c("XXX","BBB"))   | ( substr(decvit,3,6) %in% c("XXX","BBB")) | (substr(decvit,7,9) %in% c("XXX","BBB")) | 
    (paste(substr(decvit,1,1),substr(decvit,4,4),substr(decvit,7,7),sep="") %in% c("XXX","BBB")) |   # verticais
    (paste(substr(decvit,2,2),substr(decvit,5,5),substr(decvit,8,8),sep="") %in% c("XXX","BBB")) |
    (paste(substr(decvit,3,3),substr(decvit,6,6),substr(decvit,9,9),sep="") %in% c("XXX","BBB")) |
    (paste(substr(decvit,1,1),substr(decvit,5,5),substr(decvit,9,9),sep="") %in% c("XXX","BBB")) |  #transver
    (paste(substr(decvit,7,7),substr(decvit,5,5),substr(decvit,3,3),sep="") %in% c("XXX","BBB")) 
  )   { 
    return(1)
  } else {
    return(0)
  }
  
}

imprime = function() 
{
  cex = 7
  text(0.735,.8,labels=ifelse(estado[1]=="."," ",estado[1]),cex=cex)
  text(1,.8,labels=ifelse(estado[2]=="."," ",estado[2]),cex=cex)
  text(1.257,.8,labels=ifelse(estado[3]=="."," ",estado[3]),cex=cex)
  text(0.735,0,labels=ifelse(estado[4]=="."," ",estado[4]),cex=cex)
  text(1,0,labels=ifelse(estado[5]=="."," ",estado[5]),cex=cex)
  text(1.257,0,labels=ifelse(estado[6]=="."," ",estado[6]),cex=cex)
  text(0.735,-.73,labels=ifelse(estado[7]=="."," ",estado[7]),cex=cex)
  text(1,-.73,labels=ifelse(estado[8]=="."," ",estado[8]),cex=cex)
  text(1.257,-.73,labels=ifelse(estado[9]=="."," ",estado[9]),cex=cex)  
}

tictactoe <- function(jogada)
{
  
  if( verificavitoria() == 1 ) {
    warning("Vitória!")
  }

  if (jogada==0)
  {
    
    # Primeira jogada
    estado <<- c(replicate(9,"." ))
    
    # Plotar grades
    plot(0,type='n',axes=FALSE,ann=FALSE)
    abline(v=.87)
    abline(v=1.14)
    abline(h=-.34)
    abline(h=.32) 
    
    # Aleatória (agente)
    pj = sample(9,1)
    estado[pj] <<- "X"

  } 
  
  else 
    
  {
    
    if (estado[jogada] != "."  ) {
      stop("Está jogando não é permitida!")
    }
    
    estado[jogada] <<- "B"
    
    if( verificavitoria() == 1 ) {
      warning("Ganhou!")
    }

    # Busca por políticas.
    jogada =  modelo$Policy[paste(estado,collapse="")]
    jogada = as.integer(substr(jogada,2,2))

    # Joga na primeira posição disponível (valida posição já ocupada ou vazia)
    if (is.na(jogada) | estado[jogada] != "." )
    {
      
      # Registro de jogada
      print(paste0("Jogada ilegal: ", ifelse(is.na(jogada)," NA ", " Inválida "), paste(estado,collapse="")))
      jogada = regexpr(".", paste0(estado,collapse=""), fixed=T)[1]
      
    }
    
    # Jogada do agente IA (Scopo global)
    estado[jogada] <<- "X"
    
    if( verificavitoria() == 1 ) {
      warning("Ganhou!")
    }
    
  }
  
  imprime()

  # Verifica se chegou ao fim
  if (regexpr(".", paste0(estado,collapse=""), fixed=T)[1] == -1)
  {
    warning("Fim da partida!")
  }

}
