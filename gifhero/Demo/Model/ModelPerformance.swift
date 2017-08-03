import Foundation

class ModelPeformance:ModelProtocol
{
    private let kGifName:String = "assetPigSmile.gif"
    
    func factoryGif() -> GifView
    {
        let view:GifView = GifView()
        view.renderMode = GifView.RenderMode.betterPerformance
        view.gifNamed = kGifName
        
        return view
    }
}
