import UIKit

extension GifModelLoader
{
    func resizeRectFor(view:GifView, imageRect:CGRect) -> CGRect?
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
            imageRect:imageRect)
        
        return imageRect
    }
    
    //MARK: private
    
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
        imageRect:CGRect) -> CGRect
    {
//        let imageRect:CGRect = CGImage
        return CGRect.zero
    }
}
