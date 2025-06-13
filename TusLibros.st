!classDefinition: #CartTest category: #TusLibros!
TestCase subclass: #CartTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:08'!
test01NewCartsAreCreatedEmpty

	self assert: self createCart isEmpty! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:45'!
test02CanNotAddItemsThatDoNotBelongToStore

	| cart |
	
	cart := self createCart.
	
	self 
		should: [ cart add: self itemNotSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:43'!
test03AfterAddingAnItemTheCartIsNotEmptyAnymore

	| cart |
	
	cart := self createCart.
	
	cart add: self itemSellByTheStore.
	self deny: cart isEmpty ! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:43'!
test04CanNotAddNonPositiveNumberOfItems

	| cart |
	
	cart := self createCart.
	
	self 
		should: [cart add: 0 of: self itemSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidQuantityErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:45'!
test05CanNotAddMoreThanOneItemNotSellByTheStore

	| cart |
	
	cart := self createCart.
	
	self 
		should: [cart add: 2 of: self itemNotSellByTheStore  ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:43'!
test06CartRemembersAddedItems

	| cart |
	
	cart := self createCart.
	
	cart add: self itemSellByTheStore.
	self assert: (cart includes: self itemSellByTheStore)! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:43'!
test07CartDoesNotHoldNotAddedItems

	| cart |
	
	cart := self createCart.
	
	self deny: (cart includes: self itemSellByTheStore)! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:45'!
test08CartRemembersTheNumberOfAddedItems

	| cart |
	
	cart := self createCart.
	
	cart add: 2 of: self itemSellByTheStore.
	self assert: (cart occurrencesOf: self itemSellByTheStore) = 2! !


!CartTest methodsFor: 'support' stamp: 'HernanWilkinson 6/17/2013 17:48'!
createCart
	
	^Cart acceptingItemsOf: self defaultCatalog! !

!CartTest methodsFor: 'support' stamp: 'HernanWilkinson 6/17/2013 17:43'!
defaultCatalog
	
	^ Array with: self itemSellByTheStore! !

!CartTest methodsFor: 'support' stamp: 'HernanWilkinson 6/17/2013 17:44'!
itemNotSellByTheStore
	
	^'invalidBook'! !

!CartTest methodsFor: 'support' stamp: 'HernanWilkinson 6/17/2013 17:43'!
itemSellByTheStore
	
	^ 'validBook'! !


!classDefinition: #CashierTest category: #TusLibros!
TestCase subclass: #CashierTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CashierTest methodsFor: 'create' stamp: 'MMP 6/13/2025 19:08:07'!
catalogWithPrices
	^Dictionary newFromPairs: {'12345' . 4000*peso . '23456' . 50000*peso . '34567' . 0*peso . '45678' . 1*peso}.! !

!CashierTest methodsFor: 'create' stamp: 'MMP 6/13/2025 19:01:06'!
createCashier! !

!CashierTest methodsFor: 'create' stamp: 'MMP 6/13/2025 19:23:33'!
invalidCardDate
	^{'12345679', GregorianMonthOfYear juneOf: 2024}.! !

!CashierTest methodsFor: 'create' stamp: 'MMP 6/13/2025 19:23:50'!
invalidCardNumber
	^{'12345', GregorianMonthOfYear juneOf: 2026}.! !

!CashierTest methodsFor: 'create' stamp: 'MMP 6/13/2025 19:28:37'!
validCard
	^{'12345678' . GregorianMonthOfYear juneOf: 2026}.! !


!CashierTest methodsFor: 'test' stamp: 'MMP 6/13/2025 19:33:08'!
test01CashierChecksoutCartWithOneElement
	|cart cashier |
	cart := Cart acceptingItemsOf: (self catalogWithPrices keys).
	cart add: (self catalogWithPrices keys at: 1).
	cashier := Cashier checkout: cart with: self validCard and: self catalogWithPrices .
	
	self assert: (cashier checkoutTotalIsEqual: (self catalogWithPrices values at: 1)).! !

!CashierTest methodsFor: 'test' stamp: 'MMP 6/13/2025 19:36:56'!
test02CashierChecksoutCartWithTwoOfTheSameElement
	|cart cashier |
	cart := Cart acceptingItemsOf: (self catalogWithPrices keys).
	cart add: 2 of: (self catalogWithPrices keys at: 1). 
	cashier := Cashier checkout: cart with: self validCard and: self catalogWithPrices .
	
	self assert: (cashier checkoutTotalIsEqual: 2*(self catalogWithPrices values at: 1)).
	self deny: (cashier checkoutTotalIsEqual: (self catalogWithPrices values at:1)).! !

!CashierTest methodsFor: 'test' stamp: 'MMP 6/13/2025 19:47:19'!
test03CashierChecksoutCartWithDifferentElements
	|cart cashier |
	cart := Cart acceptingItemsOf: (self catalogWithPrices keys).
	cart add:(self catalogWithPrices keys at: 1).
	cart add:(self catalogWithPrices keys at: 2).
	cart add:(self catalogWithPrices keys at: 3). 
	cashier := Cashier checkout: cart with: self validCard and: self catalogWithPrices .
	
	
	self assert: (cashier checkoutTotalIsEqual: ((self catalogWithPrices values at: 1)+(self catalogWithPrices values at: 2)+(self catalogWithPrices values at: 3))).! !


!classDefinition: #Cart category: #TusLibros!
Object subclass: #Cart
	instanceVariableNames: 'catalog items'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cart methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 17:45'!
invalidItemErrorMessage
	
	^'Item is not in catalog'! !

!Cart methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 17:45'!
invalidQuantityErrorMessage
	
	^'Invalid number of items'! !


!Cart methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 17:51'!
assertIsValidItem: anItem

	(catalog includes: anItem) ifFalse: [ self error: self invalidItemErrorMessage ]! !

!Cart methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 17:51'!
assertIsValidQuantity: aQuantity

	aQuantity strictlyPositive ifFalse: [ self error: self invalidQuantityErrorMessage ]! !


!Cart methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2013 17:48'!
initializeAcceptingItemsOf: aCatalog

	catalog := aCatalog.
	items := OrderedCollection new.! !


!Cart methodsFor: 'queries' stamp: 'HernanWilkinson 6/17/2013 17:45'!
occurrencesOf: anItem

	^items occurrencesOf: anItem  ! !


!Cart methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 17:44'!
includes: anItem

	^items includes: anItem ! !

!Cart methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 17:44'!
isEmpty
	
	^items isEmpty ! !


!Cart methodsFor: 'adding' stamp: 'HernanWilkinson 6/17/2013 17:44'!
add: anItem

	^ self add: 1 of: anItem ! !

!Cart methodsFor: 'adding' stamp: 'HernanWilkinson 6/17/2013 17:51'!
add: aQuantity of: anItem

	self assertIsValidQuantity: aQuantity.
	self assertIsValidItem: anItem.

	1 to: aQuantity do: [ :aNumber | items add: anItem ]! !


!Cart methodsFor: 'enumerating' stamp: 'MMP 6/13/2025 19:43:47'!
do: aCodeblock 
	items do: aCodeblock .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: #TusLibros!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'instance creation' stamp: 'HernanWilkinson 6/17/2013 17:48'!
acceptingItemsOf: aCatalog

	^self new initializeAcceptingItemsOf: aCatalog ! !


!classDefinition: #Cashier category: #TusLibros!
Object subclass: #Cashier
	instanceVariableNames: 'cart card priceCatalog'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cashier methodsFor: 'initialize' stamp: 'MMP 6/13/2025 19:32:40'!
initializeCheckout: aCart with: aCard and: aPriceCatalog 
	cart := aCart.
	card := aCard.
	priceCatalog := aPriceCatalog.! !


!Cashier methodsFor: 'assertions' stamp: 'MMP 6/13/2025 19:44:30'!
checkoutTotalIsEqual: aNumber
	^self calculateCheckout = aNumber .
	! !


!Cashier methodsFor: 'checkout' stamp: 'MMP 6/13/2025 19:42:23'!
calculateCheckout
	|acumulator|
	acumulator := 0.
	cart do: [:item | acumulator := acumulator + (priceCatalog at: item)].
	^acumulator ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cashier class' category: #TusLibros!
Cashier class
	instanceVariableNames: ''!

!Cashier class methodsFor: 'instance creation' stamp: 'MMP 6/13/2025 19:30:49'!
checkout: cart with: aCard and: aPriceCatalog
	^self new initializeCheckout: cart with: aCard and: aPriceCatalog .! !
