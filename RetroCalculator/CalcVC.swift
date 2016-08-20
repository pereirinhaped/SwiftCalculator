//
//  ViewController.swift
//  RetroCalculator
//
//  Created by Pedro Pereirinha on 17/08/16.
//  Copyright © 2016 EpicDory. All rights reserved.
//

import UIKit
import AVFoundation

class CalcVC: UIViewController {

	// MARK: IBOutlets
	//Counter
	@IBOutlet weak var counterLbl: UILabel!
	
	// Numpad:
	@IBOutlet weak var nineBtn: UIButton!
	@IBOutlet weak var eightBtn: UIButton!
	@IBOutlet weak var sevenBtn: UIButton!
	@IBOutlet weak var sixBtn: UIButton!
	@IBOutlet weak var fiveBtn: UIButton!
	@IBOutlet weak var fourBtn: UIButton!
	@IBOutlet weak var threeBtn: UIButton!
	@IBOutlet weak var twoBtn: UIButton!
	@IBOutlet weak var oneBtn: UIButton!
	@IBOutlet weak var zeroBtn: UIButton!
	
	// Operators:
	@IBOutlet weak var divideBtn: UIButton!
	@IBOutlet weak var multiplyBtn: UIButton!
	@IBOutlet weak var subBtn: UIButton!
	@IBOutlet weak var addBtn: UIButton!
	@IBOutlet weak var equalBtn: UIButton!
	
	// Initialize calculator instance
	var calc = Calculator()
	
	var btnSound: AVAudioPlayer!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		let beepSound = Bundle.main.path(forResource: "btn", ofType: "wav")
		let beepSoundUrl = URL(fileURLWithPath: beepSound!)
		
		do {
			try btnSound = AVAudioPlayer(contentsOf: beepSoundUrl)
			btnSound.prepareToPlay()
		} catch let err as NSError {
			print(err.description)
		}
	}
	
	// MARK: @IBActions
	@IBAction func onNumberPress(_ sender: UIButton) {
		playSound()
		updateCounterValue(sender: sender)
	}
	
	@IBAction func onOperationPress(_ sender: UIButton) {
		playSound()
		updateCalcValues(sender: sender)
	}
	@IBAction func onClearPressed(_ sender: AnyObject) {
		playSound()
		resetCalc()
	}
	
	// MARK: Functions
	
	func playSound() {
		if !btnSound.isPlaying {
			btnSound.play()
		}
	}
	
	func updateCounterValue(sender: UIButton) {
		calc.counterText = String(sender.tag)
		counterLbl.text = calc.counterText
	}
	
	func updateCurrentOperation(sender: UIButton) -> CalcOperations? {
		switch sender.tag {
		case 91:
			return .divide
		case 92:
			return .multiply
		case 93:
			return .subtract
		case 94:
			return .add
		case 99:
			return .equal
		default:
			return nil
		}
	}
	
	func updateCalcValues(sender: UIButton) {
		let nextOp = updateCurrentOperation(sender: sender)
		
		func performOp() {
			calc.inputValue = Double(calc.counterText)
			calc.currentValue = calc.returnOperation()
			counterLbl.text = String(calc.currentValue!)
			calc.resetCounterText()
		}
		
		if nextOp != .equal {
			if calc.currentValue == nil {
				calc.currentOp = nextOp
				calc.currentValue = Double(calc.counterText)
				counterLbl.text = "0"
				calc.resetCounterText()
			} else {
				if calc.counterText.characters.count != 0 {
					performOp()
					calc.currentOp = nextOp
				} else {
					calc.currentOp = nextOp
					calc.resetCounterText()
				}
			}
		} else {
			if calc.counterText.characters.count != 0 {
				performOp()
			}
		}
	}
	
	func resetCalc() {
		calc.resetCalc()
		counterLbl.text = "0"
	}
	
}

