cucaracha(ginger,15,6).
cucaracha(erikElRojo,25,70).
cucaracha(gimeno,12,8).
cucaracha(cucurucha,12,5).

comio(pumba, vaquitaSanAntonio(gervasia,3)). 
comio(pumba, hormiga(federica)). 

comio(pumba, hormiga(tuNoEresLaReina)). 
comio(pumba, cucaracha(ginger,15,6)). 
comio(pumba, cucaracha(erikElRojo,25,70)). 

comio(timon, vaquitaSanAntonio(romualda,4)). 
comio(timon, cucaracha(gimeno,12,8)). 
comio(timon, cucaracha(cucurucha,12,5)). 

comio(simba, vaquitaSanAntonio(remeditos,4)). 
comio(simba, hormiga(schwartzenegger)). 
comio(simba, hormiga(niato)). 
comio(simba, hormiga(lula)). 

comio(shenzi,hormiga(conCaraDeSimba)). 

pesoHormiga(2). 

peso(pumba, 100). 
peso(timon, 50). 
peso(simba, 200). 
peso(scar,300). 
peso(shenzi,400). 
peso(banzai,500). 

esPersonaje(simba).
esPersonaje(pumba).
esPersonaje(timon).
esPersonaje(scar).
esPersonaje(shenzi).
esPersonaje(banzai).
esPersonaje(mufasa).

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
# d.
picarones(Personajes):-
  findall(Personaje, condiciones(Personaje), Personajes).

condiciones(pumba).
condiciones(Personaje):-
  (comio(Personaje, Cucaracha), jugosita(Cucaracha), esPersonaje(Personaje));
  comio(Personaje, vaquitaSanAntonio(remeditos,_)).

# 2)
persigue(scar, timon). 
persigue(scar, pumba). 
persigue(shenzi, simba). 
persigue(shenzi, scar). 
persigue(banzai, timon).
persigue(scar, mufasa). 

# a
cuantoEngordaA(Personaje, PesoTotal):-
    esPersonaje(Personaje),
    findall(PesoBicho, (comio(Personaje, Bicho), pesoBicho(Bicho, PesoBicho)), PesosBichos),
    sumlist(PesosBichos, PesoTotal).
  
pesoBicho(hormiga(_), Peso) :- pesoHormiga(Peso).
pesoBicho(cucaracha(_, _, Peso), Peso).
pesoBicho(vaquitaSanAntonio(_,Peso), Peso).

# b
cuantoEngordaB(Personaje, PesoTotalEngordado):-
    esPersonaje(Personaje),
    findall(PesoQueEngorda, condiciones(Personaje, PesoQueEngorda) ,PesosQueEngorda),
    sumlist(PesosQueEngorda, PesoTotalEngordado).

condiciones(Personaje, PesoQueEngorda):-
    (  persigue(Personaje,Animal), 
       peso(Animal, PesoQueEngorda) );
    (  comio(Personaje, Bicho),
       pesoBicho(Bicho, PesoQueEngorda) ).

# 3)
combinaComidas(Personaje, ListaComidas):-
    esPersonaje(Personaje),
    findall(CosaQueCome, (comio(Personaje, CosaQueCome) ; persigue(Personaje, CosaQueCome)), ListaComidas).

# 4)
rey(Personaje) :-
    esPersonaje(Personaje),
    findall(Animal, (esPersonaje(Animal), Animal \= Personaje), Todos),
    adoradoPorTodos(Todos, Personaje),
    perseguidoPorUno(Personaje).

adora(Personaje, Otro) :-
    not(persigue(Otro, Personaje)),
    not(comio(Otro, Personaje)).

adoradoPorTodos([], _).
adoradoPorTodos([Cabeza | Cola], Personaje) :-
    adora(Cabeza, Personaje),
    adoradoPorTodos(Cola, Personaje).

perseguidoPorUno(Personaje) :-
    findall(Depredador, persigue(Depredador, Personaje), Depredadores),
    length(Depredadores, Cant),
    Cant = 1.
