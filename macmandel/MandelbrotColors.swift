//
//  MandelbrotColors.swift
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
import Cocoa
import SwiftHEXColors

class MandelbrotColors {
   
  var schemes:[[NSColor]]
   
  init() {
   
    //we'll get back to this
    /*
    let hexCodes = ["#0048BA", "#B0BF1A", "#7CB9E8", "#C9FFE5",
     "#B284BE", "#72A0C1", "#EDEAE0", "#F0F8FF",
     "#C46210", "#EFDECD", "#E52B50", "#9F2B68",
     "#F19CBB", "#AB274F", "#D3212D", "#3B7A57"]
     
 
     
    for i in 0...hexCodes.count - 1 {
      self.scheme.append(NSColor(hexString:hexCodes[i])!)
    }
   */
     
    //let hex = ["#421E0F"]
     
    self.schemes = [[NSColor]]()
     
    self.schemes.append(
      [NSColor(calibratedRed:66/255.0, green: 30.0/255.0, blue: 15.0/255.0, alpha: 1.0),
       NSColor(calibratedRed:25/255.0, green: 7.0/255.0, blue: 26.0/255.0, alpha: 1.0),
       NSColor(calibratedRed:9/255.0,  green: 1.0/255.0, blue:47.0/255.0, alpha: 1.0),
       NSColor(calibratedRed:4/255.0,   green:4, blue:73,alpha:1.0),
       NSColor(calibratedRed:0/255.0,   green:7, blue:100, alpha:1.0),
       NSColor(calibratedRed:12/255.0,  green:44/255.0, blue:138/255.0, alpha:1.0),
       NSColor(calibratedRed:24/255.0,  green:82/255.0, blue:177/255.0, alpha:1.0),
       NSColor(calibratedRed:57/255.0,  green:125/255.0, blue:209/255.0, alpha:1.0),
       NSColor(calibratedRed:134/255.0,   green:181/255.0, blue:229/255.0, alpha:1.0),
       NSColor(calibratedRed:211/255.0,   green:236/255.0, blue:248/255.0, alpha:1.0),
       NSColor(calibratedRed:241/255.0,  green:233/255.0, blue:191/255.0, alpha:1.0),
       NSColor(calibratedRed:248/255.0,  green:201/255.0, blue:95/255.0, alpha:1.0),
       NSColor(calibratedRed:255/255.0,  green:170/255.0,blue: 0/255.0, alpha:1.0),
       NSColor(calibratedRed:204/255.0,  green:128/255.0, blue:0/255.0, alpha:1.0),
       NSColor(calibratedRed:153/255.0,  green:87/255.0, blue:0/255.0, alpha:1.0),
       NSColor(calibratedRed:106/255.0,  green:52/255.0, blue:3/255.0, alpha:1.0)])
  
  }
 
  func colorForIteration(i:Int) -> NSColor {
    let scheme = self.schemes[0]
    return scheme[i % scheme.count];
  }
}
