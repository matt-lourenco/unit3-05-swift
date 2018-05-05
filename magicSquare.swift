//
//  magicSquare.swift
//  This program finds all possible magic squares that add up to 15
//
// This source was used as a guide to approach the problem:
// https://www.geeksforgeeks.org/write-a-c-program-to-print-all-
//			permutations-of-a-given-string/
//
//  Created by Matthew Lourenco on 05/05/18.
//  Copyright © 2018 MTHS. All rights reserved.
//

public class MagicSquare {
	
	func isMagic(square: [Int]) -> Bool {
		//Check if the inputted suqare is magic and adds up to 15
		
		if square.count != 9 {
			return false
		}
		
		if square[0] + square[1] + square[2] != 15 {
			return false;
		} else if square[3] + square[4] + square[5] != 15 {
			return false
		} else if square[6] + square[7] + square[8] != 15 {
			return false
		} else if square[0] + square[3] + square[6] != 15 {
			return false
		} else if square[1] + square[4] + square[7] != 15 {
			return false
		} else if square[2] + square[5] + square[8] != 15 {
			return false
		} else if square[0] + square[4] + square[8] != 15 {
			return false
		} else if square[2] + square[4] + square[6] != 15 {
			return false
		} else {
			return true
		}
	}
	
	func printSquare(square: [Int]) {
		//Prints the square to the console
		
		if square.count == 9 {
			print("\(square[0]) \(square[1]) \(square[2])\n\(square[3]) \(square[4]) \(square[5])\n\(square[6]) \(square[7]) \(square[8])\n- - -")
		}
	}
	
	func swap(square: [Int], index1: Int, index2: Int) -> [Int] {
		//Swaps the numbers at the inputted indexes
		
		let tempValue: Int = square[index1]
		var copy = square
		copy[index1] = copy[index2]
		copy[index2] = tempValue
		
		return copy
	}
	
	func mutate(square: [Int], startIndex: Int, endIndex: Int) {
		//Mutates the square to all posibilities using recursion
		
		var copy = square

		if startIndex == endIndex && isMagic(square: copy) {
			printSquare(square: copy)
		} else {

			if startIndex <= endIndex {
				for index in startIndex...endIndex {
					
					copy = swap(square: copy, index1: startIndex, index2: index)
					mutate(square: copy, startIndex: startIndex + 1, endIndex: endIndex)
					copy = swap(square: copy, index1: startIndex, index2: index)
				}
			}
		}
	}
}

let mutator = MagicSquare()
var square =  [1, 2, 3, 4, 5, 6, 7, 8, 9]
mutator.mutate(square: square, startIndex: 0, endIndex: 8)