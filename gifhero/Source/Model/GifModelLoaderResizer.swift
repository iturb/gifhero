import UIKit

extension GifModelLoader
{
    func factoryResizeDimensions(image:CGImage)
    {
        guard
        
            let view:GifView = self.strategy?.view
        
        else
        {
            return
        }
        
        resizeImageRect(image:image, view:view)
    }
    
    //MARK: private
    
    private func resizeImageRect(image:CGImage, view:GifView)
    {
        let contentMode:UIViewContentMode = view.contentMode
        
        guard
            
            let constrainedSize:CGSize = constrainedSizeFor(
                view:view)
            
        else
        {
            return
        }
        
        self.constrainedSize = constrainedSize
        self.resizeRect = resizeRectFor(
            contentMode:contentMode,
            constrainedSize:constrainedSize,
            image:image)
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
