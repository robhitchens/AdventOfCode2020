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
Day1Test >> testCheckComplimentForAtWith [
	| compliments |
	compliments := #(299 1041 1654 1721 1345 564).
	day1 checkComplimentFor: 1721 at: 1 with: compliments.
	self assert: (day1 first) isNotNil;
		  assert: (day1 first) equals: 1721;
		  assert: (day1 second) isNotNil;
		  assert: (day1 second) equals: 299
]

{ #category : #tests }
Day1Test >> testDay1Problem [
	| expectedValue actualValue |
	expectedValue := 514579.
	actualValue := day1 findSum2020; getProductOfFirstAndSecond.
	self assert: actualValue isNotNil;
		  assert: actualValue equals: expectedValue.
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
Day1Test >> testGetComplimentsForExpenseReport [
	| expectedCompliments actualCompliments |
	expectedCompliments := #(299 1041 1654 1721 1345 564).
	actualCompliments := day1 getComplimentsForExpenseReport.
	self 
		assert: actualCompliments isNotNil;
		assert: actualCompliments equals: expectedCompliments.
]

{ #category : #tests }
Day1Test >> testGetProductOfFirstAndSecond [
	| expectedValue actualValue |
	expectedValue := 514579.
	day1 first: 1721; second: 299.
	actualValue := day1 getProductOfFirstAndSecond.
	self assert: actualValue equals: expectedValue
]
