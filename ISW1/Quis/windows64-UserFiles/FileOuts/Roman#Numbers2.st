!classDefinition: #III category: #'Roman Numbers'!
II subclass: #III
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Roman Numbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'III class' category: #'Roman Numbers'!
III class
	instanceVariableNames: ''!

!III class methodsFor: '--** private fileout/in **--' stamp: 'MMP 3/27/2025 23:02:02'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := II.
	next := IV.! !


!classDefinition: #IV category: #'Roman Numbers'!
II subclass: #IV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Roman Numbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IV class' category: #'Roman Numbers'!
IV class
	instanceVariableNames: ''!

!IV class methodsFor: '--** private fileout/in **--' stamp: 'MMP 3/27/2025 23:02:02'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := III.
	next := nil.! !


!classDefinition: #RomanNumberTest category: #'Roman Numbers'!
DenotativeObject subclass: #RomanNumberTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Roman Numbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'RomanNumberTest class' category: #'Roman Numbers'!
RomanNumberTest class
	instanceVariableNames: ''!

!RomanNumberTest class methodsFor: 'tests' stamp: 'ARM 4/3/2024 19:04:33'!
test01OnePlusAnAdderIsTheNextOfTheAdder

	Assert that: I + II isEqualTo: II next.! !

!RomanNumberTest class methodsFor: 'tests' stamp: 'ARM 4/3/2024 19:04:51'!
test02NumbersBiggerThanOneCanBeAdded

	Assert that: II + II isEqualTo: IV.
! !

!RomanNumberTest class methodsFor: 'tests' stamp: 'ARM 4/3/2024 19:05:25'!
test03AMinuendMinusOneIsThePreviousOfTheMinuend

	Assert that: II - I isEqualTo: II previous.! !

!RomanNumberTest class methodsFor: 'tests' stamp: 'ARM 4/3/2024 19:05:42'!
test04NumbersBiggerThanOneCanBeSubstracted

	Assert that: IV - II isEqualTo: II.! !

!RomanNumberTest class methodsFor: 'tests' stamp: 'ARM 4/3/2024 19:06:07'!
test05SubstractionDoesNotSupportNegativeNumbers

	Assert should: [ I - II ] signal: Error withDescription: I negativeNumbersNotSupportedErrorDescription.
! !

!RomanNumberTest class methodsFor: 'tests' stamp: 'ARM 4/3/2024 19:06:43'!
test06MultipingByOneReturnsTheSameNumber

	Assert that: II * I isEqualTo: II.! !

!RomanNumberTest class methodsFor: 'tests' stamp: 'ARM 4/3/2024 19:07:05'!
test07NumbersBiggerThanOneCanBeMultiplied

	Assert that: II * II isEqualTo: IV.! !

!RomanNumberTest class methodsFor: 'tests' stamp: 'ARM 4/3/2024 19:07:26'!
test08OneMultipliedByItselfReturnsOne

	Assert that: I * I isEqualTo: I.! !

!RomanNumberTest class methodsFor: 'tests' stamp: 'ARM 4/3/2024 19:07:55'!
test09NumbersBiggerThanOneCanBeDivided

	Assert that: IV / II isEqualTo: II.! !

!RomanNumberTest class methodsFor: 'tests' stamp: 'ARM 4/3/2024 19:08:37'!
test10ADivisionByOneReturnsTheDividend

	Assert that: II / I isEqualTo: II.! !

!RomanNumberTest class methodsFor: 'tests' stamp: 'ARM 4/3/2024 19:08:56'!
test11OneDividedByItselfReturnsOne

	Assert that: I / I isEqualTo: I.! !

!RomanNumberTest class methodsFor: 'tests' stamp: 'ARM 4/3/2024 19:09:45'!
test12CanNotDivideADividendByABiggerDivisor

	Assert should: [ III /  IV ] signal: Error withDescription: II canNotDivideByABiggerNumberErrorDescription.

	Assert should: [ I /  II] signal: Error withDescription: II canNotDivideByABiggerNumberErrorDescription
! !

III initializeAfterFileIn!
IV initializeAfterFileIn!