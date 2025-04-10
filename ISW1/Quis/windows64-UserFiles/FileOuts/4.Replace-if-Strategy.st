!classDefinition: #VehicleTests category: #'4.Replace-if-Strategy'!
TestCase subclass: #VehicleTests
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!
!VehicleTests commentStamp: '<historical>' prior: 0!
ElectricMotorcycle new!


!VehicleTests methodsFor: 'testing' stamp: 'NR 9/7/2024 18:25:03'!
test01LandVehicleCannotAccelerateWhileTurnedOff

	| landVehicle |
	
	landVehicle := Vehicle electricMotorcycle.
	
	self should: [ landVehicle accelerate ] 
	raise: Error 
	withExceptionDo: [ :error | error messageText = 'Can not run when turned off'.
		self assert: (landVehicle speedAt: (0 * kilometer / hour)) ]
	
	
	! !

!VehicleTests methodsFor: 'testing' stamp: 'NR 9/7/2024 18:27:17'!
test02AirVehicleCannotAccelerateWhileTurnedOff

	| airVehicle |
	
	airVehicle := Vehicle helicopter.
	
	self should: [ airVehicle accelerate ] 
	raise: Error 
	withExceptionDo: [ :error | error messageText = 'Can not fly when turned off'.
		self assert: (airVehicle speedAt: (0 * kilometer / hour)).
		self assert: (airVehicle altitudeAt: (0 * meter)) ]
	
	
	! !

!VehicleTests methodsFor: 'testing' stamp: 'NR 9/7/2024 18:52:20'!
test03ElectricVehicleAccelerateAsIntended

	| electricVehicle |
	
	electricVehicle := Vehicle electricMotorcycle.
	
	electricVehicle turnOn.
	self assert: (electricVehicle speedAt: 0 * kilometer / hour).
	
	electricVehicle accelerate.
	self assert: (electricVehicle speedAt: 10 * kilometer / hour).
	
	electricVehicle accelerate.
	self assert: (electricVehicle speedAt: 40 * kilometer / hour)
	
	
	
	
	! !

!VehicleTests methodsFor: 'testing' stamp: 'NR 9/7/2024 18:52:16'!
test04GasolineVehicleAccelerateAsIntended

	| gasolineVehicle |
	
	gasolineVehicle := Vehicle gasolineMotorcycle.
	
	gasolineVehicle turnOn.
	self assert: (gasolineVehicle speedAt: 0 * kilometer / hour).
	
	gasolineVehicle accelerate.
	self assert: (gasolineVehicle speedAt: 10 * kilometer / hour).
	
	gasolineVehicle accelerate.
	self assert: (gasolineVehicle speedAt: 20 * kilometer / hour)
	
	
	
	
	! !

!VehicleTests methodsFor: 'testing' stamp: 'NR 9/7/2024 18:52:11'!
test05JetFueledVehicleAccelerateAsIntended

	| jetFueledVehicle |
	
	jetFueledVehicle := Vehicle helicopter.
	
	jetFueledVehicle turnOn.
	self assert: (jetFueledVehicle speedAt: 0 * kilometer / hour).
	
	jetFueledVehicle accelerate.
	self assert: (jetFueledVehicle speedAt: 1 * kilometer / hour).
	
	jetFueledVehicle accelerate.
	self assert: (jetFueledVehicle speedAt: 5 * kilometer / hour).
	
	jetFueledVehicle accelerate.
	self assert: (jetFueledVehicle speedAt: 41 * kilometer / hour)
	
	
	
	
	! !

!VehicleTests methodsFor: 'testing' stamp: 'NR 9/7/2024 18:47:14'!
test06AirVehicleGoesUpAsItAcceleratesAsExpected

	| airVehicle |
	
	airVehicle := Vehicle helicopter.
	
	airVehicle turnOn.
	self assert: (airVehicle altitudeAt: 0 * meter).
	
	airVehicle accelerate.
	self assert: (airVehicle altitudeAt: 5 * meter).
	
	airVehicle accelerate.
	self assert: (airVehicle altitudeAt: 10 * meter)
	
	! !

!VehicleTests methodsFor: 'testing' stamp: 'NR 9/7/2024 18:52:05'!
test07SpeedLimiterForCityLimitsSpeedAt70Kmh

	| cityVehicle |
	
	cityVehicle := Vehicle electricMotorcycle.
	
	cityVehicle turnOn.
	self assert: (cityVehicle speedAt: 0 * kilometer / hour).
	
	20 timesRepeat: [ cityVehicle accelerate ].
	
	self assert: (cityVehicle speedAt: 70 * kilometer / hour)
	
	
	! !

!VehicleTests methodsFor: 'testing' stamp: 'NR 9/7/2024 18:53:50'!
test08SpeedLimiterForOpenRoadLimitsSpeedAt130Kmh

	| openRoadVehicle |
	
	openRoadVehicle := Vehicle gasolineMotorcycle.
	
	openRoadVehicle turnOn.
	self assert: (openRoadVehicle speedAt: 0 * kilometer / hour).
	
	20 timesRepeat: [ openRoadVehicle accelerate ].
	
	self assert: (openRoadVehicle speedAt: 130 * kilometer / hour)
	
	
	! !

!VehicleTests methodsFor: 'testing' stamp: 'NR 9/7/2024 18:55:32'!
test09SpeedLimiterForAirTrafficLimitsSpeedAt500Kmh

	| vehicleInAir |
	
	vehicleInAir := Vehicle helicopter.
	
	vehicleInAir turnOn.
	self assert: (vehicleInAir speedAt: 0 * kilometer / hour).
	
	20 timesRepeat: [ vehicleInAir accelerate ].
	
	self assert: (vehicleInAir speedAt: 500 * kilometer / hour)
	
	
	! !


!classDefinition: #Engine category: #'4.Replace-if-Strategy'!
Object subclass: #Engine
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!


!classDefinition: #ElectricEngine category: #'4.Replace-if-Strategy'!
Engine subclass: #ElectricEngine
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!


!classDefinition: #GasolineEngine category: #'4.Replace-if-Strategy'!
Engine subclass: #GasolineEngine
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!


!classDefinition: #JetFueledEngine category: #'4.Replace-if-Strategy'!
Engine subclass: #JetFueledEngine
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!


!classDefinition: #Environment category: #'4.Replace-if-Strategy'!
Object subclass: #Environment
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!


!classDefinition: #Cities category: #'4.Replace-if-Strategy'!
Environment subclass: #Cities
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!


!classDefinition: #OpenRoad category: #'4.Replace-if-Strategy'!
Environment subclass: #OpenRoad
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!


!classDefinition: #Skies category: #'4.Replace-if-Strategy'!
Environment subclass: #Skies
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!


!classDefinition: #PowerState category: #'4.Replace-if-Strategy'!
Object subclass: #PowerState
	instanceVariableNames: 'vehicleToPower'
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!PowerState methodsFor: 'initialize' stamp: 'MMP 4/10/2025 15:30:35'!
initilizeWithVehicle: aVehicle
	vehicleToPower := aVehicle.! !


!PowerState methodsFor: 'move' stamp: 'MMP 4/10/2025 15:45:25'!
accelerate
	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PowerState class' category: #'4.Replace-if-Strategy'!
PowerState class
	instanceVariableNames: ''!

!PowerState class methodsFor: 'instance creation' stamp: 'MMP 4/10/2025 15:39:04'!
on: aVehicle
	^self new initilizeWithVehicle: aVehicle.! !


!classDefinition: #StateOff category: #'4.Replace-if-Strategy'!
PowerState subclass: #StateOff
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!StateOff methodsFor: 'move' stamp: 'MMP 4/10/2025 15:18:09'!
accelerate
	vehicleToPower accelerateWhenOff! !


!classDefinition: #StateOn category: #'4.Replace-if-Strategy'!
PowerState subclass: #StateOn
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!StateOn methodsFor: 'move' stamp: 'MMP 4/10/2025 15:50:35'!
accelerate
	vehicleToPower accelerateWhenOn.! !


!classDefinition: #Vehicle category: #'4.Replace-if-Strategy'!
Object subclass: #Vehicle
	instanceVariableNames: 'powerStatus speed altitude engineType where'
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!Vehicle methodsFor: 'initialization' stamp: 'MMP 4/10/2025 17:49:12'!
initialize
	self turnOff.
	speed := 0 * kilometer / hour.! !


!Vehicle methodsFor: 'move' stamp: 'MMP 4/10/2025 17:25:33'!
accelerate
	powerStatus accelerate.! !

!Vehicle methodsFor: 'move' stamp: 'MMP 4/10/2025 17:25:40'!
accelerateWhenOff
	self subclassResponsibility .! !

!Vehicle methodsFor: 'move' stamp: 'MMP 4/10/2025 15:56:31'!
accelerateWhenOn
	self subclassResponsibility .! !

!Vehicle methodsFor: 'move' stamp: 'NR 9/7/2024 18:24:00'!
altitudeAt: anAltitude

	^ altitude = anAltitude! !

!Vehicle methodsFor: 'move' stamp: 'MMP 4/10/2025 18:08:47'!
increaseSpeedWithAcceleration: anAccelerationFormulaBlock Upto: aMaximum
	| acceleration |
	acceleration := anAccelerationFormulaBlock value.
	speed := acceleration + speed.
	speed > aMaximum ifTrue: [ speed := aMaximum ]! !

!Vehicle methodsFor: 'move' stamp: 'NR 9/7/2024 18:23:27'!
speedAt: aSpeed

	^ speed = aSpeed! !


!Vehicle methodsFor: 'on/off' stamp: 'MMP 4/10/2025 17:28:04'!
turnOff
	powerStatus := StateOff on: self.
	
	speed := 0 * kilometer / hour! !

!Vehicle methodsFor: 'on/off' stamp: 'MMP 4/10/2025 15:43:22'!
turnOn
	powerStatus := StateOn on: self.
	
	speed := 0 * kilometer / hour! !


!Vehicle methodsFor: 'error messages' stamp: 'MMP 4/10/2025 17:37:03'!
canNotAccelerateErrorMessage
	self subclassResponsibility .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Vehicle class' category: #'4.Replace-if-Strategy'!
Vehicle class
	instanceVariableNames: ''!

!Vehicle class methodsFor: 'instance creation' stamp: 'MMP 4/10/2025 17:52:07'!
electricMotorcycle

	^ElectricMotorcycle new initialize .! !

!Vehicle class methodsFor: 'instance creation' stamp: 'MMP 4/10/2025 17:51:59'!
gasolineMotorcycle

	^GasolineMotorcycle new.! !

!Vehicle class methodsFor: 'instance creation' stamp: 'MMP 4/10/2025 17:52:14'!
helicopter

	^ Helicopter new initialize .! !


!classDefinition: #Helicopter category: #'4.Replace-if-Strategy'!
Vehicle subclass: #Helicopter
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!
!Helicopter commentStamp: '<historical>' prior: 0!
ElectricMotorcycle new!


!Helicopter methodsFor: 'error messages' stamp: 'MMP 4/10/2025 17:31:55'!
canNotAccelerateErrorMessage
	^'Can not fly when turned off'! !


!Helicopter methodsFor: 'move' stamp: 'MMP 4/10/2025 17:32:12'!
accelerateWhenOff
	self error: self canNotAccelerateErrorMessage ! !

!Helicopter methodsFor: 'move' stamp: 'MMP 4/10/2025 18:11:52'!
accelerateWhenOn
	self increaseSpeedWithAcceleration:[((speed amount + 1) ^ 2) * kilometer / hour]Upto: 500 * kilometer / hour.
	altitude := altitude + (5 * meter).! !


!Helicopter methodsFor: 'initialization' stamp: 'MMP 4/10/2025 17:38:11'!
initialize
	super initialize .
	altitude := 0 * meter.
	engineType := JetFueledEngine new.
	where := Skies new.! !


!classDefinition: #Motorcycle category: #'4.Replace-if-Strategy'!
Vehicle subclass: #Motorcycle
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!Motorcycle methodsFor: 'error messages' stamp: 'MMP 4/10/2025 17:31:01'!
canNotAccelerateErrorMessage
	^'Can not run when turned off'! !


!Motorcycle methodsFor: 'move' stamp: 'MMP 4/10/2025 17:31:30'!
accelerateWhenOff
	self error: self canNotAccelerateErrorMessage! !

!Motorcycle methodsFor: 'move' stamp: 'MMP 4/10/2025 15:56:52'!
accelerateWhenOn
	self subclassResponsibility.! !


!Motorcycle methodsFor: 'initialization' stamp: 'MMP 4/10/2025 15:23:22'!
initialize
	super initialize.! !


!classDefinition: #ElectricMotorcycle category: #'4.Replace-if-Strategy'!
Motorcycle subclass: #ElectricMotorcycle
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!
!ElectricMotorcycle commentStamp: '<historical>' prior: 0!
ElectricMotorcycle new!


!ElectricMotorcycle methodsFor: 'initialization' stamp: 'MMP 4/10/2025 15:23:37'!
initialize
	super initialize.
	where := Cities new.
	engineType := ElectricEngine new.
	! !


!ElectricMotorcycle methodsFor: 'move' stamp: 'MMP 4/10/2025 18:06:59'!
accelerateWhenOn
	self increaseSpeedWithAcceleration:[(speed + (5 * kilometer / hour)) * 2]Upto: 70 * kilometer / hour.
	! !


!classDefinition: #GasolineMotorcycle category: #'4.Replace-if-Strategy'!
Motorcycle subclass: #GasolineMotorcycle
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!GasolineMotorcycle methodsFor: 'initialization' stamp: 'MMP 4/10/2025 17:46:46'!
initialize
	super initialize.
	where := OpenRoad  new.
	engineType  := GasolineEngine new.! !


!GasolineMotorcycle methodsFor: 'move' stamp: 'MMP 4/10/2025 18:10:16'!
accelerateWhenOn
	self increaseSpeedWithAcceleration:[10 * kilometer / hour]Upto: 130 * kilometer / hour.
	! !
