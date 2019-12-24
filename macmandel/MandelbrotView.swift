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
  
  var m:Mandelbrot?
  var c:MandelbrotColors = MandelbrotColors()
    
  func draw() {
    self.m = Mandelbrot(r:self.visibleRect)
    self.needsDisplay = true
  }
  
  func draw(x0Min:CGFloat,x0Max:CGFloat,y0Min:CGFloat,y0Max:CGFloat) {
    self.m = Mandelbrot(r:self.visibleRect, x0Min: x0Min, x0Max:x0Max, y0Min:y0Min, y0Max:y0Max)
    self.needsDisplay = true
  }
  
  override func draw(_ dirtyRect: NSRect) {
    super.draw(dirtyRect)

    log.debug("draw Mandelbrot")
          
    let context = NSGraphicsContext.current?.cgContext
    
    self.m?.iterate {
      (x, y, i) in
        let p = CGMutablePath()
        p.move(to: CGPoint(x:x,y:y))
        p.addLine(to: CGPoint(x:x+1,y:y+1))

        let color = c.colorForIteration(i: i)
        
        color.setStroke()
        context?.addPath(p)
        context?.drawPath(using: .fillStroke)
    }
    
    self.m = nil
    
  }
}
    
    

