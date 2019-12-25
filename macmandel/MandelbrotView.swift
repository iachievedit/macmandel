//
//  MandelbrotView.swift
//  macmandel
//
//  Copyright © 2019 iAchieved.it LLC
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//

import Cocoa

@IBDesignable
class MandelbrotView: NSView {
  
  var mandelbrot:Mandelbrot?
    
  func draw() {
    self.mandelbrot = Mandelbrot(r:self.visibleRect)
    self.needsDisplay = true
  }
  
  func zoom(upperLeft:NSPoint, lowerRight:NSPoint, mandelbrot:Mandelbrot) {
    self.mandelbrot = mandelbrot
    self.mandelbrot?.zoom(
      upperLeft:upperLeft,
      lowerRight:lowerRight
    )
    self.needsDisplay = true
  }
  
  override func draw(_ dirtyRect: NSRect) {
    super.draw(dirtyRect)
        
    log.debug("Calculate and draw Mandelbrot")
    
    let context = NSGraphicsContext.current?.cgContext
    
    if let m = self.mandelbrot {
      m.iterate {
         (x, y, i) in
           let p = CGMutablePath()
           p.move(to: CGPoint(x:x,y:y))
           p.addLine(to: CGPoint(x:x+1,y:y+1))
    
    /*        let color = NSColor.init(calibratedRed: CGFloat(Float(i)/32.0),
                                  green: CGFloat(Float(i)/64.0),
                                  blue: CGFloat(Float(i)/128.0), alpha: 1.0)
 */
        
        let colorSchemes = MandelbrotColors()
        let color = colorSchemes.colorForIteration(i: i)
        
            
           color.setStroke()
           context?.addPath(p)
           context?.drawPath(using: .fillStroke)
      }
    }
    
  }
  
  override func viewWillStartLiveResize() {
    log.debug("Start")
  }
  override func viewDidEndLiveResize() {
    log.debug("Stop")
  }
  
  /*
  func mandelbrotImage() -> Void {
    log.debug("Cache image")
    
    let size = self.bounds.size
    let imageSize = NSMakeSize(size.width, size.height)
    
    if let bir = self.bitmapImageRepForCachingDisplay(in: self.bounds) {
      bir.size = imageSize
      cacheDisplay(in: self.bounds, to: bir)
    }
  }
 */
  
  /*
  - (NSImage *)imageRepresentation
   {
     NSSize mySize = self.bounds.size;
     NSSize imgSize = NSMakeSize( mySize.width, mySize.height );
     
     NSBitmapImageRep *bir = [self bitmapImageRepForCachingDisplayInRect:[self bounds]];
     [bir setSize:imgSize];
     [self cacheDisplayInRect:[self bounds] toBitmapImageRep:bir];
     
     NSImage* image = [[NSImage alloc]initWithSize:imgSize] ;
     [image addRepresentation:bir];
     return image;
   }
 */
    
}
