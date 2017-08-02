import UIKit

extension GifModelLoader
{
    func resizeImageRect(image:CGImage) -> CGRect?
    {
        guard
        
            let view:GifView = self.strategy?.view
        
        else
        {
            return nil
        }
        
        let rect:CGRect? = resizeImageRect(
            image:image,
            view:view)
        
        return rect
    }
    
    //MARK: private
    
    private func resizeImageRect(image:CGImage, view:GifView) -> CGRect?
    {
        guard
            
            let constrainedSize:CGSize = constrainedSizeFor(
                view:view)
            
        else
        {
            return nil
        }
        
        let contentMode:UIViewContentMode = view.contentMode
        let resizeRect:CGRect = resizeRectFor(
            contentMode:contentMode,
            constrainedSize:constrainedSize,
            image:image)
        
        return resizeRect
    }
    
    private func constrainedSizeFor(view:GifView) -> CGSize?
    {
        let router:[
            GifView.RenderMode:
            GifModelRenderModeProtocol.Type] = GifModel.renderModeRouter()
        
        let viewRenderMode:GifView.RenderMode = view.renderMode
        
        guard
            
            let modelRenderModeType:
            GifModelRenderModeProtocol.Type = router[
                viewRenderMode]
        
        else
        {
            return nil
        }
        
        let modelRenderMode:
            GifModelRenderModeProtocol = modelRenderModeType.init()
        let gifSize:CGSize = modelRenderMode.gifSizeFor(
            view:view)
        
        return gifSize
    }
    
    private func resizeRectFor(
        contentMode:UIViewContentMode,
        constrainedSize:CGSize,
        image:CGImage) -> CGRect
    {
//        let imageRect:CGRect = CGImage
        return CGRect.zero
    }
}
