import Foundation

class ModelQuality:ModelProtocol
{
    private let kGifName:String = "assetPigSmile.gif"
    
    func factoryGif() -> GifView
    {
        let view:GifView = GifView()
        view.renderMode = GifView.RenderMode.betterQuality
        view.gifNamed = kGifName
        
        return view
    }
}
