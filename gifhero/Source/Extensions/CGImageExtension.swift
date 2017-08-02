import UIKit

extension CGImage
{
    func rectToDraw(
        atSize:CGSize,
        contentMode:UIViewContentMode) -> CGRect
    {
        let imageWidth:CGFloat = CGFloat(width)
        let imageHeight:CGFloat = CGFloat(height)
        let targetWidth:CGFloat = atSize.width
        let targetHeight:CGFloat = atSize.height
        let ratioWidth:CGFloat = imageWidth / targetWidth
        let ratioHeight:CGFloat = imageHeight / targetHeight
        
        let ratio:CGFloat = ratioFor(
            contentMode:contentMode,
            ratioA:ratioWidth,
            ratioB:ratioHeight)
        
        let scaledWidth:CGFloat = imageWidth / ratio
        let scaledHeight:CGFloat = imageHeight / ratio
        let remainWidth:CGFloat = targetWidth - scaledWidth
        let remainHeight:CGFloat = targetHeight - scaledHeight
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
