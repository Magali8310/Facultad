!classDefinition: #TestDePerforación category: #'ISW1-2023-1C-Parcial-1'!
TestCase subclass: #TestDePerforación
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2023-1C-Parcial-1'!

!TestDePerforación methodsFor: 'test' stamp: 'ARM 5/5/2023 17:58:53'!
test01CuandoExcavaSueloArenosoConMechaSoftRemueveCapaArenosa

	| excavadora sueloAExcavar |
	
	sueloAExcavar := {
			CapaDeSuelo arenoso.
			CapaDeSuelo tierra.
			CapaDeSuelo concretoConResistencia: 5 } .
	
	excavadora := Perforadora sobreSuelo: sueloAExcavar.
	
	excavadora ponerMechaSoft.
	
	excavadora darGolpeDeTaladro.
	
	self assert: CapaDeSuelo tierra equals: excavadora capaDeSueloInmediata
	
	! !

!TestDePerforación methodsFor: 'test' stamp: 'ARM 5/5/2023 17:58:58'!
test02CuandoExcavaSueloTierraConMechaSoftNoModificaElSuelo

	| excavadora sueloAExcavar |
	
	sueloAExcavar := {
			CapaDeSuelo tierra.
			CapaDeSuelo concretoConResistencia: 5 } .
	
	excavadora := Perforadora sobreSuelo: sueloAExcavar.
	
	excavadora ponerMechaSoft.
	
	excavadora darGolpeDeTaladro.
	
	self assert: CapaDeSuelo tierra equals: excavadora capaDeSueloInmediata
	
	! !

!TestDePerforación methodsFor: 'test' stamp: 'ARM 5/5/2023 18:02:52'!
test03CuandoExcavaConcretoConMechaSoftSeRompeLaMecha

	| excavadora sueloAExcavar |
	
	sueloAExcavar := {
			CapaDeSuelo concretoConResistencia: 5.
			CapaDeSuelo tierra.} .
	
	excavadora := Perforadora sobreSuelo: sueloAExcavar.
	
	excavadora ponerMechaSoft.
	
	self should: [excavadora darGolpeDeTaladro]
		raise: Error
		withExceptionDo: [:unError |
			self assert: 'Se rompió' equals: unError messageText.
			self assert: excavadora conMechaRota.].
	! !

!TestDePerforación methodsFor: 'test' stamp: 'ARM 5/5/2023 17:59:05'!
test04CuandoExcavaSueloArenosoConMechaWidiaRemueveCapaArenosa

	| excavadora sueloAExcavar |
	
	sueloAExcavar := {
			CapaDeSuelo arenoso.
			CapaDeSuelo tierra.
			CapaDeSuelo concretoConResistencia: 5 } .
	
	excavadora := Perforadora sobreSuelo: sueloAExcavar.
	
	excavadora ponerMechaWidia.
	
	excavadora darGolpeDeTaladro.
	
	self assert: CapaDeSuelo tierra equals: excavadora capaDeSueloInmediata
	
	! !

!TestDePerforación methodsFor: 'test' stamp: 'ARM 5/5/2023 17:59:09'!
test05CuandoExcavaSueloTierraConMechaWidiaEnDosImpactosTransformaLaCapaEnArenoso

	| excavadora sueloAExcavar |
	
	sueloAExcavar := {
			CapaDeSuelo tierra.
			CapaDeSuelo concretoConResistencia: 5 } .
	
	excavadora := Perforadora sobreSuelo: sueloAExcavar.
	
	excavadora ponerMechaWidia.
	
	excavadora darGolpeDeTaladro.
	excavadora darGolpeDeTaladro.	
	
	self assert: CapaDeSuelo arenoso equals: excavadora capaDeSueloInmediata
	
	! !

!TestDePerforación methodsFor: 'test' stamp: 'ARM 5/5/2023 18:02:45'!
test06CuandoExcavaSueloConcretoConMechaWidiaEnTresImpactosRompeLaMecha

	| excavadora sueloAExcavar |
	
	sueloAExcavar := {
			CapaDeSuelo concretoConResistencia: 5.	
			CapaDeSuelo tierra.
} .
	
	excavadora := Perforadora sobreSuelo: sueloAExcavar.
	
	excavadora ponerMechaWidia.
	
	excavadora darGolpeDeTaladro.
	excavadora darGolpeDeTaladro.	
	
	self should: [excavadora darGolpeDeTaladro]
		raise: Error
		withExceptionDo: [:unError |
			self assert: 'Se rompió' equals: unError messageText.
			self assert: excavadora conMechaRota.].
	
	! !

!TestDePerforación methodsFor: 'test' stamp: 'ARM 5/5/2023 18:03:00'!
test07CuandoExcavaSueloArenosoConMechaDiamanteRompeLaMecha

	| excavadora sueloAExcavar |
	
	sueloAExcavar := {
			CapaDeSuelo arenoso.
			CapaDeSuelo tierra.
			CapaDeSuelo concretoConResistencia: 5 } .
	
	excavadora := Perforadora sobreSuelo: sueloAExcavar.
	
	excavadora ponerMechaDiamante.
	
	self should: [excavadora darGolpeDeTaladro]
		raise: Error
		withExceptionDo: [:unError |
			self assert: 'Se rompió' equals: unError messageText.
			self assert: excavadora conMechaRota ].
	
	! !

!TestDePerforación methodsFor: 'test' stamp: 'ARM 5/8/2023 13:10:43'!
test08CuandoExcavaSueloTierraConMechaDiamanteRemueveCapa

	| excavadora sueloAExcavar |
	
	sueloAExcavar := {
			CapaDeSuelo tierra.
			CapaDeSuelo concretoConResistencia: 5 } .
	
	excavadora := Perforadora sobreSuelo: sueloAExcavar.
	
	excavadora ponerMechaDiamante.
	
	excavadora darGolpeDeTaladro.
	
	self assert: (CapaDeSuelo concretoConResistencia: 5) equals: excavadora capaDeSueloInmediata

	
	! !

!TestDePerforación methodsFor: 'test' stamp: 'ARM 5/8/2023 13:10:48'!
test09CuandoExcavaSueloConcretoConMechaDiamanteBajaUnDecimoDeResistencia

	| excavadora sueloAExcavar |
	
	sueloAExcavar := {
			CapaDeSuelo concretoConResistencia: 5.
			CapaDeSuelo tierra.
			} .
	
	excavadora := Perforadora sobreSuelo: sueloAExcavar.
	
	excavadora ponerMechaDiamante.
	
	excavadora darGolpeDeTaladro.
	excavadora darGolpeDeTaladro.	
	
	self assert: (CapaDeSuelo concretoConResistencia: 4) equals: excavadora capaDeSueloInmediata

	
	! !

!TestDePerforación methodsFor: 'test' stamp: 'ARM 4/27/2023 21:54:59'!
test10CuandoRemueveLaCapaYHayPiedrasLasRecolectaEnSuContainer

	| excavadora sueloAExcavar |
	
	sueloAExcavar := {
			CapaDeSuelo arenoso.
			'Mica'.
			'Marmol'
			} .
	
	excavadora := Perforadora sobreSuelo: sueloAExcavar.
	
	excavadora ponerMechaSoft.
	
	excavadora darGolpeDeTaladro.
	
	self assert: {	'Mica'. 'Marmol'} equals: excavadora elementsInContainer
	
	! !

!TestDePerforación methodsFor: 'test' stamp: 'HAW 5/3/2023 22:34:18'!
test11CuandoRemueveLaCapaYNoHayNadaNoRecogeNada

	| excavadora sueloAExcavar |
	
	sueloAExcavar := {
			CapaDeSuelo arenoso.
			} .
	
	excavadora := Perforadora sobreSuelo: sueloAExcavar.
	
	excavadora ponerMechaSoft.
	
	excavadora darGolpeDeTaladro.
	
	self assert: excavadora elementsInContainer isEmpty
	! !

!TestDePerforación methodsFor: 'test' stamp: 'ARM 5/5/2023 18:03:09'!
test12NoPuedePerforarSinMecha

	| excavadora sueloAExcavar |
	
	sueloAExcavar := {
			CapaDeSuelo arenoso.
			} .
	
	excavadora := Perforadora sobreSuelo: sueloAExcavar.
		
	self should: [excavadora darGolpeDeTaladro]
		raise: Error
		withExceptionDo: [:unError |
			self assert: 'No puede perforar' equals: unError messageText.
			self assert: (CapaDeSuelo arenoso) equals: excavadora capaDeSueloInmediata ].	
	! !

!TestDePerforación methodsFor: 'test' stamp: 'FRT 5/5/2023 16:46:32'!
test13PuedeCalcularProfundidadDelSuelo

	| excavadora sueloAExcavar |
	
	sueloAExcavar := { CapaDeSuelo arenoso setAltura: 2. CapaDeSuelo tierra setAltura: 40. CapaDeSuelo arenoso} .
	excavadora := Perforadora sobreSuelo: sueloAExcavar.
	
	self assert: 42 equals: excavadora calcularProfundidadDelSuelo.

	! !

!TestDePerforación methodsFor: 'test' stamp: 'MMP 4/27/2025 23:15:16'!
test14PuedeContarLasCapasDeTipoArenoso

	| excavadora sueloAExcavar |
	
	sueloAExcavar := { CapaDeSuelo arenoso setAltura: 2. CapaDeSuelo tierra setAltura: 40. CapaDeSuelo arenoso. CapaDeSuelo concretoConResistencia: 10 }.
	excavadora := Perforadora sobreSuelo: sueloAExcavar.
	
	self assert: 2 equals: (excavadora contarCapas: Arenoso).

	! !

!TestDePerforación methodsFor: 'test' stamp: 'MMP 4/27/2025 23:15:01'!
test15PuedeContarLasCapasDeTipoTierra

	| excavadora sueloAExcavar |
	
	sueloAExcavar := { CapaDeSuelo arenoso setAltura: 2. CapaDeSuelo tierra setAltura: 40. CapaDeSuelo arenoso. CapaDeSuelo concretoConResistencia: 10 }.
	excavadora := Perforadora sobreSuelo: sueloAExcavar.
	
	self assert: 1 equals: (excavadora contarCapas: Tierra).

	! !

!TestDePerforación methodsFor: 'test' stamp: 'MMP 4/27/2025 23:15:11'!
test16PuedeContarLasCapasDeTipoConcreto

	| excavadora sueloAExcavar |
	
	sueloAExcavar := { CapaDeSuelo arenoso setAltura: 2. CapaDeSuelo tierra setAltura: 40. CapaDeSuelo arenoso. CapaDeSuelo concretoConResistencia: 10 }.
	excavadora := Perforadora sobreSuelo: sueloAExcavar.
	
	self assert: 1 equals: (excavadora contarCapas: Concreto).

	! !

!TestDePerforación methodsFor: 'test' stamp: 'MMP 4/28/2025 00:09:28'!
test17PuedeCalcularProfundidadHastaPrimerCapaDeTipoArenoso

	| excavadora sueloAExcavar |
	
	sueloAExcavar := { CapaDeSuelo arenoso setAltura: 2. CapaDeSuelo tierra setAltura: 40. CapaDeSuelo arenoso. CapaDeSuelo concretoConResistencia: 10 }.
	excavadora := Perforadora sobreSuelo: sueloAExcavar.
	
	self assert: 0 equals: (excavadora calcularProfundidadDelSueloHasta: Arenoso).

	! !

!TestDePerforación methodsFor: 'test' stamp: 'MMP 4/28/2025 00:09:32'!
test18PuedeCalcularProfundidadHastaPrimerCapaDeTipoTierra

	| excavadora sueloAExcavar |
	
	sueloAExcavar := { CapaDeSuelo arenoso setAltura: 2. CapaDeSuelo tierra setAltura: 40. CapaDeSuelo arenoso. CapaDeSuelo concretoConResistencia: 10 }.
	excavadora := Perforadora sobreSuelo: sueloAExcavar.
	
	self assert: 2 equals: (excavadora calcularProfundidadDelSueloHasta: Tierra).

	! !

!TestDePerforación methodsFor: 'test' stamp: 'MMP 4/28/2025 00:09:35'!
test19PuedeCalcularProfundidadHastaPrimerCapaDeTipoConcreto

	| excavadora sueloAExcavar |
	
	sueloAExcavar := { CapaDeSuelo arenoso setAltura: 2. CapaDeSuelo tierra setAltura: 40. CapaDeSuelo arenoso. CapaDeSuelo concretoConResistencia: 10 }.
	excavadora := Perforadora sobreSuelo: sueloAExcavar.
	
	self assert: 42 equals: (excavadora calcularProfundidadDelSueloHasta: Concreto).

	! !


!classDefinition: #CapaDeSuelo category: #'ISW1-2023-1C-Parcial-1'!
Object subclass: #CapaDeSuelo
	instanceVariableNames: 'resistencia altura'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2023-1C-Parcial-1'!

!CapaDeSuelo methodsFor: 'initialization' stamp: 'MMP 4/27/2025 23:30:07'!
initialize
	altura := 0! !


!CapaDeSuelo methodsFor: 'tipo' stamp: 'MMP 4/27/2025 21:20:03'!
esArenoso

	self subclassResponsibility! !

!CapaDeSuelo methodsFor: 'tipo' stamp: 'MMP 4/27/2025 21:20:15'!
esConcreto

	self subclassResponsibility! !

!CapaDeSuelo methodsFor: 'tipo' stamp: 'MMP 4/27/2025 21:20:28'!
esTierra

	self subclassResponsibility! !


!CapaDeSuelo methodsFor: 'comparing' stamp: 'MMP 4/27/2025 21:24:20'!
= unaCapaDeSuelo

	^(unaCapaDeSuelo isKindOf: self class) and: [resistencia = unaCapaDeSuelo resistencia].! !

!CapaDeSuelo methodsFor: 'comparing' stamp: 'MMP 4/27/2025 21:24:39'!
hash

	^self class hash + resistencia hash! !


!CapaDeSuelo methodsFor: 'bajar resistencia' stamp: 'ARM 5/8/2023 13:10:22'!
bajaUnDecimoDeResistencia
	resistencia := resistencia - 1! !

!CapaDeSuelo methodsFor: 'bajar resistencia' stamp: 'ARM 5/8/2023 13:10:22'!
sinResistencia
	^resistencia = 0! !


!CapaDeSuelo methodsFor: 'accessing' stamp: 'FRT 5/5/2023 16:48:52'!
altura

	^ altura.! !

!CapaDeSuelo methodsFor: 'accessing' stamp: 'ARM 5/8/2023 13:10:35'!
resistencia

	^ resistencia.! !

!CapaDeSuelo methodsFor: 'accessing' stamp: 'MMP 4/27/2025 21:25:30'!
tipo

	^self.! !


!CapaDeSuelo methodsFor: 'scan' stamp: 'MMP 4/27/2025 21:27:44'!
scan

	self subclassResponsibility! !


!CapaDeSuelo methodsFor: 'excavation' stamp: 'MMP 4/27/2025 21:53:11'!
darGolpeDeTaladroConMechaFuncional: perforadora

	self subclassResponsibility! !


!CapaDeSuelo methodsFor: 'setters' stamp: 'FRT 5/5/2023 16:07:55'!
setAltura: unaAltura

	altura := unaAltura! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CapaDeSuelo class' category: #'ISW1-2023-1C-Parcial-1'!
CapaDeSuelo class
	instanceVariableNames: ''!

!CapaDeSuelo class methodsFor: 'instance creation' stamp: 'MMP 4/27/2025 23:30:43'!
arenoso

	^Arenoso new initialize .! !

!CapaDeSuelo class methodsFor: 'instance creation' stamp: 'MMP 4/27/2025 21:16:10'!
concretoConResistencia: resistencia 

	^Concreto new initializeConcretoConResistencia: resistencia ! !

!CapaDeSuelo class methodsFor: 'instance creation' stamp: 'MMP 4/27/2025 23:30:35'!
tierra

	^Tierra new initialize .! !


!CapaDeSuelo class methodsFor: 'assertions' stamp: 'MMP 4/27/2025 23:39:27'!
assertNoTieneElMismoScan: unaCapa 
	^(self assertTieneElMismoScan: unaCapa) not! !


!classDefinition: #Arenoso category: #'ISW1-2023-1C-Parcial-1'!
CapaDeSuelo subclass: #Arenoso
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2023-1C-Parcial-1'!

!Arenoso methodsFor: 'tipo' stamp: 'MMP 4/27/2025 21:20:38'!
esArenoso
	^true! !

!Arenoso methodsFor: 'tipo' stamp: 'MMP 4/27/2025 21:20:47'!
esConcreto
	^false! !

!Arenoso methodsFor: 'tipo' stamp: 'MMP 4/27/2025 21:20:52'!
esTierra
	^false! !


!Arenoso methodsFor: 'scan' stamp: 'MMP 4/27/2025 23:17:09'!
scan
	^7! !


!Arenoso methodsFor: 'excavation' stamp: 'MMP 4/27/2025 22:00:22'!
darGolpeDeTaladroConMechaFuncional:perforadora
	
	^perforadora darGolpeDeTaladroEnSueloArenosoConMechaFuncional.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Arenoso class' category: #'ISW1-2023-1C-Parcial-1'!
Arenoso class
	instanceVariableNames: ''!

!Arenoso class methodsFor: 'scan' stamp: 'MMP 4/27/2025 23:18:30'!
scan
! !


!Arenoso class methodsFor: 'assertions' stamp: 'MMP 4/27/2025 23:34:24'!
assertTieneElMismoScan: unaCapa
	^unaCapa scan = 7! !


!classDefinition: #Concreto category: #'ISW1-2023-1C-Parcial-1'!
CapaDeSuelo subclass: #Concreto
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2023-1C-Parcial-1'!

!Concreto methodsFor: 'initialization' stamp: 'MMP 4/27/2025 23:30:21'!
initializeConcretoConResistencia: resistenciaInicial 
	resistencia := resistenciaInicial.
	super initialize 
	! !


!Concreto methodsFor: 'tipo' stamp: 'MMP 4/27/2025 21:21:04'!
esArenoso
	^false! !

!Concreto methodsFor: 'tipo' stamp: 'MMP 4/27/2025 21:21:18'!
esConcreto
	^true! !

!Concreto methodsFor: 'tipo' stamp: 'MMP 4/27/2025 21:21:12'!
esTierra
	^false! !


!Concreto methodsFor: 'scan' stamp: 'MMP 4/27/2025 23:17:00'!
scan
	^ 50. ! !


!Concreto methodsFor: 'excavation' stamp: 'MMP 4/27/2025 22:12:51'!
darGolpeDeTaladroConMechaFuncional:perforadora
	^perforadora darGolpeDeTaladroEnConcretoConMechaFuncional ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Concreto class' category: #'ISW1-2023-1C-Parcial-1'!
Concreto class
	instanceVariableNames: ''!


!Concreto class methodsFor: 'assertions' stamp: 'MMP 4/27/2025 23:26:03'!
assertTieneElMismoScan: unaCapa 
	^unaCapa scan = 50! !


!classDefinition: #Tierra category: #'ISW1-2023-1C-Parcial-1'!
CapaDeSuelo subclass: #Tierra
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2023-1C-Parcial-1'!

!Tierra methodsFor: 'tipo' stamp: 'MMP 4/27/2025 21:21:33'!
esArenoso
	^false! !

!Tierra methodsFor: 'tipo' stamp: 'MMP 4/27/2025 21:21:47'!
esConcreto
	^false! !

!Tierra methodsFor: 'tipo' stamp: 'MMP 4/27/2025 21:21:52'!
esTierra
	^true! !


!Tierra methodsFor: 'scan' stamp: 'MMP 4/27/2025 23:17:48'!
scan
	^10! !


!Tierra methodsFor: 'excavation' stamp: 'MMP 4/27/2025 22:09:04'!
darGolpeDeTaladroConMechaFuncional:perforadora
	^perforadora darGolpeDeTaladroEnTierraConMechaFuncional.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Tierra class' category: #'ISW1-2023-1C-Parcial-1'!
Tierra class
	instanceVariableNames: ''!

!Tierra class methodsFor: 'scan' stamp: 'MMP 4/27/2025 23:26:59'!
assertTieneElMismoScan: unaCapa
	^unaCapa scan = 10! !


!classDefinition: #Mecha category: #'ISW1-2023-1C-Parcial-1'!
Object subclass: #Mecha
	instanceVariableNames: 'perforadora'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2023-1C-Parcial-1'!

!Mecha methodsFor: 'excavation' stamp: 'MMP 4/27/2025 21:43:03'!
darGolpeDeTaladro
	self subclassResponsibility ! !


!Mecha methodsFor: 'aserciones' stamp: 'MMP 4/27/2025 22:21:15'!
soyMechaRota

	self subclassResponsibility! !


!Mecha methodsFor: 'inicializar' stamp: 'MMP 4/27/2025 21:37:10'!
inicializarCon: unaPerforadora
	perforadora := unaPerforadora .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Mecha class' category: #'ISW1-2023-1C-Parcial-1'!
Mecha class
	instanceVariableNames: ''!

!Mecha class methodsFor: 'instance creation' stamp: 'MMP 4/27/2025 21:37:56'!
con: unaPerforadora
	^self new inicializarCon: unaPerforadora .! !


!classDefinition: #MechaFuncional category: #'ISW1-2023-1C-Parcial-1'!
Mecha subclass: #MechaFuncional
	instanceVariableNames: 'tipoDeSuelo mechaPuesta vecesQueGolpeoCapaActual capasDeSueloDebajo container'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2023-1C-Parcial-1'!

!MechaFuncional methodsFor: 'excavation' stamp: 'MMP 4/27/2025 21:48:43'!
darGolpeDeTaladro
	^perforadora darGolpeDeTaladroConMechaFuncional ! !

!MechaFuncional methodsFor: 'excavation' stamp: 'MMP 4/27/2025 22:16:50'!
darGolpeDeTaladroEnConcreto

	self subclassResponsibility! !

!MechaFuncional methodsFor: 'excavation' stamp: 'MMP 4/27/2025 22:03:18'!
darGolpeDeTaladroEnSueloArenoso

	self subclassResponsibility! !

!MechaFuncional methodsFor: 'excavation' stamp: 'MMP 4/27/2025 22:47:32'!
darGolpeDeTaladroEnTierra

	self subclassResponsibility ! !


!MechaFuncional methodsFor: 'aserciones' stamp: 'MMP 4/27/2025 22:22:09'!
soyMechaRota
^false.! !


!classDefinition: #Diamante category: #'ISW1-2023-1C-Parcial-1'!
MechaFuncional subclass: #Diamante
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2023-1C-Parcial-1'!

!Diamante methodsFor: 'excavation' stamp: 'MMP 4/27/2025 22:28:39'!
darGolpeDeTaladroEnConcreto
	^perforadora darGolpeDeTaladroEnConcretoConMechaDiamante! !

!Diamante methodsFor: 'excavation' stamp: 'MMP 4/27/2025 22:04:09'!
darGolpeDeTaladroEnSueloArenoso
 ^perforadora darGolpeDeTaladroEnSueloArenosoConMechaDiamante ! !

!Diamante methodsFor: 'excavation' stamp: 'MMP 4/27/2025 22:46:57'!
darGolpeDeTaladroEnTierra
 ^perforadora darGolpeDeTaladroEnTierraConMechaDiamante ! !


!classDefinition: #Soft category: #'ISW1-2023-1C-Parcial-1'!
MechaFuncional subclass: #Soft
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2023-1C-Parcial-1'!

!Soft methodsFor: 'excavation' stamp: 'MMP 4/27/2025 22:17:22'!
darGolpeDeTaladroEnConcreto
	^perforadora darGolpeDeTaladroEnConcretoConMechaSoft! !

!Soft methodsFor: 'excavation' stamp: 'MMP 4/27/2025 22:03:45'!
darGolpeDeTaladroEnSueloArenoso
	^perforadora darGolpeDeTaladroEnSueloArenosoConMechaSoft .! !

!Soft methodsFor: 'excavation' stamp: 'MMP 4/27/2025 22:10:33'!
darGolpeDeTaladroEnTierra
	^perforadora darGolpeDeTaladroEnTierraConMechaSoft ! !


!classDefinition: #Widia category: #'ISW1-2023-1C-Parcial-1'!
MechaFuncional subclass: #Widia
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2023-1C-Parcial-1'!

!Widia methodsFor: 'excavation' stamp: 'MMP 4/27/2025 22:24:50'!
darGolpeDeTaladroEnConcreto

	^perforadora darGolpeDeTaladroEnConcretoConMechaWidia ! !

!Widia methodsFor: 'excavation' stamp: 'MMP 4/27/2025 22:04:26'!
darGolpeDeTaladroEnSueloArenoso
	^perforadora darGolpeDeTaladroEnSueloArenosoConMechaWidia ! !

!Widia methodsFor: 'excavation' stamp: 'MMP 4/27/2025 22:47:16'!
darGolpeDeTaladroEnTierra
	^perforadora darGolpeDeTaladroEnTierraConMechaWidia ! !


!classDefinition: #MechaRota category: #'ISW1-2023-1C-Parcial-1'!
Mecha subclass: #MechaRota
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2023-1C-Parcial-1'!

!MechaRota methodsFor: 'aserciones' stamp: 'MMP 4/27/2025 22:22:20'!
soyMechaRota
	^true.! !


!classDefinition: #SinMecha category: #'ISW1-2023-1C-Parcial-1'!
Mecha subclass: #SinMecha
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2023-1C-Parcial-1'!

!SinMecha methodsFor: 'excavation' stamp: 'MMP 4/27/2025 21:48:36'!
darGolpeDeTaladro
	^perforadora darGolpeDeTaladroSinMecha! !


!SinMecha methodsFor: 'aserciones' stamp: 'MMP 4/27/2025 22:22:32'!
soyMechaRota
	^false! !


!classDefinition: #Perforadora category: #'ISW1-2023-1C-Parcial-1'!
Object subclass: #Perforadora
	instanceVariableNames: 'tipoDeSuelo mechaPuesta vecesQueGolpeoCapaActual capasDeSueloDebajo container'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2023-1C-Parcial-1'!

!Perforadora methodsFor: 'cambiar capa' stamp: 'ARM 5/1/2023 20:07:29'!
pasarAProximaCapa
	vecesQueGolpeoCapaActual := 0.
	capasDeSueloDebajo := capasDeSueloDebajo allButFirst.
	capasDeSueloDebajo ifEmpty: [^self]. 
	(capasDeSueloDebajo first isKindOf: CapaDeSuelo) ifFalse:[
			container addAll: capasDeSueloDebajo.
		]! !

!Perforadora methodsFor: 'cambiar capa' stamp: 'ARM 4/27/2023 20:46:30'!
transformarCapaEnArenoso
	capasDeSueloDebajo :=
			capasDeSueloDebajo allButFirst asOrderedCollection
			addFirst: CapaDeSuelo arenoso;
			yourself! !


!Perforadora methodsFor: 'excavation' stamp: 'MMP 4/27/2025 21:49:33'!
darGolpeDeTaladro
	^mechaPuesta darGolpeDeTaladro ! !

!Perforadora methodsFor: 'excavation' stamp: 'MMP 4/27/2025 22:01:26'!
darGolpeDeTaladroConMechaFuncional

	vecesQueGolpeoCapaActual := vecesQueGolpeoCapaActual + 1.
	
	self capaDeSueloInmediata darGolpeDeTaladroConMechaFuncional:self.! !

!Perforadora methodsFor: 'excavation' stamp: 'MMP 4/27/2025 22:29:16'!
darGolpeDeTaladroEnConcretoConMechaDiamante
	vecesQueGolpeoCapaActual even ifTrue: [ capasDeSueloDebajo first bajaUnDecimoDeResistencia].
	capasDeSueloDebajo first sinResistencia ifTrue: [ ^self transformarCapaEnArenoso].
	^vecesQueGolpeoCapaActual! !

!Perforadora methodsFor: 'excavation' stamp: 'MMP 4/27/2025 22:15:28'!
darGolpeDeTaladroEnConcretoConMechaFuncional
	^mechaPuesta darGolpeDeTaladroEnConcreto.! !

!Perforadora methodsFor: 'excavation' stamp: 'MMP 4/27/2025 22:18:27'!
darGolpeDeTaladroEnConcretoConMechaSoft
	mechaPuesta := MechaRota con: self. 
	self error: 'Se rompió'.! !

!Perforadora methodsFor: 'excavation' stamp: 'MMP 4/27/2025 22:26:06'!
darGolpeDeTaladroEnConcretoConMechaWidia
	vecesQueGolpeoCapaActual = 3 ifTrue: [ 
		mechaPuesta := MechaRota con:self. 
		self error: 'Se rompió' ].
	^self ! !

!Perforadora methodsFor: 'excavation' stamp: 'MMP 4/27/2025 22:06:25'!
darGolpeDeTaladroEnSueloArenosoConMechaDiamante

	mechaPuesta := MechaRota con:self.
	
	self error: 'Se rompió'! !

!Perforadora methodsFor: 'excavation' stamp: 'MMP 4/27/2025 22:05:23'!
darGolpeDeTaladroEnSueloArenosoConMechaFuncional

	^mechaPuesta darGolpeDeTaladroEnSueloArenoso. 
	! !

!Perforadora methodsFor: 'excavation' stamp: 'MMP 4/27/2025 22:05:06'!
darGolpeDeTaladroEnSueloArenosoConMechaSoft

	^self pasarAProximaCapa
	! !

!Perforadora methodsFor: 'excavation' stamp: 'MMP 4/27/2025 22:06:56'!
darGolpeDeTaladroEnSueloArenosoConMechaWidia

	^self pasarAProximaCapa
		! !

!Perforadora methodsFor: 'excavation' stamp: 'MMP 4/27/2025 22:28:01'!
darGolpeDeTaladroEnTierraConMechaDiamante
	^self pasarAProximaCapa! !

!Perforadora methodsFor: 'excavation' stamp: 'MMP 4/27/2025 22:09:41'!
darGolpeDeTaladroEnTierraConMechaFuncional
	^mechaPuesta darGolpeDeTaladroEnTierra.! !

!Perforadora methodsFor: 'excavation' stamp: 'MMP 4/27/2025 22:10:53'!
darGolpeDeTaladroEnTierraConMechaSoft
	^self! !

!Perforadora methodsFor: 'excavation' stamp: 'MMP 4/27/2025 22:24:12'!
darGolpeDeTaladroEnTierraConMechaWidia
	vecesQueGolpeoCapaActual = 2 ifTrue: [ ^self transformarCapaEnArenoso ].
	^self! !

!Perforadora methodsFor: 'excavation' stamp: 'MMP 4/27/2025 21:48:59'!
darGolpeDeTaladroSinMecha
		self error: 'No puede perforar'
! !


!Perforadora methodsFor: 'initialization' stamp: 'MMP 4/27/2025 21:37:57'!
initializeSobreSuelo: capasDeSueloAExcavarInicialmente

	capasDeSueloDebajo := capasDeSueloAExcavarInicialmente.
	vecesQueGolpeoCapaActual := 0.
	container := OrderedCollection new.
	mechaPuesta := SinMecha con:self! !


!Perforadora methodsFor: 'accessing' stamp: 'ARM 4/27/2023 20:17:21'!
capaDeSueloInmediata
	^capasDeSueloDebajo first! !

!Perforadora methodsFor: 'accessing' stamp: 'MMP 4/27/2025 22:21:54'!
conMechaRota

	^mechaPuesta soyMechaRota .! !

!Perforadora methodsFor: 'accessing' stamp: 'ARM 4/27/2023 21:12:20'!
elementsInContainer
	^container asArray! !

!Perforadora methodsFor: 'accessing' stamp: 'MMP 4/27/2025 21:40:44'!
sinMecha

	^mechaPuesta = SinMecha con:self.! !


!Perforadora methodsFor: 'sobre qué suelo' stamp: 'ARM 4/27/2023 20:13:17'!
sobreSueloArenoso
	^capasDeSueloDebajo first esArenoso! !

!Perforadora methodsFor: 'sobre qué suelo' stamp: 'ARM 4/27/2023 20:16:14'!
sobreSueloConcreto
	^capasDeSueloDebajo first esConcreto! !

!Perforadora methodsFor: 'sobre qué suelo' stamp: 'ARM 4/27/2023 20:13:58'!
sobreSueloTierra
	^capasDeSueloDebajo first esTierra! !


!Perforadora methodsFor: 'colocar mecha' stamp: 'MMP 4/27/2025 21:39:04'!
ponerMechaDiamante
	mechaPuesta := Diamante con: self! !

!Perforadora methodsFor: 'colocar mecha' stamp: 'MMP 4/27/2025 21:39:16'!
ponerMechaSoft
	mechaPuesta := Soft con: self.! !

!Perforadora methodsFor: 'colocar mecha' stamp: 'MMP 4/27/2025 21:39:25'!
ponerMechaWidia
	mechaPuesta := Widia con:self.! !


!Perforadora methodsFor: 'scan' stamp: 'MMP 4/28/2025 00:08:27'!
calcularProfundidadDelSuelo
	
	| acc |

	acc := 0.
	
	capasDeSueloDebajo do: [ :each |  acc := acc + each altura		].

	^ acc.
	
	 ! !

!Perforadora methodsFor: 'scan' stamp: 'MMP 4/28/2025 00:08:56'!
calcularProfundidadDelSueloHasta: tipoDeCapa
	
	| noAlcanceElHasta totalAltura|
	noAlcanceElHasta := true.
	totalAltura := 0.
	
	capasDeSueloDebajo 
	select: [ :each | noAlcanceElHasta := noAlcanceElHasta and: (tipoDeCapa assertNoTieneElMismoScan: each)] 
	thenDo: [ :each | totalAltura := totalAltura + each altura ].
	
	^totalAltura 
	
	 ! !

!Perforadora methodsFor: 'scan' stamp: 'MMP 4/27/2025 23:22:35'!
contarCapas: tipoDeCapa
	
	"Cuenta las capas de tipo tipoDeCapa. Recordar que para identificar cada capa se utiliza el valor de scan que retorna. Por ej. un capa tipo Arenoso retorna 7 al scan"
	
	^capasDeSueloDebajo count: [:each | tipoDeCapa assertTieneElMismoScan: each].
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Perforadora class' category: #'ISW1-2023-1C-Parcial-1'!
Perforadora class
	instanceVariableNames: ''!

!Perforadora class methodsFor: 'instance creation' stamp: 'ARM 4/27/2023 20:07:05'!
sobreSuelo: capasDeSueloAExcavar 

	^self new initializeSobreSuelo: capasDeSueloAExcavar ! !
