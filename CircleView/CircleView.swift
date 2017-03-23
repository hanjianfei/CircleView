//
//  CirCleUtil.swift
//  JianBook_Swift
//
//  Created by hjf on 2017/3/21.
//  Copyright © 2017年 hjf. All rights reserved.
//

import UIKit
//internal struct Interval{
//    var min:CGFloat=0
//    var max:CGFloat=1
//    init(min:CGFloat,max:CGFloat) {
//        assert(min<=max,NSLocalizedString("Illegal interval", comment: ""))
//        self.min=min
//        self.max=max
//    }
//}
//struct Circle {
//    var center=CGPoint.zero
//    var radius:CGFloat=0.0;
//    init(center:CGPoint, radius:CGFloat) {
//        self.center=center;
//        self.radius=radius;
//    }
//}

//存放开始值，结束值，和填充的颜色
internal struct InterVal{
    var beginValue: CGFloat = 0
    var endValue:   CGFloat = 0
    var trackColor: UIColor = UIColor.clear
    init(beginValue:CGFloat, endValue:CGFloat, trackColor:UIColor) {
        self.beginValue = beginValue
        self.endValue = endValue
        self.trackColor = trackColor
    }
}

class CircleView: UIView {

    
    
    @IBInspectable
    internal var radius: CGFloat=10

    
    //用户数据的最小值
    @IBInspectable
    var minimumValue: CGFloat = 0.0
    
    //用户数据的最大值
    @IBInspectable
    var maximumValue: CGFloat = 1.0
    
    //描边颜色
    @IBInspectable
    var trackColor: UIColor = UIColor.clear
    
    //描边半径
    @IBInspectable
    var trackWidth:  CGFloat = 0.0
    
    //填充颜色
    @IBInspectable
    var fillColor: UIColor = UIColor.white
    
    //保存上下文
    private var  context :CGContext!

    //存放InterVal
    internal var valus:NSMutableArray = NSMutableArray()
   
    
    @nonobjc static let circleMinValue: CGFloat = 0
    @nonobjc static let circleMaxValue: CGFloat = CGFloat(2 * M_PI)
    
    //用来指定绘画开始的偏移，默认是0 也就是3点钟方向开始。
    @nonobjc static let circleInitialAngle: CGFloat = -CGFloat(M_PI_2)
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
     }
    

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    

    override func draw(_ rect: CGRect) {
        self.context = UIGraphicsGetCurrentContext()
        self.circleDraw(beginValue: minimumValue, endValue:  maximumValue, color: UIColor.blue)
        
        for i in 0..<valus.count{
            let val: InterVal = valus[i] as! InterVal
            self.circleDraw(beginValue: val.beginValue, endValue: val.endValue, color: val.trackColor)

        }
    }
    

    func circleDraw(beginValue:CGFloat, endValue:CGFloat, color:UIColor ) -> Void  {
        color.setStroke()
        fillColor.setFill()
        UIGraphicsPushContext(self.context);
        self.context.beginPath()

        self.context.setLineWidth(trackWidth);
        let beginAngle=valueToAngle(mValue: beginValue)
        let endAngle=valueToAngle(mValue: endValue)
        context.addArc(center: bounds.center, radius: self.radius, startAngle: beginAngle, endAngle: endAngle, clockwise: false)//逆时针绘画，图像展示的是顺时针方向
        context.drawPath(using: CGPathDrawingMode.fillStroke)

        UIGraphicsPushContext(context)
    }
    
    func valueToAngle(mValue:CGFloat)->CGFloat{
        let angleInterval = CircleView.circleMaxValue - CircleView.circleMinValue;
        let valueInterval = maximumValue - CircleView.circleMinValue;

        var  angle:CGFloat = 0
        angle=(mValue / (valueInterval)) * angleInterval + CircleView.circleInitialAngle
        return angle
    }
 
    
}



extension CGRect {
        internal var center: CGPoint {
        get {
            let center = CGPoint(x: midX, y: midY)
            return center
        }
    }
}
