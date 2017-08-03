import Foundation

class ModelHalf:ModelProtocol
{
    private let kGifName:String = "assetPigWalk.gif"
    
    func factoryGif() -> GifView
    {
        let view:GifView = GifView()
        view.renderMode = GifView.RenderMode.half
        view.gifNamed = kGifName
        
        return view
    }
}
