!classDefinition: #OOStackTest category: #'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:29:55'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:01'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:09'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'NR 9/16/2021 17:40:17'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'firstSomething'.
	secondPushedObject := 'secondSomething'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:20'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:24'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:26'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:31'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: #'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!


!classDefinition: #OOStack category: #'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'elements'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'assertions' stamp: 'MMP 4/16/2025 13:50:12'!
isEmpty
	^elements isEmpty.! !

!OOStack methodsFor: 'assertions' stamp: 'MMP 4/16/2025 14:40:03'!
isFull
	^false.! !


!OOStack methodsFor: 'initialization' stamp: 'MMP 4/16/2025 13:50:02'!
initialize
	elements := OrderedCollection new.! !


!OOStack methodsFor: 'adding' stamp: 'MMP 4/16/2025 13:50:23'!
push: anElement
	elements addFirst: anElement.! !


!OOStack methodsFor: 'removing' stamp: 'MMP 4/16/2025 14:08:00'!
pop
	|firstElement|
	firstElement := self top.
	
	elements removeFirst.
	
	^firstElement.
! !


!OOStack methodsFor: 'accessing' stamp: 'MMP 4/16/2025 13:56:26'!
size
	^elements size! !

!OOStack methodsFor: 'accessing' stamp: 'MMP 4/16/2025 15:27:29'!
top
	^((OOStackStatus on: self) resolvedorDeTop )		 first .! !

!OOStack methodsFor: 'accessing' stamp: 'MMP 4/16/2025 15:15:35'!
topWhenEmpty
	^self error: self class stackEmptyErrorDescription.! !

!OOStack methodsFor: 'accessing' stamp: 'MMP 4/16/2025 15:25:02'!
topWhenNotEmpty
	^elements first.! !


"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: #'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'NR 9/14/2023 08:12:21'!
stackEmptyErrorDescription
	
	^ 'stack is empty!!!!!!'! !


!classDefinition: #OOStackStatus category: #'Stack-Exercise'!
Object subclass: #OOStackStatus
	instanceVariableNames: 'stackToMonitor'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackStatus methodsFor: 'initialization' stamp: 'MMP 4/16/2025 15:00:06'!
initializeWith:aStack.
	stackToMonitor := aStack .
	! !


!OOStackStatus methodsFor: 'calculoDinamico' stamp: 'MMP 4/16/2025 15:14:44'!
bbbb
	^OOStackStatus subclasses select:[ :each | (each on: stackToMonitor) cccc ]thenCollect:[:each | (each on: stackToMonitor) dddd]

	! !

!OOStackStatus methodsFor: 'calculoDinamico' stamp: 'MMP 4/16/2025 15:21:19'!
calculadoraDeEstados
	^OOStackStatus subclasses select:[ :each | (each on: stackToMonitor) soyYoElEstadoActual ]thenCollect:[:each | (each on: stackToMonitor) envioMensajeAlTopCorrespondiente]

	! !

!OOStackStatus methodsFor: 'calculoDinamico' stamp: 'MMP 4/16/2025 15:23:13'!
resolvedorDeTop
	^OOStackStatus subclasses select:[ :each | (each on: stackToMonitor) soyYoElEstadoActual ]thenCollect:[:each | (each on: stackToMonitor) envioMensajeAlTopCorrespondiente]

	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStackStatus class' category: #'Stack-Exercise'!
OOStackStatus class
	instanceVariableNames: 'stackToMonitor'!

!OOStackStatus class methodsFor: 'instance creation' stamp: 'MMP 4/16/2025 15:07:07'!
on: aStack
	^self new initializeWith:aStack.
	! !



!classDefinition: #OOStackEmpty category: #'Stack-Exercise'!
OOStackStatus subclass: #OOStackEmpty
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackEmpty methodsFor: 'as yet unclassified' stamp: 'MMP 4/16/2025 15:03:15'!
cccc
	^stackToMonitor isEmpty .! !

!OOStackEmpty methodsFor: 'as yet unclassified' stamp: 'MMP 4/16/2025 15:16:29'!
dddd
	^stackToMonitor topWhenEmpty .! !

!OOStackEmpty methodsFor: 'as yet unclassified' stamp: 'MMP 4/16/2025 15:21:27'!
envioMensajeAlTopCorrespondiente
	^stackToMonitor topWhenEmpty .! !

!OOStackEmpty methodsFor: 'as yet unclassified' stamp: 'MMP 4/16/2025 15:19:44'!
soyYoElEstadoActual
	^stackToMonitor isEmpty .! !


!classDefinition: #OOStackFull category: #'Stack-Exercise'!
OOStackStatus subclass: #OOStackFull
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackFull methodsFor: 'as yet unclassified' stamp: 'MMP 4/16/2025 15:08:53'!
cccc
	^stackToMonitor isFull .! !

!OOStackFull methodsFor: 'as yet unclassified' stamp: 'MMP 4/16/2025 15:16:38'!
dddd
	^stackToMonitor topWhenNotEmpty .! !

!OOStackFull methodsFor: 'as yet unclassified' stamp: 'MMP 4/16/2025 15:21:34'!
envioMensajeAlTopCorrespondiente
	^stackToMonitor topWhenNotEmpty .! !

!OOStackFull methodsFor: 'as yet unclassified' stamp: 'MMP 4/16/2025 14:51:18'!
hdhsjhf! !

!OOStackFull methodsFor: 'as yet unclassified' stamp: 'MMP 4/16/2025 15:19:50'!
soyYoElEstadoActual
	^stackToMonitor isFull .! !


!classDefinition: #OOStackNotEmptyNotFull category: #'Stack-Exercise'!
OOStackStatus subclass: #OOStackNotEmptyNotFull
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackNotEmptyNotFull methodsFor: 'as yet unclassified' stamp: 'MMP 4/16/2025 15:13:17'!
cccc
	^ ((stackToMonitor isEmpty) or: stackToMonitor isFull) not.! !

!OOStackNotEmptyNotFull methodsFor: 'as yet unclassified' stamp: 'MMP 4/16/2025 15:16:48'!
dddd
	^stackToMonitor topWhenNotEmpty .! !

!OOStackNotEmptyNotFull methodsFor: 'as yet unclassified' stamp: 'MMP 4/16/2025 15:21:39'!
envioMensajeAlTopCorrespondiente
	^stackToMonitor topWhenNotEmpty .! !

!OOStackNotEmptyNotFull methodsFor: 'as yet unclassified' stamp: 'MMP 4/16/2025 15:19:56'!
soyYoElEstadoActual
	^ ((stackToMonitor isEmpty) or: stackToMonitor isFull) not.! !


!classDefinition: #SentenceFinderByPrefix category: #'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!
