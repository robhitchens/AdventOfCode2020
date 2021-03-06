"
This is a class for my attempt at the first advent of code 2020 problem.

TODO: improvements could iterate over and create compliment pairs then next stage of pipeline would perform check?
could create compliment pair collections, sort each collection and reduce to the duplicate.

snippet from advent of code 2020: 

--- Day 1: Report Repair ---

After saving Christmas five years in a row, you've decided to take a vacation at a nice resort on a tropical island. Surely, Christmas will go on without you.

The tropical island has its own currency and is entirely cash-only. The gold coins used there have a little picture of a starfish; the locals just call them stars. None of the currency exchanges seem to have heard of them, but somehow, you'll need to find fifty of these coins by the time you arrive so you can pay the deposit on your room.

To save your vacation, you need to get all fifty stars by December 25th.

Collect stars by solving puzzles. Two puzzles will be made available on each day in the Advent calendar; the second puzzle is unlocked when you complete the first. Each puzzle grants one star. Good luck!

Before you leave, the Elves in accounting just need you to fix your expense report (your puzzle input); apparently, something isn't quite adding up.

Specifically, they need you to find the two entries that sum to 2020 and then multiply those two numbers together.

For example, suppose your expense report contained the following:

1721
979
366
299
675
1456

In this list, the two entries that sum to 2020 are 1721 and 299. Multiplying them together produces 1721 * 299 = 514579, so the correct answer is 514579.

Of course, your expense report is much larger. Find the two entries that sum to 2020; what do you get if you multiply them together?

"
Class {
	#name : #Day1,
	#superclass : #Object,
	#instVars : [
		'expenseReport',
		'first',
		'second'
	],
	#classInstVars : [
		'expectedTotal'
	],
	#category : #'AdventOfCode2020-Src'
}

{ #category : #accessing }
Day1 class >> expectedTotal [
	^ 2020
]

{ #category : #'as yet unclassified' }
Day1 class >> withExpenseReport: expenseReport [
	^ self new expenseReport: expenseReport 
]

{ #category : #accessing }
Day1 >> expenseReport [
	^ expenseReport
]

{ #category : #accessing }
Day1 >> expenseReport: anObject [
	expenseReport := anObject
]

{ #category : #'as yet unclassified' }
Day1 >> findAnswerIn: aCollectionOfPair [ 
	"Returns self with first and second answers populated. Returns Nil if an answer is not found."
	(self getMatchingCompliment: aCollectionOfPair)
	ifNotNil: [ :element |
		^self first: (element key); second: (element value) ]
	ifNil: [ ^nil ]
]

{ #category : #accessing }
Day1 >> findSum2020 [
	| compliments |
	compliments := self transformToComplimentPairs: expenseReport.
	^self findAnswerIn: compliments.
]

{ #category : #accessing }
Day1 >> first [
	^ first
]

{ #category : #accessing }
Day1 >> first: anObject [
	first := anObject
]

{ #category : #'as yet unclassified' }
Day1 >> getComplimentOf: aNumber [
	^ (self class expectedTotal) - aNumber
]

{ #category : #'as yet unclassified' }
Day1 >> getMatchingCompliment: aCollectionOfAssociations [
	aCollectionOfAssociations detect: [ :pair |
		((aCollectionOfAssociations indexOf: (pair value -> pair key)) ~= 0) ] 
	ifFound: [ :found | ^ found ]
	ifNone: [ ^ nil ]
]

{ #category : #'as yet unclassified' }
Day1 >> getProductOfFirstAndSecond [
	^ (self first * self second)
]

{ #category : #'as yet unclassified' }
Day1 >> getSolution [
	^ self findSum2020; getProductOfFirstAndSecond
]

{ #category : #accessing }
Day1 >> second [
	^ second
]

{ #category : #accessing }
Day1 >> second: anObject [
	second := anObject
]

{ #category : #'as yet unclassified' }
Day1 >> transformToComplimentPairs: aCollection [
	^ aCollection collect: [ :element | element -> (self getComplimentOf: element) ]
]
