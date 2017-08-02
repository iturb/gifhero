import UIKit

extension GifModelLoader
{
    func drawFrameForView(view:GifView) -> CGRect?
    {
        
    }
    
    //MARK: private
    
    private func gifSizeForView(view:GifView) -> CGSize?
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
        let gifSize:CGSize = modelRenderMode.gifSizeForView(
            view:view)
        
        return gifSize
    }
}
