# Flutter - Interactive Canvas
[![pub package](https://img.shields.io/pub/v/interactive-canvas.svg)](https://pub.dartlang.org/packages/interactive-canvas)

Turns any child into an interactive canvas. Interactive Canvas supports zoom, pan and rotation and you can optionally control the canvas with a controller. Using controller you can get/set the scale, offset, and rotation values. Interactive Canvas also provides callbacks on the start, update, and end Zoom events. Originally forked from the Zoomer package.

## Preview:
<img src="https://raw.githubusercontent.com/CEOSiyris/interactive-canvas/main/video_example/96.gif" alt="" width="200" height="200">

## Canvas functions:
* Zoom
* Rotate
* Translate (Pan)

## Installation:
Follow installation guide of Pub.dev

## Syntax:

1. ICanvas Class

        ICanvas(
            {this.child,                    // Child can be any Widget you want to be a canvas
            this.controller,                // Use an ICanvasControoller to control the ICanvas
            this.height,                    // Height
            this.width,                     // Width 
            this.background,                // Set the canvas background color
            this.maxScale = 2.0,            // maximum scale
            this.minScale = 0.5,            // mininum scale
            this.enableTranslation = false, // Allow canvas to be panned
            this.enableRotation = false,    // Allow canvas to be rotated
            this.clipRotation = true});     // Clips the rotation to 90-degrees

2. ICanvasController Class

          ICanvasController({initialScale = 1.0})  // Set initial Scale
          
    * APIs
    
      - double get scale              
      ```scale = _controller.scale```
      
      - set setScale(double value)    
       ```_controller.setScale = 1.5```
       
      - Offset get offset             
      ```offset = _controller.offset```
      
      - set setOffset(Offset value)   
       ```_controller.setOffset = Offset(0,10)```
       
      - double get rotation           
      ```rotation = _controller.rotation```
      
      - set setRotation(double value)               
      ```_controller.setRotation = pi/4```
      **Note: Rotation is in radians**    
      
      - onZoomStart()             
      ```_controller.onZoomStart( (){ print( _controller.scale ); } )```

      - onZoomUpdate()             
      ```_controller.onZoomUpdate( (){ print( _controller.scale ); } )```

      - onZoomEnd()             
      ```_controller.onZoomEnd( (){ print( _controller.scale ); } )```

## Example:

```class _HomeState extends State<Home> {
  ICanvasController _iCanvasController = ICanvasController(initialScale: 1.0);
  String _zoomDetails = "Zoom";  

  @override
  Widget build(BuildContext context) {

    _iCanvasController.onZoomUpdate((){
      setState(() {
        _zoomDetails = "Scale = "+ _iCanvasController.scale.toStringAsFixed(2);
        _zoomDetails += "\nRotation = "+ _iCanvasController.rotation.toStringAsFixed(2);
        _zoomDetails += "\nOffset = ("+ _iCanvasController.offset.dx.toStringAsFixed(2)+","+_iCanvasController.offset.dy.toStringAsFixed(2)+")";
      });
    });

    return Scaffold(
      appBar: AppBar(title: Text("Zommer Example"),),
      body:
        Center(child:
        Stack(
          children: [
            Align(alignment: Alignment.topCenter,child: SizedBox(height: 150,child: Text(_zoomDetails,textAlign: TextAlign.center,style: TextStyle(fontSize: 30),))),
            Center(
              child: 
                ICanvas(
                  enableTranslation: true,
                  enableRotation: true,
                  clipRotation: true,
                  maxScale: 2,
                  minScale: 0.5,
                  background:BoxDecoration(color: Colors.white),
                  height: 300,
                  width: 300,
                  controller: _iCanvasController,
                  child: Container(decoration: BoxDecoration(color: Colors.green),height: 200,width: 200,child: FlutterLogo(),)),
            ),
          ])),
    );
  }
}
```
