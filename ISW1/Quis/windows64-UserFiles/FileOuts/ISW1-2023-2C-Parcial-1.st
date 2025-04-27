!classDefinition: #PenalesTest category: #'ISW1-2023-2C-Parcial-1'!
TestCase subclass: #PenalesTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2023-2C-Parcial-1'!

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test01DelanteroNoPuedeApuntarHaciaAfueraDelPaloIzquierdo
	
	| arquero delantero juegoPenales pelota |
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 100.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	self 
		should: [ juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: -1@0 arqueroSeLanzaEnDirección: 0@0.] 
		raise: Error
		withExceptionDo: [ :error |
			self assert: Penales direccionTiroFueraDeRango equals: error messageText.
			self assert: 0 equals: juegoPenales puntajeDeDelantero.
			self assert: 0 equals: juegoPenales puntajeDeArquero.]
	! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test02DelanteroNoPuedeApuntarHaciaAfueraDelPaloDerecho
	
	| arquero delantero juegoPenales pelota |
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 100.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	self 
		should: [ juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 3@0 arqueroSeLanzaEnDirección: 0@0.] 
		raise: Error
		withExceptionDo: [ :error |
			self assert: Penales direccionTiroFueraDeRango equals: error messageText.
			self assert: 0 equals: juegoPenales puntajeDeDelantero.
			self assert: 0 equals: juegoPenales puntajeDeArquero.]
	! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:06'!
test03DelanteroNoPuedeApuntarHaciaAbajoDelArco
	
	| arquero delantero juegoPenales pelota |
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 100.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	self 
		should: [ juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@-1 arqueroSeLanzaEnDirección: 0@0.] 
		raise: Error
		withExceptionDo: [ :error |
			self assert: Penales direccionTiroFueraDeRango equals: error messageText.
			self assert: 0 equals: juegoPenales puntajeDeDelantero.
			self assert: 0 equals: juegoPenales puntajeDeArquero.]
	! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test04DelanteroNoPuedeApuntarHaciaArribaDelTravesaño
	
	| arquero delantero juegoPenales pelota |
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 100.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	self 
		should: [ juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@3 arqueroSeLanzaEnDirección: 0@0.] 
		raise: Error
		withExceptionDo: [ :error |
			self assert: Penales direccionTiroFueraDeRango equals: error messageText.
			self assert: 0 equals: juegoPenales puntajeDeDelantero.
			self assert: 0 equals: juegoPenales puntajeDeArquero.]
	! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test05ArqueroNoPuedePasarseDelPaloIzquierdo
	
	| arquero delantero juegoPenales pelota |
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 100.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	self 
		should: [ juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@0 arqueroSeLanzaEnDirección: -1@0.] 
		raise: Error
		withExceptionDo: [ :error |
			self assert: Penales direccionArqueroFueraDeRango equals: error messageText.
			self assert: 0 equals: juegoPenales puntajeDeDelantero.
			self assert: 0 equals: juegoPenales puntajeDeArquero.]
	! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test06ArqueroNoPuedePasarseDelPaloDerecho
	
	| arquero delantero juegoPenales pelota |
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 100.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	self 
		should: [ juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@0 arqueroSeLanzaEnDirección: 3@0.] 
		raise: Error
		withExceptionDo: [ :error |
			self assert: Penales direccionArqueroFueraDeRango equals: error messageText.
			self assert: 0 equals: juegoPenales puntajeDeDelantero.
			self assert: 0 equals: juegoPenales puntajeDeArquero.]
	! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:06'!
test07ArqueroNoPuedeMeterseAbajoDeLaTierra
	
	| arquero delantero juegoPenales pelota |
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 100.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	self 
		should: [ juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@0 arqueroSeLanzaEnDirección: 0@-1.] 
		raise: Error
		withExceptionDo: [ :error |
			self assert: Penales direccionArqueroFueraDeRango equals: error messageText.
			self assert: 0 equals: juegoPenales puntajeDeDelantero.
			self assert: 0 equals: juegoPenales puntajeDeArquero.]
	! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test08ArqueroNoPuedeSaltarPorEncimaDelTravesaño
	
	| arquero delantero juegoPenales pelota |
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 100.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	self 
		should: [ juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@0 arqueroSeLanzaEnDirección: 0@3.] 
		raise: Error
		withExceptionDo: [ :error |
			self assert: Penales direccionArqueroFueraDeRango equals: error messageText.
			self assert: 0 equals: juegoPenales puntajeDeDelantero.
			self assert: 0 equals: juegoPenales puntajeDeArquero.]
	! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test09DireccionesDiferentesGolDelantero
	
	| arquero delantero juegoPenales pelota |
	
	"Caso general del juego..."
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 100.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 2@2 arqueroSeLanzaEnDirección: 0@1.
	
	self assert: 1 equals: juegoPenales puntajeDeDelantero.
	self assert: 0 equals: juegoPenales puntajeDeArquero.
	self assert: 2@2 equals: juegoPenales varDireccionRemateResultante
	"varXXXX es por VAR, de 'Video Assistant Referee'"! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test10MismasDireccionesInsuficienteFuerzaGolDelantero
	
	| arquero delantero juegoPenales pelota |
	
	"Caso general del juego..."
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 10.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 2@2 arqueroSeLanzaEnDirección: 2@2.
	
	self assert: 1 equals: juegoPenales puntajeDeDelantero.
	self assert: 0 equals: juegoPenales puntajeDeArquero.
	self assert: 2@2 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test11MismasDireccionesSuficienteFuerzaAtajaArquero
	
	| arquero delantero juegoPenales pelota |
	
	"Caso general del juego..."
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 100.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 2@2 arqueroSeLanzaEnDirección: 2@2.
	
	self assert: 0 equals: juegoPenales puntajeDeDelantero.
	self assert: 1 equals: juegoPenales puntajeDeArquero.
	self assert: 2@2 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:42:08'!
test12DelanteroQueTiraAColocarPierde50PorcFuerza
	
	| arquero delantero juegoPenales pelota |
	
	"La fuerza del Delantero se reduce en 50% siempre que tira a colocar... (no importa pelota, ni arquero)"
	"(delantero sacrificia potencia para ganar mayor precisión)"
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 50.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 2@2 arqueroSeLanzaEnDirección: 2@2.
	
	self assert: 0 equals: juegoPenales puntajeDeDelantero.
	self assert: 1 equals: juegoPenales puntajeDeArquero.
	self assert: 2@2 equals: juegoPenales varDireccionRemateResultante.
	self assert: 50 equals: juegoPenales varFuerzaResultanteDeTiro.! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:42:34'!
test13ArqueroQueEligeAntesDeTiroVsJabulaniAColocarSuma50PorcFuerzaExtra
	
	| arquero delantero juegoPenales pelota |
	
	"La fuerza del Delantero se reduce en 50% siempre que tira a colocar... (no importa pelota, ni arquero)"
	"El Arquero que elige donde tirarse antes de un tiro a colocar de jabulani gana 50% de su fuerza extra..."
	"(el arquero llega más cómodo y aprovecha mejor su fuerza)"
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 34.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@2 arqueroSeLanzaEnDirección: 0@2.
	
	self assert: 0 equals: juegoPenales puntajeDeDelantero.
	self assert: 1 equals: juegoPenales puntajeDeArquero.
	self assert: 0@2 equals: juegoPenales varDireccionRemateResultante.
	self assert: 50 equals: juegoPenales varFuerzaResultanteDeTiro.
	self assert: 51 equals: juegoPenales varFuerzaResultanteDeAtajada.! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:42:34'!
test14FuerzaInsuficienteDeArqueroQueEligeAntesDeTiroVsJabulaniAColocar
	
	| arquero delantero juegoPenales pelota |
	
	"La fuerza del Delantero se reduce en 50% siempre que tira a colocar... (no importa pelota, ni arquero)"
	"El Arquero que elige adonde tirarse antes de un tiro a colocar de jabulani gana 50% de su fuerza extra..."
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 32.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@2 arqueroSeLanzaEnDirección: 0@2.
	
	self assert: 1 equals: juegoPenales puntajeDeDelantero.
	self assert: 0 equals: juegoPenales puntajeDeArquero.
	self assert: 0@2 equals: juegoPenales varDireccionRemateResultante.
	self assert: 50 equals: juegoPenales varFuerzaResultanteDeTiro.
	self assert: 48 equals: juegoPenales varFuerzaResultanteDeAtajada.! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test15ArqueroQueEsperaPorTiroYSeAdelantaVsJabulaniAColocarIgnoraAlturaTiro
	
	| arquero delantero juegoPenales pelota |
	
	"La fuerza del Delantero se reduce en 50% siempre que tira a colocar... (no importa pelota, ni arquero)"
	"El Arquero que espera y se adelanta ante un tiro de jabulani a colocar ignora la 2da coordenada (altura) al atajar..."	
	"(al adelanterse encara la pelota antes de que su elevación se transforme en un problema)"
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero  esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 50.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@2 arqueroSeLanzaEnDirección: 0@0.
	
	self assert: 0 equals: juegoPenales puntajeDeDelantero.
	self assert: 1 equals: juegoPenales puntajeDeArquero.
	self assert: 0@2 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:42:08'!
test16PelotaPlayeraUsadaAColocarLeHacePerder20PorcFuerzaExtraAlDelantero
	
	| arquero delantero juegoPenales pelota |
	
	"La fuerza del Delantero se reduce en 50% siempre que tira a colocar... (no importa pelota, ni arquero)"
	"La humilde pelota playera le hace perder un 20% de fuerza adicional al delantero que la use para colocar... (no importa el arquero)"
	"(no debería ser reglamentaria... al menos no es de trapo, nos responden)"
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota playeraLentaCostaAzul.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 1.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 1@2 arqueroSeLanzaEnDirección: 1@2.
	
	self assert: 1 equals: juegoPenales puntajeDeDelantero.
	self assert: 0 equals: juegoPenales puntajeDeArquero.
	self assert: 1@2 equals: juegoPenales varDireccionRemateResultante.
	self assert: 40 equals: juegoPenales varFuerzaResultanteDeTiro! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:42:34'!
test17ArqueroQueEligeAntesDeTiroVsPlayeraAColocarSuma100PorcFuerzaExtra
	
	| arquero delantero juegoPenales pelota |
	
	"La fuerza del Delantero se reduce en 50% siempre que tira a colocar... (no importa pelota, ni arquero)"
	"La humilde pelota playera le hace perder un 20% adicional de fuerza al delantero que la use para colocar... (no importa el arquero)"
	"Arquero que elige donde lanzarse antes de un remate de una pelota playera lenta a colocar, gana un 100% de su fuerza extra..."
	"(a quien madruga...)"
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota playeraLentaCostaAzul.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 20.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@0 arqueroSeLanzaEnDirección: 0@0.
	
	self assert: 0 equals: juegoPenales puntajeDeDelantero.
	self assert: 1 equals: juegoPenales puntajeDeArquero.
	self assert: 0@0 equals: juegoPenales varDireccionRemateResultante.
	self assert: 40 equals: juegoPenales varFuerzaResultanteDeTiro.
	self assert: 40 equals: juegoPenales varFuerzaResultanteDeAtajada! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:42:34'!
test18FuerzaInsuficienteDeArqueroQueEligeAntesDeTiroVsPlayeraAColocar
	
	| arquero delantero juegoPenales pelota |
	
	"La fuerza del Delantero se reduce en 50% siempre que tira a colocar... (no importa pelota, ni arquero)"
	"La humilde pelota playera le hace perder un 20% adicional de fuerza al delantero que la use para colocar... (no importa el arquero)"
	"Arquero que elige donde lanzarse antes de un remate de una pelota playera lenta a colocar, gana un 100% de su fuerza extra..."
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota playeraLentaCostaAzul.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 19.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@0 arqueroSeLanzaEnDirección: 0@0.
	
	self assert: 1 equals: juegoPenales puntajeDeDelantero.
	self assert: 0 equals: juegoPenales puntajeDeArquero.
	self assert: 0@0 equals: juegoPenales varDireccionRemateResultante.
	self assert: 40 equals: juegoPenales varFuerzaResultanteDeTiro.
	self assert: 38 equals: juegoPenales varFuerzaResultanteDeAtajada! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test19ArqueroQueEsperaPorTiroYSeAdelantaVsPlayeraAColocarEsDescubiertoYPuntoParaDelantero
	
	| arquero delantero juegoPenales pelota |
	
	"Arquero que espera y se adelanta ante tiro con la lenta pelota playera, siempre es descubierto por el Árbitro, y el punto se le otorga al Delantero..."
	"(lo que servía de ventaja ante la Jabulani rápida, acá es tan obvio por lo que tarda en llegar la pelota al arco, que marchás preso...)"
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota playeraLentaCostaAzul.
	arquero := Arquero  esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 200.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@0 arqueroSeLanzaEnDirección: 0@0.
	
	self assert: 1 equals: juegoPenales puntajeDeDelantero.
	self assert: 0 equals: juegoPenales puntajeDeArquero.
	self assert: 0@0 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:34:52'!
test20DelanteroTiraAMatarAlAnguloInferiorIzquierdoLaAlturaDelTiroPasaAMedio
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' a los ángulos, la 2da coordenada (altura) del remate pasa a 1 (altura media)... (no importa pelota, ni arquero)"	
	"(tirar a matar no es tan preciso como tirar a colocar, hay desvios de altura. Sin embargo se usa el 100% de fuerza del jugador)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 200.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@0 arqueroSeLanzaEnDirección: 0@0.
	.
	self assert: 0@1 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:34:47'!
test21DelanteroTiraAMatarAlAnguloSuperiorIzquierdoLaAlturaDelTiroPasaAMedio
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' a los ángulos, la 2da coordenada (altura) del remate pasa a 1 (altura media)... (no importa pelota, ni arquero)"	
	"(tirar a matar no es tan preciso como tirar a colocar, hay desvios de altura. Sin embargo se usa el 100% de fuerza del jugador)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 200.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@2 arqueroSeLanzaEnDirección: 0@2.
	
	self assert: 0@1 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:34:41'!
test22DelanteroTiraAMatarAlAnguloInferiorDerechoLaAlturaDelTiroPasaAMedio
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' a los ángulos, la 2da coordenada (altura) del remate pasa a 1 (altura media)... (no importa pelota, ni arquero)"	
	"(tirar a matar no es tan preciso como tirar a colocar, hay desvios de altura. Sin embargo se usa el 100% de fuerza del jugador)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 200.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 2@0 arqueroSeLanzaEnDirección: 2@0.
	
	self assert: 2@1 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:34:36'!
test23DelanteroTiraAMatarAlAnguloSuperiorDerechoLaAlturaDelTiroPasaAMedio
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' a los ángulos, la 2da coordenada (altura) del remate pasa a 1 (altura media)... (no importa pelota, ni arquero)"	
	"(tirar a matar no es tan preciso como tirar a colocar, hay desvios de altura. Sin embargo se usa el 100% de fuerza del jugador)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 200.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 2@2 arqueroSeLanzaEnDirección: 2@2.
	
	self assert: 2@1 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:34:29'!
test24DelanteroTiraAMatarNoAlAnguloMantieneDireccionTiro
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' a los ángulos, la 2da coordenada (altura) del remate pasa a 1 (altura media)... (no importa pelota, ni arquero)"	
	"(tirar a matar no es tan preciso como tirar a colocar, hay desvios de altura. Sin embargo se usa el 100% de fuerza del jugador)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 200.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 1@2 arqueroSeLanzaEnDirección: 1@1.

	self assert: 1@2 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:42:08'!
test25DelanteroTiraAMatarUsa100PorcFuerzaBase
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' a los ángulos, la 2da coordenada (altura) del remate pasa a 1 (altura media)... (no importa pelota, ni arquero)"	
	"(tirar a matar no es tan preciso como tirar a colocar, hay desvios de altura. Sin embargo se usa el 100% de fuerza del jugador)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:150.
	pelota := Pelota playeraLentaCostaAzul.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 200.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 2@0 arqueroSeLanzaEnDirección: 2@0.
	
	self assert: 1 equals: juegoPenales puntajeDeDelantero.
	self assert: 0 equals: juegoPenales puntajeDeArquero.
	self assert: 2@1 equals: juegoPenales varDireccionRemateResultante.
	self assert: 150 equals: juegoPenales varFuerzaResultanteDeTiro! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:42:08'!
test26DelanteroTiraAMatarConJabulaniGana20PorcFuerzaExtra
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' el Delantero usa el 100% de su fuerza... (no importa pelota, ni arquero)"
	"Si se tira 'a matar' a los ángulos, la 2da coordenada (altura) del remate pasa a 1 (altura media)... (no importa pelota, ni arquero)"	
	"Si se tira 'a matar' usando la jabulani rápida, el Delantero gana un 20% de fuerza extra... (no importa arquero)"
	"(Jabulani a matar es la elección de los guerreros Z)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 120.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 2@2 arqueroSeLanzaEnDirección: 2@1.
	
	self assert: 0 equals: juegoPenales puntajeDeDelantero.
	self assert: 1 equals: juegoPenales puntajeDeArquero.
	self assert: 2@1 equals: juegoPenales varDireccionRemateResultante.
	self assert: 120 equals: juegoPenales varFuerzaResultanteDeTiro.! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:42:08'!
test27FuerzaInsuficienteDeArqueroQueEligeAntesDeTiroVsJabulaniAMatar
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' el Delantero usa el 100% de su fuerza... (no importa pelota, ni arquero)"
	"Si se tira 'a matar' a los ángulos, la 2da coordenada (altura) del remate pasa a 1 (altura media)... (no importa pelota, ni arquero)"	
	"Si se tira 'a matar' usando la jabulani rápida, el Delantero gana un 20% de fuerza extra... (no importa arquero)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 119.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 2@2 arqueroSeLanzaEnDirección: 2@1.
	
	self assert: 1 equals: juegoPenales puntajeDeDelantero.
	self assert: 0 equals: juegoPenales puntajeDeArquero.
	self assert: 2@1 equals: juegoPenales varDireccionRemateResultante.
	self assert: 120 equals: juegoPenales varFuerzaResultanteDeTiro.! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:06'!
test28ArqueroQueEligeAntesDeTiroVsJabulaniAMatarIgnoraAlturaTiro
	
	| arquero delantero juegoPenales pelota |
	
	"El Arquero que elige donde tirarse antes de un tiro de jabulani a matar, ignora la 2da coordenada (altura) al atajar..."		
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 200.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@2 arqueroSeLanzaEnDirección: 0@0.
	
	self assert: 0 equals: juegoPenales puntajeDeDelantero.
	self assert: 1 equals: juegoPenales puntajeDeArquero.
	self assert: 0@1 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test29ArqueroQueEsperaPorTiroYSeAdelantaVsJabulaniAMatarNuncaAtaja
	
	| arquero delantero juegoPenales pelota |
	
	"El Arquero que espera a ver la dirección del remate de una pelota jabulani rápida a matar antes de lanzarse, nunca la ataja sin importar nada, siquiera que se adelantó..."	
	"(su poder era de más de 9000!! era impresionante, no podía moverme, sólo la ví pasar... f )"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 200.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 1@1 arqueroSeLanzaEnDirección: 1@1.
	
	self assert: 1 equals: juegoPenales puntajeDeDelantero.
	self assert: 0 equals: juegoPenales puntajeDeArquero.
	self assert: 1@1 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test30DelanteroQueNoPateaAlAnguloConPlayeraAMatarSuma2AAlturaDeDireccionPelotaAdentro
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' el Delantero usa el 100% de su fuerza... (no importa pelota, ni arquero)"
	"Si se tira 'a matar' a los ángulos, la 2da coordenada (altura) del remate pasa a 1 (altura media)... (no importa pelota, ni arquero)"	
	"Si se tira 'a matar' usando una pelota playera a una dirección que no es un ángulo, la 2da coordenada del remate (altura) suma 2, es decir sale volando producto de su liviandez (y que quiere retornar al mar). Si la pelota se va fuera del arco, el puntaje va al arquero... (no importa arquero)"
	"(y voló.. y me hizo volar... y yo volé de él...  pero acá por la arbolada... y el voló.. y se estrelló por acá por la pared...)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota playeraLentaCostaAzul.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 200.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 1@0 arqueroSeLanzaEnDirección: 1@0.
	
	self assert: 1 equals: juegoPenales puntajeDeDelantero.
	self assert: 0 equals: juegoPenales puntajeDeArquero.
	self assert: 1@2 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test31DelanteroQueNoPateaAlAnguloConPlayeraAMatarSuma2AAlturaDeDireccionPelotaAfuera
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' el Delantero usa el 100% de su fuerza... (no importa pelota, ni arquero)"
	"Si se tira 'a matar' a los ángulos, la 2da coordenada (altura) del remate pasa a 1 (altura media)... (no importa pelota, ni arquero)"	
	"Si se tira 'a matar' usando una pelota playera a una dirección que no es un ángulo, la 2da coordenada del remate (altura) suma 2, es decir sale volando producto de su liviandez (y que quiere retornar al mar). Si la pelota se va fuera del arco, el puntaje va al arquero... (no importa arquero)"
	"(El caso auspiciado por el Pipita...)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota playeraLentaCostaAzul.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 200.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@1 arqueroSeLanzaEnDirección: 0@0.
	
	self assert: 0 equals: juegoPenales puntajeDeDelantero.
	self assert: 1 equals: juegoPenales puntajeDeArquero.
	self assert: 0@3 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test32ArqueroQueEligeAntesDeTiroVsPlayeraAMatarAlAnguloIgnoraAnchoTiro
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' el Delantero usa el 100% de su fuerza... (no importa pelota, ni arquero)"
	"Si se tira 'a matar' a los ángulos, la 2da coordenada (altura) del remate pasa a 1 (altura media)... (no importa pelota, ni arquero)"	
	"Si el arquero elige donde tirarse antes del tiro a matar de la pelota playera, ignora la 1ra coordenada del remate (ancho) al atajar..."
	"(con agacharse, quedarse parado, o saltar le alcanza...)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota playeraLentaCostaAzul.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 100.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@0 arqueroSeLanzaEnDirección: 2@1.
	
	self assert: 0 equals: juegoPenales puntajeDeDelantero.
	self assert: 1 equals: juegoPenales puntajeDeArquero.
	self assert: 0@1 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 18:39:22'!
test33ArqueroQueEligeAntesDeTiroVsPlayeraAMatarNoAlAnguloIgnoraAnchoTiro
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' el Delantero usa el 100% de su fuerza... (no importa pelota, ni arquero)"
	"Si se tira 'a matar' usando una pelota playera a una dirección que no es un ángulo, la 2da coordenada del remate (altura) suma 2, es decir sale volando producto de su liviandez (y que quiere retornar al mar). Si la pelota se va fuera del arco, el puntaje va al arquero... (no importa arquero)"
	"Si el arquero elige donde tirarse antes del tiro a matar de la pelota playera, ignora la 1ra coordenada del remate (ancho) al atajar..."
	"(con agacharse, quedarse parado, o saltar le alcanza...)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota playeraLentaCostaAzul.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 100.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 1@0 arqueroSeLanzaEnDirección: 0@2.
	
	self assert: 0 equals: juegoPenales puntajeDeDelantero.
	self assert: 1 equals: juegoPenales puntajeDeArquero.
	self assert: 1@2 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test34ArqueroQueEsperaPorTiroYSeAdelantaVsPlayeraAMatarSiempreAtaja
	
	| arquero delantero juegoPenales pelota |
	
	"El Arquero que espera y se adelanta ante una pelota playera lenta a matar, siempre la ataja sin importar nada..."	
	"(como la pelota es taaaan lentaaa, el arquero se puede ir a tomar un cafe, verse una serie, volver y aún atajar la pelota habiendose tirado a cualquier lado. Pero igual es más rapida que cuando se la tira a colocar, donde indefectiblemente el arbitro lo detecta...)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota playeraLentaCostaAzul.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 1.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 2@2 arqueroSeLanzaEnDirección: 0@0.
	
	self assert: 0 equals: juegoPenales puntajeDeDelantero.
	self assert: 1 equals: juegoPenales puntajeDeArquero.
	self assert: 2@1 equals: juegoPenales varDireccionRemateResultante! !


!classDefinition: #Arquero category: #'ISW1-2023-2C-Parcial-1'!
Object subclass: #Arquero
	instanceVariableNames: 'tipo fuerzaBase penales'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2023-2C-Parcial-1'!

!Arquero methodsFor: 'inicializar' stamp: 'mmp 4/26/2025 11:16:27'!
inicializarArqueroConEstrategia: estrategia YConFuerzaBase: fuerza 
	tipo := estrategia .
	fuerzaBase := fuerza .! !

!Arquero methodsFor: 'inicializar' stamp: 'mmp 4/26/2025 16:06:36'!
juegaPenales: estaRonda
	penales:=estaRonda .! !


!Arquero methodsFor: 'acceder' stamp: 'mmp 4/26/2025 11:45:22'!
verFuerzaBase
	^fuerzaBase ! !

!Arquero methodsFor: 'acceder' stamp: 'mmp 4/26/2025 16:07:24'!
verPenales
	^penales .! !

!Arquero methodsFor: 'acceder' stamp: 'mmp 4/26/2025 12:11:43'!
verTipo
	^tipo .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Arquero class' category: #'ISW1-2023-2C-Parcial-1'!
Arquero class
	instanceVariableNames: ''!

!Arquero class methodsFor: 'instance creation' stamp: 'mmp 4/26/2025 14:54:21'!
eligeDireccionAntesDeTiroSuFuerzaBaseEs: fuerza
	^self new inicializarArqueroConEstrategia: (EligeDireccionAntesTiro con: self) YConFuerzaBase: fuerza. ! !

!Arquero class methodsFor: 'instance creation' stamp: 'mmp 4/26/2025 16:25:35'!
esperaPorTiroYSeAdelantaSuFuerzaBaseEs: fuerza
	^self new inicializarArqueroConEstrategia: (EsperaPorTiro con: self) YConFuerzaBase: fuerza 
 ! !


!classDefinition: #Delantero category: #'ISW1-2023-2C-Parcial-1'!
Object subclass: #Delantero
	instanceVariableNames: 'fuerzaBase tipo penales'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2023-2C-Parcial-1'!

!Delantero methodsFor: 'inicializar' stamp: 'mmp 4/26/2025 11:10:17'!
inicializarDelanteroConEstrategia: estrategia YConFuerzaBase: fuerza 
	fuerzaBase:=fuerza.
	tipo:=estrategia.! !

!Delantero methodsFor: 'inicializar' stamp: 'mmp 4/26/2025 16:06:57'!
juegaPenales: estaRonda
	penales:=estaRonda .! !


!Delantero methodsFor: 'acceder' stamp: 'mmp 4/26/2025 11:45:42'!
verFuerzaBase
	^fuerzaBase .! !

!Delantero methodsFor: 'acceder' stamp: 'mmp 4/26/2025 16:07:14'!
verPenales
	^penales .! !

!Delantero methodsFor: 'acceder' stamp: 'mmp 4/26/2025 11:52:46'!
verTipo
	^tipo .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Delantero class' category: #'ISW1-2023-2C-Parcial-1'!
Delantero class
	instanceVariableNames: ''!

!Delantero class methodsFor: 'instance creation' stamp: 'mmp 4/26/2025 14:58:50'!
decideTirarAColocarSuFuerzaBaseEs: fuerza
	^self new inicializarDelanteroConEstrategia: (AColocar con: self) YConFuerzaBase: fuerza.! !

!Delantero class methodsFor: 'instance creation' stamp: 'mmp 4/26/2025 17:43:19'!
decideTirarAMatarSuFuerzaBaseEs: fuerza
	^self new inicializarDelanteroConEstrategia: (AMatar con: self) YConFuerzaBase: fuerza. ! !


!classDefinition: #EstrategiaArquero category: #'ISW1-2023-2C-Parcial-1'!
Object subclass: #EstrategiaArquero
	instanceVariableNames: 'arquero'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2023-2C-Parcial-1'!

!EstrategiaArquero methodsFor: 'inicializar' stamp: 'mmp 4/26/2025 14:59:35'!
inicializarCon:miArquero
	arquero := miArquero 
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EstrategiaArquero class' category: #'ISW1-2023-2C-Parcial-1'!
EstrategiaArquero class
	instanceVariableNames: ''!

!EstrategiaArquero class methodsFor: 'instance creation' stamp: 'mmp 4/26/2025 14:59:54'!
con: miArquero
	^self new inicializarCon:miArquero .! !


!classDefinition: #EligeDireccionAntesTiro category: #'ISW1-2023-2C-Parcial-1'!
EstrategiaArquero subclass: #EligeDireccionAntesTiro
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2023-2C-Parcial-1'!

!EligeDireccionAntesTiro methodsFor: 'calcularEvento' stamp: 'mmp 4/26/2025 16:39:42'!
calcularEventoDeDelanteroAColocarConJabulaniEn: penales 
	^penales calcularEventoDeDelanteroAColocarConJabulaniConArqueroEligeAntesDeTiro.
	! !

!EligeDireccionAntesTiro methodsFor: 'calcularEvento' stamp: 'mmp 4/26/2025 17:34:03'!
calcularEventoDeDelanteroAColocarConPlayeraEn: penales 
	^penales calcularEventoDeDelanteroAColocarConPlayeraConArqueroEligeAntesDeTiro ! !

!EligeDireccionAntesTiro methodsFor: 'calcularEvento' stamp: 'mmp 4/26/2025 18:01:52'!
calcularEventoDeDelanteroAMatarConJabulaniEn: penales 
	^penales calcularEventoDeDelanteroAMatarConJabulaniConArqueroEligeAntesDeTiro ! !

!EligeDireccionAntesTiro methodsFor: 'calcularEvento' stamp: 'mmp 4/26/2025 18:34:24'!
calcularEventoDeDelanteroAMatarConPlayeraEn: penales 
	^penales calcularEventoDeDelanteroAMatarConPlayeraConArqueroEligeAntesDeTiro ! !


!classDefinition: #EsperaPorTiro category: #'ISW1-2023-2C-Parcial-1'!
EstrategiaArquero subclass: #EsperaPorTiro
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2023-2C-Parcial-1'!

!EsperaPorTiro methodsFor: 'calcularFuerza' stamp: 'mmp 4/26/2025 16:19:47'!
calcularEventoDeDelanteroAColocarConJabulaniEn:penales
	^penales calcularEventoDeDelanteroAColocarConJabulaniConArqueroEsperaPorTiro.
! !

!EsperaPorTiro methodsFor: 'calcularFuerza' stamp: 'mmp 4/26/2025 17:39:04'!
calcularEventoDeDelanteroAColocarConPlayeraEn: penales 
	^penales calcularEventoDeDelanteroAColocarConPlayeraConArqueroEsperaPorTiro.! !

!EsperaPorTiro methodsFor: 'calcularFuerza' stamp: 'mmp 4/26/2025 18:58:45'!
calcularEventoDeDelanteroAMatarConJabulaniEn: penales 
	^penales calcularEventoDeDelanteroAMatarConJabulaniConArqueroEsperaPorTiro ! !

!EsperaPorTiro methodsFor: 'calcularFuerza' stamp: 'mmp 4/26/2025 18:49:06'!
calcularEventoDeDelanteroAMatarConPlayeraEn: penales 
	^penales calcularEventoDeDelanteroAMatarConPlayeraConArqueroEsperaPorTiro 
	! !


!classDefinition: #EstrategiaDelantero category: #'ISW1-2023-2C-Parcial-1'!
Object subclass: #EstrategiaDelantero
	instanceVariableNames: 'delantero'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2023-2C-Parcial-1'!

!EstrategiaDelantero methodsFor: 'inicializar' stamp: 'mmp 4/26/2025 14:57:55'!
inicializarCon:miDelantero
	delantero := miDelantero .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EstrategiaDelantero class' category: #'ISW1-2023-2C-Parcial-1'!
EstrategiaDelantero class
	instanceVariableNames: ''!

!EstrategiaDelantero class methodsFor: 'instance creation' stamp: 'mmp 4/26/2025 15:01:49'!
con:miDelantero
	^self new inicializarCon:miDelantero .
! !


!classDefinition: #AColocar category: #'ISW1-2023-2C-Parcial-1'!
EstrategiaDelantero subclass: #AColocar
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2023-2C-Parcial-1'!

!AColocar methodsFor: 'calcularFuerza' stamp: 'mmp 4/26/2025 16:21:51'!
calcularEventoCon:pelota En:penales
	^penales calcularEventoDeDelanteroAColocarCon: pelota
	! !


!classDefinition: #AMatar category: #'ISW1-2023-2C-Parcial-1'!
EstrategiaDelantero subclass: #AMatar
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2023-2C-Parcial-1'!

!AMatar methodsFor: 'calcularEvento' stamp: 'mmp 4/26/2025 17:44:50'!
calcularEventoCon: pelota En: penales 
	^penales calcularEventoDeDelanteroAMatarCon:pelota ! !


!classDefinition: #Pelota category: #'ISW1-2023-2C-Parcial-1'!
Object subclass: #Pelota
	instanceVariableNames: 'tipo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2023-2C-Parcial-1'!

!Pelota methodsFor: 'inicializar' stamp: 'mmp 4/26/2025 11:13:22'!
inicializarConTipo: velocidad 
	tipo := velocidad.! !


!Pelota methodsFor: 'acceder' stamp: 'mmp 4/26/2025 12:11:20'!
verTipo
	^tipo .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Pelota class' category: #'ISW1-2023-2C-Parcial-1'!
Pelota class
	instanceVariableNames: ''!

!Pelota class methodsFor: 'instance creation' stamp: 'mmp 4/26/2025 16:26:33'!
jabulaniSudafricanaRapida
	^Jabulani new inicializarConTipo:self.! !

!Pelota class methodsFor: 'instance creation' stamp: 'mmp 4/26/2025 16:26:49'!
playeraLentaCostaAzul
	^Playera new inicializarConTipo: self.! !


!classDefinition: #Jabulani category: #'ISW1-2023-2C-Parcial-1'!
Pelota subclass: #Jabulani
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2023-2C-Parcial-1'!

!Jabulani methodsFor: 'calcularFuerza' stamp: 'mmp 4/26/2025 16:11:04'!
calcularEventoDeDelanteroAColocarEn:penales
	^penales calcularEventoDeDelanteroAColocarConJabulani.! !

!Jabulani methodsFor: 'calcularFuerza' stamp: 'mmp 4/26/2025 17:59:46'!
calcularEventoDeDelanteroAMatarEn: penales 
	^penales calcularEventoDeDelanteroAMatarConJabulani. ! !


!classDefinition: #Playera category: #'ISW1-2023-2C-Parcial-1'!
Pelota subclass: #Playera
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2023-2C-Parcial-1'!

!Playera methodsFor: 'calcularEvento' stamp: 'mmp 4/26/2025 17:31:52'!
calcularEventoDeDelanteroAColocarEn: penales 
	^penales calcularEventoDeDelanteroAColocarConPlayera ! !

!Playera methodsFor: 'calcularEvento' stamp: 'mmp 4/26/2025 18:31:58'!
calcularEventoDeDelanteroAMatarEn: penales 
	^penales calcularEventoDeDelanteroAMatarConPlayera ! !


!classDefinition: #Penales category: #'ISW1-2023-2C-Parcial-1'!
Object subclass: #Penales
	instanceVariableNames: 'arquero delantero puntajeDelArquero puntajeDelDelantero trayectoriaTiro fuerzaResultanteTiro fuerzaResultanteDeAtajada trayectoriaArquero'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2023-2C-Parcial-1'!

!Penales methodsFor: 'calcularEventos' stamp: 'mmp 4/26/2025 16:50:18'!
calcularEventoDeDelanteroAColocarCon:pelota
	fuerzaResultanteTiro := fuerzaResultanteTiro * 0.5.
	^pelota calcularEventoDeDelanteroAColocarEn:self.
	! !

!Penales methodsFor: 'calcularEventos' stamp: 'mmp 4/26/2025 16:18:53'!
calcularEventoDeDelanteroAColocarConJabulani
     ^arquero verTipo calcularEventoDeDelanteroAColocarConJabulaniEn:self.! !

!Penales methodsFor: 'calcularEventos' stamp: 'mmp 4/26/2025 16:47:12'!
calcularEventoDeDelanteroAColocarConJabulaniConArqueroEligeAntesDeTiro
	fuerzaResultanteDeAtajada := fuerzaResultanteDeAtajada * 1.5.
	self seJueganPenalesConNormalidad! !

!Penales methodsFor: 'calcularEventos' stamp: 'mmp 4/26/2025 16:50:38'!
calcularEventoDeDelanteroAColocarConJabulaniConArqueroEsperaPorTiro
	
	self arqueroIgnoraEjeYAlMomentoDeAtajar.! !

!Penales methodsFor: 'calcularEventos' stamp: 'mmp 4/26/2025 17:36:05'!
calcularEventoDeDelanteroAColocarConPlayera
	fuerzaResultanteTiro := fuerzaResultanteTiro * 0.8.
	^arquero verTipo calcularEventoDeDelanteroAColocarConPlayeraEn:self. ! !

!Penales methodsFor: 'calcularEventos' stamp: 'mmp 4/26/2025 17:37:17'!
calcularEventoDeDelanteroAColocarConPlayeraConArqueroEligeAntesDeTiro
	fuerzaResultanteDeAtajada := fuerzaResultanteDeAtajada * 2.
	self seJueganPenalesConNormalidad .! !

!Penales methodsFor: 'calcularEventos' stamp: 'mmp 4/26/2025 17:40:26'!
calcularEventoDeDelanteroAColocarConPlayeraConArqueroEsperaPorTiro
	self ganaAutomaticamenteElDelantero.! !

!Penales methodsFor: 'calcularEventos' stamp: 'mmp 4/26/2025 18:41:18'!
calcularEventoDeDelanteroAMatarCon: pelota 
	^pelota calcularEventoDeDelanteroAMatarEn:self. ! !

!Penales methodsFor: 'calcularEventos' stamp: 'mmp 4/26/2025 18:43:03'!
calcularEventoDeDelanteroAMatarConJabulani
	(self EsUnaEsquina: trayectoriaTiro)ifTrue:[trayectoriaTiro := (trayectoriaTiro x)@1].
	fuerzaResultanteTiro := fuerzaResultanteTiro * 1.2.
	^arquero verTipo calcularEventoDeDelanteroAMatarConJabulaniEn: self ! !

!Penales methodsFor: 'calcularEventos' stamp: 'mmp 4/26/2025 18:23:57'!
calcularEventoDeDelanteroAMatarConJabulaniConArqueroEligeAntesDeTiro
	self arqueroIgnoraEjeYAlMomentoDeAtajar .! !

!Penales methodsFor: 'calcularEventos' stamp: 'mmp 4/26/2025 18:58:21'!
calcularEventoDeDelanteroAMatarConJabulaniConArqueroEsperaPorTiro
	
	self ganaAutomaticamenteElDelantero .! !

!Penales methodsFor: 'calcularEventos' stamp: 'mmp 4/26/2025 18:43:57'!
calcularEventoDeDelanteroAMatarConPlayera
	(self EsUnaEsquina: trayectoriaTiro)
	ifTrue:[trayectoriaTiro := (trayectoriaTiro x)@1]
	ifFalse:[trayectoriaTiro := (trayectoriaTiro x)@(trayectoriaTiro y + 2)].
	^arquero  verTipo calcularEventoDeDelanteroAMatarConPlayeraEn: self.! !

!Penales methodsFor: 'calcularEventos' stamp: 'mmp 4/26/2025 18:36:58'!
calcularEventoDeDelanteroAMatarConPlayeraConArqueroEligeAntesDeTiro
	self arqueroIgnoraEjeXAlMomentoDeAtajar ! !

!Penales methodsFor: 'calcularEventos' stamp: 'mmp 4/26/2025 18:56:11'!
calcularEventoDeDelanteroAMatarConPlayeraConArqueroEsperaPorTiro
	self ganaAutomaticamenteElArquero .! !


!Penales methodsFor: 'ayuda diseñador del juego' stamp: 'mmp 4/26/2025 19:01:01'!
arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: direccionTiro arqueroSeLanzaEnDirección: direccionArquero
	
	self AseguroQueSonDireccionesValidasLa: direccionTiro  Y: direccionArquero. 
	
	trayectoriaTiro := direccionTiro .
	trayectoriaArquero := direccionArquero .
	fuerzaResultanteTiro := delantero verFuerzaBase.
	fuerzaResultanteDeAtajada := arquero verFuerzaBase .
	
	delantero verTipo calcularEventoCon:pelota En:self.
	! !


!Penales methodsFor: 'inicializar' stamp: 'mmp 4/26/2025 16:06:07'!
inicializarConDelantero: delanteroDeEstaRonda yArquero: arqueroDeEstaRonda 
	arquero:=arqueroDeEstaRonda .
	delantero:=delanteroDeEstaRonda .
	arquero juegaPenales: self.
	delantero juegaPenales: self.
	puntajeDelArquero:=0.
	puntajeDelDelantero:=0.! !


!Penales methodsFor: 'acceder' stamp: 'mmp 4/26/2025 11:29:27'!
puntajeDeArquero
	^puntajeDelArquero .! !

!Penales methodsFor: 'acceder' stamp: 'mmp 4/26/2025 11:28:58'!
puntajeDeDelantero
	^puntajeDelDelantero .! !


!Penales methodsFor: 'VAR' stamp: 'mmp 4/26/2025 12:13:10'!
varCapturaFuerzaResultanteDeAtajada: fuerzaFinalAtajada
	fuerzaResultanteDeAtajada := fuerzaFinalAtajada .! !

!Penales methodsFor: 'VAR' stamp: 'mmp 4/26/2025 12:01:34'!
varCapturaFuerzaResultanteDelTiro: fuerzaFinalTiro
	fuerzaResultanteTiro := fuerzaFinalTiro .! !

!Penales methodsFor: 'VAR' stamp: 'mmp 4/26/2025 11:49:57'!
varCapturaTrayectoriaFinalDelTiro: trayectoriaFinalTiro
	trayectoriaTiro:=trayectoriaFinalTiro .! !

!Penales methodsFor: 'VAR' stamp: 'mmp 4/26/2025 11:50:16'!
varDireccionRemateResultante
	^trayectoriaTiro .! !

!Penales methodsFor: 'VAR' stamp: 'mmp 4/26/2025 12:12:24'!
varFuerzaResultanteDeAtajada
	^fuerzaResultanteDeAtajada! !

!Penales methodsFor: 'VAR' stamp: 'mmp 4/26/2025 11:58:02'!
varFuerzaResultanteDeTiro
	^fuerzaResultanteTiro.! !


!Penales methodsFor: 'calcularPuntaje' stamp: 'mmp 4/26/2025 18:45:59'!
arqueroIgnoraEjeXAlMomentoDeAtajar
	(trayectoriaTiro between: 0@0 and: 2@2)
	ifFalse:[puntajeDelArquero := 1]
	ifTrue:[
	((trayectoriaTiro y = trayectoriaArquero y) and: (fuerzaResultanteDeAtajada >= fuerzaResultanteTiro))
		ifTrue:[puntajeDelArquero:=1]
		ifFalse:[puntajeDelDelantero:=1].]! !

!Penales methodsFor: 'calcularPuntaje' stamp: 'mmp 4/26/2025 18:45:43'!
arqueroIgnoraEjeYAlMomentoDeAtajar
	(trayectoriaTiro between: 0@0 and: 2@2)
	ifFalse:[puntajeDelArquero := 1]
	ifTrue:[
	((trayectoriaTiro x = trayectoriaArquero x) and: (fuerzaResultanteDeAtajada >= fuerzaResultanteTiro))
		ifTrue:[puntajeDelArquero:=1]
		ifFalse:[puntajeDelDelantero:=1].]
		! !

!Penales methodsFor: 'calcularPuntaje' stamp: 'mmp 4/26/2025 19:03:27'!
ganaAutomaticamenteElArquero
	puntajeDelArquero := 1.! !

!Penales methodsFor: 'calcularPuntaje' stamp: 'mmp 4/26/2025 17:40:58'!
ganaAutomaticamenteElDelantero
	puntajeDelDelantero := 1.! !

!Penales methodsFor: 'calcularPuntaje' stamp: 'mmp 4/26/2025 18:45:14'!
seJueganPenalesConNormalidad
	(trayectoriaTiro between: 0@0 and: 2@2)
	ifFalse:[puntajeDelArquero := 1]
	ifTrue:[
	(trayectoriaTiro = trayectoriaArquero and: fuerzaResultanteDeAtajada >= fuerzaResultanteTiro)
	ifTrue:[puntajeDelArquero:=1]
	ifFalse:[puntajeDelDelantero:=1].]
		! !


!Penales methodsFor: 'aserciones' stamp: 'mmp 4/26/2025 14:42:36'!
AseguroQueLaDireccionEstaEnRango: direccion SiNoLevantaEsteError: error
	(direccion between: 0@0 and: 2@2)ifFalse:[self error: error].
	^true.! !

!Penales methodsFor: 'aserciones' stamp: 'mmp 4/26/2025 14:40:59'!
AseguroQueSonDireccionesValidasLa: direccionTiro Y: direccionArquero
	^(self AseguroQueLaDireccionEstaEnRango: direccionTiro SiNoLevantaEsteError: self class direccionTiroFueraDeRango )and: (self AseguroQueLaDireccionEstaEnRango: direccionArquero SiNoLevantaEsteError: self class direccionArqueroFueraDeRango )
! !

!Penales methodsFor: 'aserciones' stamp: 'mmp 4/26/2025 18:27:14'!
EsUnaEsquina:unaDireccion
	
	| esquinas |
	esquinas := OrderedCollection with: 0@0 with: 0@2 with: 2@0 with:2@2.
	
	^(esquinas contains: [ :each | unaDireccion = each]).! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Penales class' category: #'ISW1-2023-2C-Parcial-1'!
Penales class
	instanceVariableNames: ''!

!Penales class methodsFor: 'message errors' stamp: 'NR 9/19/2023 06:12:49'!
direccionArqueroFueraDeRango
	
	^'El arquero debe lanzarse a coordenadas válidas'! !

!Penales class methodsFor: 'message errors' stamp: 'NR 9/19/2023 06:12:32'!
direccionTiroFueraDeRango
	
	^'La pelota debe dirigirse a coordenadas válidas'! !


!Penales class methodsFor: 'instance creation' stamp: 'mmp 4/26/2025 11:20:00'!
conDelantero: delanteroDeEstaRonda yArquero: arqueroDeEstaRonda
	^self new inicializarConDelantero: delanteroDeEstaRonda yArquero: arqueroDeEstaRonda ! !

