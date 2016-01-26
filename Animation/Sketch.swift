//
//  Sketch.swift
//  Animation
//
//

import Foundation

class Sketch : NSObject {
    
    // NOTE: Every sketch must contain an object of type Canvas named 'canvas'
    //       Therefore, the line immediately below must always be present.
    let canvas : Canvas
    
    // Declare any properties you need for your sketch below this comment, but before init()
    
    
    var x1 = Int (arc4random_uniform(60)) + 20
    var s1 = 5
    var x2 = Int (arc4random_uniform(60)) + 80
    var s2 = -5
    var x3 = Int (arc4random_uniform(60)) + 140
    var s3 = 5
    var stop = false
    var awnser = false
    var pressed = false
    var backgroundRed : Bool = false // Boolean to toggle whether background is red
   
    // This runs once, equivalent to setup() in Processing
    override init() {
        
        // Create canvas object – specify size
        canvas = Canvas(width: 220, height: 300)
        
        // The frame rate can be adjusted; the default is 60 fps
        canvas.framesPerSecond = 60
        
    }
    
    // Runs repeatedly, equivalent to draw() in Processing
    func draw() {
        //if less than 120 frames dont move
        if (canvas.frameCount < 120){
            
            
        } else if (canvas.frameCount > 120) && (canvas.frameCount < 1000)  {
            // Horizontal position of circle
            x1 = x1 + s1
            x2 = x2 + s2
            x3 = x3 + s3
            
            // Bounce when hitting wall
            if (x1 > canvas.width || x1 < 0) {
                s1 *= -1
            }
            
        } else { // 1000 or greater (frameCount)
            
        }
        
                if (x2 > canvas.width || x2 < 0) {
                    s2 *= -1
                }
        
                if (x3 > canvas.width || x3 < 0) {
                    s3 *= -1
                }
        
        
                // "Clear" the background
                canvas.drawShapesWithBorders = false
                canvas.fillColor = Color(hue: 0, saturation: 0, brightness: 0, alpha: 10)
                // Decide what color to make the background
                if (backgroundRed == true) {
                    canvas.fillColor = Color(hue: 0, saturation: 80, brightness: 90, alpha: 100)
                } else {
                    canvas.fillColor = Color(hue: 0, saturation: 0, brightness: 0, alpha: 10)
                }
                canvas.drawRectangle(bottomRightX: 0, bottomRightY: 0, width: canvas.width, height: canvas.height)
        
        
        if (pressed == true) {
        if (awnser == false) {
            canvas.drawText(message: "❌", size: 48, x: canvas.width - canvas.width / 4, y: canvas.height - canvas.height / 4)
            }
        
        if (awnser ==  true){
            canvas.drawText(message: "✅", size: 48, x: canvas.width - canvas.width / 4, y: canvas.height - canvas.height / 4)
            }
        }
        if (canvas.frameCount > 1500 && awnser == false){
            canvas.frameCount = 0
        }
        
        if (canvas.frameCount > 1500 && awnser == true){
            canvas.frameCount = 0
        }
        
        
        
      
        
                // Draw a circle that moves across the screen
                canvas.drawShapesWithBorders = false
                canvas.fillColor = Color(hue: 240, saturation: 80, brightness: 90, alpha: 100)
                canvas.drawEllipse(centreX: x1, centreY: canvas.height / 2, width: 24, height: 24)
        
                if (canvas.frameCount < 120){
                    canvas.drawShapesWithBorders = false
                    canvas.fillColor = Color(hue:0, saturation: 80, brightness: 90, alpha: 100)
                    canvas.drawEllipse(centreX: x2, centreY: canvas.height / 2, width: 24, height: 24)
                }
                if (canvas.frameCount > 120){
                    canvas.drawShapesWithBorders = false
                    canvas.fillColor = Color(hue:240, saturation: 80, brightness: 90, alpha: 100)
                    canvas.drawEllipse(centreX: x2, centreY: canvas.height / 2, width: 24, height: 24)
                }
                canvas.drawShapesWithBorders = false
                canvas.fillColor = Color(hue: 240, saturation: 80, brightness: 90, alpha: 100)
                canvas.drawEllipse(centreX: x3, centreY: canvas.height / 2, width: 24, height: 24)
        
                // Draw some text on the screen
                canvas.textColor = Color(hue: 0, saturation: 0, brightness: 100, alpha: 100) // white
                canvas.drawText(message: "  Find The Red Ball")
        
                // Draw some more text on the screen
                canvas.textColor = Color(hue: 60, saturation: 80, brightness: 90, alpha: 100) // yellow
                canvas.drawText(message: "Current frame: \(canvas.frameCount)", size: 12, x: canvas.width / 16, y: canvas.height - canvas.height / 8)
        
               
        
        
                // Draw a circle where the mouse pointer is
                canvas.drawShapesWithBorders = false
                canvas.drawShapesWithFill = true
                canvas.fillColor = Color(hue: 0, saturation: 0, brightness: 100, alpha: 100)
                canvas.drawEllipse(centreX: Int(canvas.mouseX), centreY: Int(canvas.mouseY), width: 5, height: 5)
        
        
    } // END of draw() func
    
    
    
    // Respond to the mouseDown event
    func mouseDown() {
        
        if (canvas.frameCount > 1000 && x2+15 > Int(canvas.mouseX) && Int(canvas.mouseX) > x2-15 && canvas.height/2 - 12 < Int(canvas.mouseY) && Int(canvas.mouseY) < canvas.height/2 + 12) {
            
            pressed = true
            
            awnser = true
            
        } else {
            awnser = false
            pressed = true
        }
       
        
        
        
    }
    
}

