//
//  Mandelbrot.swift
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

import Foundation

class Mandelbrot {
  
  var rect:NSRect
  
  let x0Min:CGFloat = -2.5
  let x0Max:CGFloat = 1.0
  let y0Min:CGFloat = -1
  let y0Max:CGFloat = 1
  
  var xScale:CGFloat
  var yScale:CGFloat
  
  init(r:NSRect) {
    rect = r
    self.xScale = x0Max - (x0Min)
    self.yScale = y0Max - (y0Min)
  }
  
  func iterate(c:(_ x:CGFloat, _ y:CGFloat, _ i:Int) -> Void) {
    for x in 0...Int(self.rect.width) {
      for y in 0...Int(self.rect.height) {
        let i = self.m(x:CGFloat(x),y:CGFloat(y))
        c(CGFloat(x),CGFloat(y),i)
      }
    }
  }
  
  func m(x:CGFloat, y:CGFloat) -> Int {

    let maxIterations = 1000
    var iteration     = 0
    
    var _x:CGFloat = 0.0
    var _y:CGFloat = 0.0
     
    let x0 = (x/self.rect.width)*self.xScale + x0Min
    let y0 = (y/self.rect.height)*self.yScale + y0Min

    var _xSquared = _x*_x
    var _ySquared = _y*_y
    
    while (_xSquared + _ySquared <= 2*2) && (iteration < maxIterations) {
      let xTemp = _xSquared - _ySquared + x0
      _y   = (2 * _x * _y) + y0
      _x   = xTemp
      
      _xSquared = _x * _x
      _ySquared = _y * _y

      iteration += 1
    }
        
    return iteration
 
  }
  
}
