import UIKit

extension CGImage
{
    open func resizeToFit(
        targetSize:CGSize,
        contentMode:UIViewContentMode) -> CGImage?
    {
        let width:CGFloat = CGFloat(self.width)
        let height:CGFloat = CGFloat(self.height)
        let imageRect:CGRect = targetSize.fittingRectFor(
            width:width,
            height:height,
            contentMode:contentMode)
        
        let newImage:CGImage? = resizeToFit(
            targetSize:targetSize,
            imageRect:imageRect)
        
        return newImage
    }
    
    open func resizeToFit(
        targetSize:CGSize,
        imageRect:CGRect) -> CGImage?
    {
        UIGraphicsBeginImageContext(targetSize)
        
        guard
            
            let context:CGContext = UIGraphicsGetCurrentContext()
            
        else
        {
            UIGraphicsEndImageContext()
            
            return nil
        }
        
        let targetHeight:CGFloat = targetSize.height
        
        context.translateBy(x:0, y:targetHeight)
        context.scaleBy(x:1, y:-1)
        context.draw(self, in:imageRect)
        
        guard
            
            let newImage:CGImage = context.makeImage()
            
        else
        {
            UIGraphicsEndImageContext()
            
            return nil
        }
        
        UIGraphicsEndImageContext()
        
        return newImage
    }
}
