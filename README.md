# Spin Wheel Control v0.2.0

<img src="spinwheelcontrol-logo.jpg?raw=true">

## Synopsis
Main languages and technologies used: Swift, UI Kit, Core Animation, CocoaPods, Interface Builder, Xcode
<img src="https://github.com/amir-ardalanuk/SpinWheelControl/blob/master/Speen.gif?raw=true">
<img src="spinwheelcontrol-demo.gif?raw=true">

## Requirements

* iOS 10.0+
* Xcode 9.0+
* Swift 4.0+

## Installation 

clone project run workspace and then you can add the .framework on your project 

## Usage

Ensure the view controller containing the SpinWheelControl adheres to the SpinWheelControlDataSource and SpinWheelControlDelegate protocols:

```swift
class ViewController: UIViewController, SpinWheelControlDataSource, SpinWheelControlDelegate
```


Either instantiate the UIControl by dragging and dropping a SpinWheelControlView in Interface Builder and creating an IBOutlet, or instantiate the UI control with a frame via code like so:

```swift
let frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.width)

spinWheelControl = SpinWheelControl(frame: frame)
```


Add a target for the valueChanged event:

```swift
spinWheelControl.addTarget(self, action: #selector(spinWheelDidChangeValue), for: UIControlEvents.valueChanged)
```


Give the SpinWheelControl a data source:

```swift
spinWheelControl.dataSource = self

spinWheelControl.reloadData()
```


Set the SpinWheelControl's delegate:

```swift
spinWheelControl.delegate = self
```


Add the SpinWheelControl to your view:

```swift
self.view.addSubview(spinWheelControl)
```

Spin the wheel with a given velocity multiplier between 0 and 1 (defaults to 0.75)
```Swift
spinWheelControl.spin(velocityMultiplier: CGFloat)
```

Randomly spin the wheel:

```Swift
spinWheelControl.randomSpin()
```


### Data Source Methods

The following data source methods are available:

```swift
//Specify the number of wedges in the spin wheel by returning a positive value that is greater than 1

func numberOfWedgesInSpinWheel(spinWheel: SpinWheelControl) -> UInt


//Returns the SpinWheelWedge at the specified index of the SpinWheelControl

func wedgeForSliceAtIndex(index: UInt) -> SpinWheelWedge
```


### Delegate Methods


The following delegate methods are available:

```swift
//Triggered when the spin wheel control has come to rest after spinning.

func spinWheelDidEndDecelerating(spinWheel: SpinWheelControl)


//Triggered at various intervals. The variable radians describes how many radians the spin wheel control has moved since the last time this method was called.

func spinWheelDidRotateByRadians(radians: CGFloat)
```

### Properties


The following properties are available for modification:

```swift
borderWidth - The width of the border around the spin wheel
borderColor - The color of the border around the spin wheel
cornerRadius - Set with a CGFloat value to round the edges of the border around the spin wheel
snapOrientation - The direction in which the wheel "snaps" (SpinWheelDirection.up, SpinWheelDirection.right, SpinWheelDirection.down, or SpinWheelDirection.left)
wedgeLabelOrientation - The orientation of labels in each wedge (WedgeLabelOrientation.inOut or WedgeLabelOrientation.around)
```


## Example App

To see SpinWheelControl in action, open the example project in the SpinWheelExample folder.


## Author

Josh Henry(Edited By : Amir Ardalan)


## License
MIT
