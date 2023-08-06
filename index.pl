cucaracha(ginger,15,6).
cucaracha(erikElRojo,25,70).
cucaracha(gimeno,12,8).
cucaracha(cucurucha,12,5).

comio(pumba,vaquitaSanAntonio(gervasia,3)). 
comio(pumba,hormiga(federica)). 

comio(pumba,hormiga(tuNoEresLaReina)). 
comio(pumba,cucaracha(ginger,15,6)). 
comio(pumba,cucaracha(erikElRojo,25,70)). 

comio(timon,vaquitaSanAntonio(romualda,4)). 
comio(timon,cucaracha(gimeno,12,8)). 
comio(timon,cucaracha(cucurucha,12,5)). 

comio(simba,vaquitaSanAntonio(remeditos,4)). 
comio(simba,hormiga(schwartzenegger)). 
comio(simba,hormiga(niato)). 
comio(simba,hormiga(lula)). 

pesoHormiga(2). 

peso(pumba,100). 
peso(timon,50). 
peso(simba,200). 

esPersonaje(simba).
esPersonaje(pumba).
esPersonaje(timon).

## 1
# a
jugosita(cucaracha(Nombre, Tamanio, Peso)):-
  cucaracha(OtroNombre, Tamanio, OtroPeso),
  Nombre \= OtroNombre,
  Peso > OtroPeso.

# b
hormigofilico(Personaje):-
  esPersonaje(Personaje),
  comioMasDeDosHormigas(Personaje).

comioMasDeDosHormigas(Personaje):-
  findall(H, comio(Personaje,hormiga(H)), Hormigas),
  length(Hormigas, Cantidad),
  Cantidad >= 2.

# c
cucarachofobico(Personaje):-
  esPersonaje(Personaje),
  not(comio(Personaje, cucaracha(_,_,_))).

# d
picarones(pumba).
picarones(Personaje):-
  esPersonaje(Personaje),
  comio(Personaje, Cucaracha),
  jugosita(Cucaracha).

picarones(Personaje):-
  esPersonaje(Personaje),
  comio(Personaje, vaquitaSanAntonio(remeditos,_)).

