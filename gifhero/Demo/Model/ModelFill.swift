import Foundation

class ModelFill:ModelProtocol
{
    private let kGifName:String = "assetPigCat.gif"
    
    func factoryGif() -> GifView
    {
        let view:GifView = GifView()
        view.gifNamed = kGifName
        
        return view
    }
}
