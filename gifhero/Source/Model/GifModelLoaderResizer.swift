import UIKit

extension GifModelLoader
{
    func resizeImage(image:CGImage) -> CGImage?
    {
        guard
        
            let modelResize:GifModelResize = self.modelResize
        
        else
        {
            let resizedImage:CGImage? = factoryAndResize(
                image:image)
            
            return resizedImage
        }
        
        let resizedImage:CGImage? = resizeImage(
            image:image,
            modelResize:modelResize)
        
        return resizedImage
    }
    
    //MARK: private
    
    private func resizeImage(
        image:CGImage,
        modelResize:GifModelResize) -> CGImage?
    {
        let resizedImage:CGImage? = image.resizeToFit(
            targetSize:modelResize.constrainSize,
            imageRect:modelResize.resizingRect)
        
        return resizedImage
    }
    
    private func factoryAndResize(image:CGImage) -> CGImage?
    {
        factoryResizeDimensions(image:image)
        
        guard
        
            let modelResize:GifModelResize = self.modelResize
        
        else
        {
            return nil
        }
        
        let resizedImage:CGImage? = resizeImage(
            image:image,
            modelResize:modelResize)
        
        return resizedImage
    }
    
    private func factoryResizeDimensions(image:CGImage)
    {
        guard
            
            let view:GifView = self.strategy?.view
            
        else
        {
            return
        }
        
        resizeImageRect(image:image, view:view)
    }
    
    private func resizeImageRect(image:CGImage, view:GifView)
    {
        let contentMode:UIViewContentMode = view.contentMode
        let constrainSize:CGSize = view.bounds.size
        
        let resizingRect:CGRect = resizeRectFor(
            contentMode:contentMode,
            constrainSize:constrainSize,
            image:image)
        
        modelResize = GifModelResize(
            resizingRect:resizingRect,
            constrainSize:constrainSize)
    }
    
    private func resizeRectFor(
        contentMode:UIViewContentMode,
        constrainSize:CGSize,
        image:CGImage) -> CGRect
    {
        let width:CGFloat = CGFloat(image.width)
        let height:CGFloat = CGFloat(image.height)
        let resizeRect:CGRect = constrainSize.fittingRectFor(
            width:width,
            height:height,
            contentMode:contentMode)
        
        return resizeRect
    }
}
