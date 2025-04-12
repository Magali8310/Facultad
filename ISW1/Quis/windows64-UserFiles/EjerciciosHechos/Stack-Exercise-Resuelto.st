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

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStackTest class' category: #'Stack-Exercise'!
OOStackTest class
	instanceVariableNames: ''!

!OOStackTest class methodsFor: 'as yet unclassified' stamp: 'sp 4/11/2025 21:02:45'!
stackEmptyErrorDescription
	^'OOPISE!!!!!!!!!!'! !


!classDefinition: #SentenceFinderByPrefixTest category: #'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!


!classDefinition: #OOStack category: #'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'elements status'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'initialization' stamp: 'sp 4/12/2025 11:56:36'!
initialize
	status:= StackEmpty on: self.
	elements  := OrderedCollection new.! !


!OOStack methodsFor: 'assertions' stamp: 'sp 4/11/2025 20:52:23'!
isEmpty
	^elements isEmpty! !

!OOStack methodsFor: 'assertions' stamp: 'sp 4/11/2025 21:01:01'!
size
	^elements size.! !


!OOStack methodsFor: 'adding' stamp: 'sp 4/11/2025 21:27:00'!
push: anElement 
	status := StackNotEmpty on: self.
	elements addFirst: anElement.! !


!OOStack methodsFor: 'accessing' stamp: 'sp 4/12/2025 12:08:15'!
top
	|aaaa bbbb|
	aaaa := Dictionary with: true -> (StackEmpty on: self) with: false -> (StackNotEmpty on: self).
	bbbb := aaaa at: self isEmpty.
	^bbbb top.! !


!OOStack methodsFor: 'removing' stamp: 'sp 4/11/2025 21:35:16'!
pop
	
	self isEmpty  ifTrue: [self error: self class stackEmptyErrorDescription ].
	
	self size = 1 ifTrue: [status := StackEmpty on: self].
	
	^elements removeFirst! !


!OOStack methodsFor: 'as yet unclassified' stamp: 'sp 4/11/2025 21:19:41'!
topWhileEmpty
	self error: self class stackEmptyErrorDescription ! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'sp 4/11/2025 21:20:13'!
topWhileNotEmpty
	^elements at: 1.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: #'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'NR 9/14/2023 08:12:21'!
stackEmptyErrorDescription
	
	^ 'stack is empty!!!!!!'! !


!classDefinition: #SentenceFinderByPrefix category: #'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!


!classDefinition: #StackStatus category: #'Stack-Exercise'!
Object subclass: #StackStatus
	instanceVariableNames: 'stack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StackStatus methodsFor: 'as yet unclassified' stamp: 'sp 4/11/2025 21:18:17'!
initializeWithStack: aStack
	stack:= aStack.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'StackStatus class' category: #'Stack-Exercise'!
StackStatus class
	instanceVariableNames: ''!

!StackStatus class methodsFor: 'as yet unclassified' stamp: 'sp 4/11/2025 21:17:56'!
on: aStack
	^self new initializeWithStack: aStack.! !


!classDefinition: #StackEmpty category: #'Stack-Exercise'!
StackStatus subclass: #StackEmpty
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StackEmpty methodsFor: 'as yet unclassified' stamp: 'sp 4/11/2025 21:19:24'!
top
	stack topWhileEmpty.
	! !


!classDefinition: #StackNotEmpty category: #'Stack-Exercise'!
StackStatus subclass: #StackNotEmpty
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StackNotEmpty methodsFor: 'as yet unclassified' stamp: 'sp 4/11/2025 21:33:03'!
top
	^stack topWhileNotEmpty.
	
	! !
