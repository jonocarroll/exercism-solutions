Class {
	#name : #RomanNumerals,
	#superclass : #Object,
	#category : #'Exercise@RomanNumerals'
}

{ #category : #class }
RomanNumerals >> romanNumber: anInteger [
	|n|
	n := anInteger .
	n >= 1000 ifTrue: [ ^ 'M', (self romanNumber: n - 1000) ] .
	n >= 900 ifTrue: [ ^ 'CM', (self romanNumber: n - 900) ] .
	n >= 500 ifTrue: [ ^ 'D', (self romanNumber: n - 500) ] .
	n >= 400 ifTrue: [ ^ 'CD', (self romanNumber: n - 400) ] .
	n >= 100 ifTrue: [ ^ 'C', (self romanNumber: n - 100) ] .
	n >= 90 ifTrue: [ ^ 'XC', (self romanNumber: n - 90) ] .
	n >= 50 ifTrue: [ ^ 'L', (self romanNumber: n - 50) ] .
	n >= 40 ifTrue: [ ^ 'XL', (self romanNumber: n - 40) ] .
	n >= 10 ifTrue: [ ^ 'X', (self romanNumber: n - 10) ] .
	n >= 9 ifTrue: [ ^ 'IX', (self romanNumber: n - 9) ] .
	n >= 5 ifTrue: [ ^ 'V', (self romanNumber: n - 5) ] .
	n >= 4 ifTrue: [ ^ 'IV', (self romanNumber: n - 4) ] .
	n >= 1 ifTrue: [  ^ 'I', (self romanNumber: n - 1) ] .
	^ ''
]
