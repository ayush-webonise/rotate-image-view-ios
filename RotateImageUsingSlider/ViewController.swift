//  ViewController.swift
//  RotateImageUsingSlider

import UIKit

class ViewController: UIViewController {

	@IBOutlet var labelSliderValue: UILabel!
	@IBOutlet var sliderDegreeSelector: UISlider!
	@IBOutlet var imageRotated: UIImageView!

	@IBOutlet var viewForTouchEVents: UIView!
	var deltaAngle: CGFloat = 0.0
	var startingAngle: CGFloat = 0.0

	//Mark: - ViewController LifeCycle Method
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		imageRotated.center = CGPointMake(160, 330)
	}

	//Mark: - Touches Began
	override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {

		let origin = (touches.first?.locationInView(self.view))!
		let xOffSet = CGVector(dx:(origin.x)-imageRotated.center.x, dy:(origin.y) - imageRotated.center.y)
		startingAngle = atan2(xOffSet.dy,xOffSet.dx)
	}

	//Mark: - Touches Moved
	override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {

		let matchImage = self.view?.hitTest((touches.first?.locationInView(self.view))!, withEvent: event)

		if matchImage === imageRotated {
			let touchPoint = touches.first?.locationInView(self.view)
			setAnchorPoint(CGPointMake(0.5, 1.0), view: imageRotated)

			let yOffSet = CGVector(dx:touchPoint!.x - imageRotated.center.x, dy:touchPoint!.y - imageRotated.center.y)
			let angle = atan2(yOffSet.dy,yOffSet.dx)

			deltaAngle = angle - startingAngle
			imageRotated.transform = CGAffineTransformMakeRotation(deltaAngle)
		}
	}

	//Mark: - Touches Ended
	override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
		startingAngle = 0.0
	}

	//Mark: - Function to set Anchor Point as point of rotation
	func setAnchorPoint(anchorPoint: CGPoint, view: UIView) {

		var newPoint = CGPointMake(view.bounds.size.width * anchorPoint.x, view.bounds.size.height * anchorPoint.y)
		var oldPoint = CGPointMake(view.bounds.size.width * view.layer.anchorPoint.x, view.bounds.size.height * view.layer.anchorPoint.y)
		newPoint = CGPointApplyAffineTransform(newPoint, view.transform)
		oldPoint = CGPointApplyAffineTransform(oldPoint, view.transform)
		var position : CGPoint = view.layer.position
		position.x -= oldPoint.x
		position.x += newPoint.x;
		position.y -= oldPoint.y;
		position.y += newPoint.y;
		view.layer.position = position;
		view.layer.anchorPoint = anchorPoint;
	}

	//Mark: - IBAction for Slider to rotate the image
	@IBAction func sliderValueChanged(sender: UISlider) {
		let currentValue: CGFloat = CGFloat(sender.value)
		labelSliderValue.text = String(currentValue)
		self.imageRotated.transform = CGAffineTransformMakeRotation(CGFloat(currentValue * CGFloat(M_PI / 180)));
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
}

