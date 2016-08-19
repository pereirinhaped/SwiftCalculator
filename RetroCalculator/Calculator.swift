//
//  Calculator.swift
//  RetroCalculator
//
//  Created by Pedro Pereirinha on 19/08/16.
//  Copyright © 2016 EpicDory. All rights reserved.
//

import Foundation

public enum CalcOperations {
	case divide
	case multiply
	case subtract
	case add
	case equal
}

public class Calculator {
	
	// MARK: Properties and variables
	private var _currentValue: Double? = nil
	private var _currentOp: CalcOperations? = nil
	private var _inputValue: Double? = nil
	private var _counterText = ""
	
	public var currentValue: Double? {
		get {
			if let curValue = _currentValue {
				return curValue
			}
			return nil
		}
		set {
			if _currentValue == nil {
				_currentValue = newValue
			}
		}
	}
	
	public var currentOp: CalcOperations? {
		get {
			if let op = _currentOp {
				return op
			}
			return nil
		}
		set {
			_currentOp = newValue
		}
	}
	
	public var inputValue: Double? {
		get {
			if let inValue = _inputValue {
				return inValue
			}
			return nil
		}
		set {
			_inputValue = newValue
		}
	}
	
	
	// MARK: Operations
	
	// Divide
	public func returnOperation() -> Double? {
		if let curValue = _currentValue {
			if let input = _inputValue {
				if let operation = _currentOp {
					switch operation {
					case .divide: return curValue / input
					case .multiply: return curValue * input
					case .subtract: return curValue - input
					case .add: return curValue + input
					case .equal: return curValue
					}
				}
			}
		}
		return nil
	}
}
