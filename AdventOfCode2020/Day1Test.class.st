Class {
	#name : #Day1Test,
	#superclass : #TestCase,
	#instVars : [
		'expenseReport',
		'day1'
	],
	#category : #'AdventOfCode2020-Tests'
}

{ #category : #running }
Day1Test >> setUp [
	"Hooks that subclasses may override to define the fixture of test."
	super setUp.
	day1 := Day1 withExpenseReport: #(1721 979 366 299 675 1456).
]

{ #category : #tests }
Day1Test >> testFindAnswerIn [
	| expectedFirst expectedSecond |
	expectedFirst := 1721.
	expectedSecond := 299.
	day1 findAnswerIn: { 1721 -> 299 . 299 -> 1721 }.
	self
		assert: day1 first isNotNil;
		assert: day1 first equals: expectedFirst;
		assert: day1 second isNotNil;
		assert: day1 second equals: expectedSecond
]

{ #category : #tests }
Day1Test >> testFindSum2020 [
	day1 findSum2020.
	self assert: (day1 first) isNotNil;
	     assert: (day1 first) equals: 1721;
	     assert: (day1 second) isNotNil;
		  assert: (day1 second) equals: 299.
]

{ #category : #tests }
Day1Test >> testGetComplimentOf [
	| expected actual |
	expected := 1721.
	actual := day1 getComplimentOf: 299.
	self 
		assert: actual isNotNil;
		assert: actual equals: expected.
		
]

{ #category : #tests }
Day1Test >> testGetMatchingCompliment [
	| result pairs |
	pairs := { 1721 -> 299 . 979 -> 1041 . 366 -> 1654 . 299 -> 1721 . 675 -> 1345 . 1456 -> 564 }.
	result := day1 getMatchingCompliment: pairs.
	self assert: result equals: (1721 -> 299)
]

{ #category : #tests }
Day1Test >> testGetProductOfFirstAndSecond [
	| expectedValue actualValue |
	expectedValue := 514579.
	day1 first: 1721; second: 299.
	actualValue := day1 getProductOfFirstAndSecond.
	self assert: actualValue equals: expectedValue
]

{ #category : #tests }
Day1Test >> testGetSolution [
	| expectedValue actualValue |
	expectedValue := 514579.
	actualValue := day1 getSolution.
	self assert: actualValue isNotNil;
		  assert: actualValue equals: expectedValue.
]

{ #category : #tests }
Day1Test >> testTransformToComplimentPairs [
	| expected actual |
	expected := (1721 -> 299).
	actual := day1 transformToComplimentPairs: #(1721).
	self
		assert: actual isNotEmpty;
		assert: (actual at: 1) equals: expected
]
