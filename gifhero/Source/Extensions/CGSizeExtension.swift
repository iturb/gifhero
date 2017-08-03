import UIKit

extension CGSize
{
    public func fittingRectFor(
        width:CGFloat,
        height:CGFloat,
        contentMode:UIViewContentMode) -> CGRect
    {
        let ratioWidth:CGFloat = width / self.width
        let ratioHeight:CGFloat = height / self.height
        
        let ratio:CGFloat = ratioFor(
            contentMode:contentMode,
            ratioA:ratioWidth,
            ratioB:ratioHeight)
        
        let scaledWidth:CGFloat = width / ratio
        let scaledHeight:CGFloat = height / ratio
        let remainWidth:CGFloat = self.width - scaledWidth
        let remainHeight:CGFloat = self.height - scaledHeight
        let marginX:CGFloat = remainWidth / 2.0
        let marginY:CGFloat = remainHeight / 2.0
        let drawingRect:CGRect = CGRect(
            x:marginX,
            y:marginY,
            width:scaledWidth,
            height:scaledHeight)
        
        return drawingRect
    }
    
    //MARK: private
    
    private func ratioFor(
        contentMode:UIViewContentMode,
        ratioA:CGFloat,
        ratioB:CGFloat) -> CGFloat
    {
        let ratio:CGFloat
        
        switch contentMode
        {
        case UIViewContentMode.scaleAspectFit:
            
            ratio = max(ratioA, ratioB)
            
            break
            
        default:
            
            ratio = min(ratioA, ratioB)
            
            break
        }
        
        return ratio
    }
}
