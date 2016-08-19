//
//  ViewController.swift
//  RetroCalculator
//
//  Created by Pedro Pereirinha on 17/08/16.
//  Copyright © 2016 EpicDory. All rights reserved.
//

import UIKit

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
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		
	}

}

