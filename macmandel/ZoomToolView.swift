//
//  ZoomToolView.swift
//  macmandel
//
//  Created by Joseph Bell on 12/24/19.
//  Copyright © 2019 iAchieved.it LLC. All rights reserved.
//

import Cocoa

class ZoomToolView: NSView {
  
  var zoomRect   = NSMakeRect(0, 0, 0, 0) // Zoom rectangle
  var startPoint = NSMakePoint(0, 0)
  var stopPoint  = NSMakePoint(0, 0)
  var zoomPath:NSBezierPath?
  
  override func mouseDown(with event: NSEvent) {
    self.startPoint = self.convert(event.locationInWindow, from:nil)
  }
  
  override func mouseDragged(with event: NSEvent) {
    self.stopPoint  = self.convert(event.locationInWindow, from: nil)
    
    self.zoomRect = NSMakeRect(self.startPoint.x, self.startPoint.y,
                                (self.stopPoint.x - self.startPoint.x),
                                (self.stopPoint.y - self.startPoint.y))
    
    self.zoomPath = NSBezierPath()
    self.zoomPath?.appendRect(self.zoomRect)
    self.needsDisplay = true
  }

  override func draw(_ dirtyRect: NSRect) {
    super.draw(dirtyRect)
          
    NSColor.black.setStroke()
    self.zoomPath?.lineWidth = 2.0
    self.zoomPath?.stroke()
  }
    
}
