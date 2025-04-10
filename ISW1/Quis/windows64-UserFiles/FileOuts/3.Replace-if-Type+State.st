!classDefinition: #PowerState category: #'3.Replace-if-Type+State'!
Object subclass: #PowerState
	instanceVariableNames: 'vehicleToPower'
	classVariableNames: ''
	poolDictionaries: ''
	category: '3.Replace-if-Type+State'!

!PowerState methodsFor: 'move' stamp: 'MMP 4/9/2025 21:46:59'!
accelerate
	self subclassResponsibility .! !


!PowerState methodsFor: 'initialize' stamp: 'MMP 4/9/2025 21:49:50'!
initializePowerStatusOf: vehicle
	vehicleToPower := vehicle.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PowerState class' category: #'3.Replace-if-Type+State'!
PowerState class
	instanceVariableNames: ''!

!PowerState class methodsFor: 'instanceCreation' stamp: 'MMP 4/9/2025 21:53:26'!
on: vehicle
	^self new initializePowerStatusOf: vehicle.! !


!classDefinition: #StateOff category: #'3.Replace-if-Type+State'!
PowerState subclass: #StateOff
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '3.Replace-if-Type+State'!

!StateOff methodsFor: 'move' stamp: 'MMP 4/9/2025 21:54:40'!
accelerate
	^vehicleToPower canNotAccelerateErrorMessage.! !


!classDefinition: #StateOn category: #'3.Replace-if-Type+State'!
PowerState subclass: #StateOn
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '3.Replace-if-Type+State'!

!StateOn methodsFor: 'move' stamp: 'MMP 4/9/2025 22:02:33'!
accelerate
	^vehicleToPower accelerateWhenOn.! !


!classDefinition: #Vehicle category: #'3.Replace-if-Type+State'!
Object subclass: #Vehicle
	instanceVariableNames: 'powerStatus speed'
	classVariableNames: ''
	poolDictionaries: ''
	category: '3.Replace-if-Type+State'!
!Vehicle commentStamp: '<historical>' prior: 0!
Helicopter new turnOn accelerate turnOff accelerate!


!Vehicle methodsFor: 'initialization' stamp: 'MMP 4/9/2025 22:01:50'!
initialize

	self turnOff.
	
	speed := 0 * kilometer / hour.
	
! !


!Vehicle methodsFor: 'move' stamp: 'MMP 4/9/2025 22:01:34'!
accelerate
	powerStatus accelerate! !


!Vehicle methodsFor: 'on/off' stamp: 'MMP 4/9/2025 21:58:47'!
turnOff
	powerStatus := StateOff on: self.! !

!Vehicle methodsFor: 'on/off' stamp: 'MMP 4/9/2025 21:59:59'!
turnOn
	powerStatus := StateOn on: self.! !


!Vehicle methodsFor: 'errorMessages' stamp: 'MMP 4/9/2025 19:58:46'!
canNotAccelerateErrorMessage
	self subclassResponsibility! !


!classDefinition: #Helicopter category: #'3.Replace-if-Type+State'!
Vehicle subclass: #Helicopter
	instanceVariableNames: 'altitude'
	classVariableNames: ''
	poolDictionaries: ''
	category: '3.Replace-if-Type+State'!

!Helicopter methodsFor: 'error messages' stamp: 'MMP 4/9/2025 19:44:10'!
canNotAccelerateErrorMessage
	^'Can not fly when turned off'! !


!Helicopter methodsFor: 'move' stamp: 'MMP 4/9/2025 22:03:10'!
accelerateWhenOn
	speed := speed + (10 * kilometer / hour).
	altitude := altitude + (5 * meter)! !


!Helicopter methodsFor: 'initialization' stamp: 'MMP 4/9/2025 22:05:25'!
initialize
	super initialize.
	
	altitude := 0 * meter! !


!classDefinition: #Motorcycle category: #'3.Replace-if-Type+State'!
Vehicle subclass: #Motorcycle
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '3.Replace-if-Type+State'!

!Motorcycle methodsFor: 'error messages' stamp: 'MMP 4/9/2025 19:45:12'!
canNotAccelerateErrorMessage
	^'Can not run when turned off'! !


!Motorcycle methodsFor: 'move' stamp: 'MMP 4/9/2025 22:04:39'!
accelerateWhenOn
	speed := speed + (20 * kilometer / hour)! !
