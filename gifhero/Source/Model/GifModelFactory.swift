import Foundation

extension GifModel
{
    class func renderModeRouter() -> [
        GifView.RenderMode:
        GifModelRenderModeProtocol.Type]
    {
        let router:[
            GifView.RenderMode:
            GifModelRenderModeProtocol.Type] = [
                GifView.RenderMode.betterQuality:
                    GifModelRenderModeBetterQuality.self,
                GifView.RenderMode.betterPerformance:
                    GifModelRenderModeBetterPerformance.self,
                GifView.RenderMode.half:
                    GifModelRenderModeHalf.self
        ]
        
        return router
    }
}
