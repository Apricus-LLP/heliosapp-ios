//
//  CircularProgressView.swift
//  HeliosApp
//
//  Created by Pavel Mac on 14/10/24.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

import UIKit

class CircularProgressView: UIView {
    
    private var circularProgressLayers: [CAShapeLayer] = []
    private var backgroundLayer: CAShapeLayer!
    var segmentSpacing: CGFloat = 0.02
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupBackgroundLayer()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupBackgroundLayer()
    }
    
    private func setupBackgroundLayer() {
        let circularPath = UIBezierPath(arcCenter: CGPoint(x: bounds.midX, y: bounds.midY), radius: bounds.width / 2 - 5, startAngle: -.pi / 2, endAngle: 3 * .pi / 2, clockwise: true)
        
        backgroundLayer = CAShapeLayer()
        backgroundLayer.path = circularPath.cgPath
        backgroundLayer.strokeColor = UIColor.clear.cgColor
        backgroundLayer.lineWidth = 3
        backgroundLayer.fillColor = UIColor.clear.cgColor
        layer.addSublayer(backgroundLayer)
    }
    
    func setProgress(for segments: Int, totalSegments: Int) {
        if segments == totalSegments {
            segmentSpacing = 0
        } else {
            segmentSpacing = 0.3
        }
        
        circularProgressLayers.forEach { $0.removeFromSuperlayer() }
        circularProgressLayers.removeAll()
        
        let segmentAngle = (2 * .pi - segmentSpacing * CGFloat(totalSegments)) / CGFloat(totalSegments)
        
        for i in 0..<segments {
            let startAngle = -.pi / 2 + (segmentAngle + segmentSpacing) * CGFloat(i)
            let endAngle = startAngle + segmentAngle
            
            let circularPath = UIBezierPath(arcCenter: CGPoint(x: bounds.midX, y: bounds.midY), radius: bounds.width / 2 - 5, startAngle: startAngle, endAngle: endAngle, clockwise: true)
            
            let progressLayer = CAShapeLayer()
            progressLayer.path = circularPath.cgPath
            progressLayer.strokeColor = UIColor.orange.cgColor
            progressLayer.lineWidth = 3
            progressLayer.fillColor = UIColor.clear.cgColor
            progressLayer.lineCap = .round
            progressLayer.strokeEnd = 1
            
            layer.addSublayer(progressLayer)
            circularProgressLayers.append(progressLayer)
        }
    }
}
