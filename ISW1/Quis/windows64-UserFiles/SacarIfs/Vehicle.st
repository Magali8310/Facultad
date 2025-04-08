'From Cuis6.3 [latest update: #6350] on 7 April 2025 at 10:58:01 pm'!
!classDefinition: #Vehicle category: #'1.Replace-if-Type'!
Object subclass: #Vehicle
	instanceVariableNames: 'speed'
	classVariableNames: ''
	poolDictionaries: ''
	category: '1.Replace-if-Type'!

!Vehicle methodsFor: 'initialization' stamp: 'MMP 4/7/2025 22:57:11'!
initialize
	speed := 0 * kilometer / hour.! !


!Vehicle methodsFor: 'move' stamp: 'MMP 4/7/2025 22:57:33'!
accelerate

	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Vehicle class' category: #'1.Replace-if-Type'!
Vehicle class
	instanceVariableNames: ''!

!Vehicle class methodsFor: 'instance creation' stamp: 'ARM 4/29/2024 11:00:51'!
helicopter

	^self new initializeWithType: #Helicopter! !

!Vehicle class methodsFor: 'instance creation' stamp: 'ARM 4/29/2024 11:00:51'!
motorcycle

	^self new initializeWithType: #Motorcycle! !
