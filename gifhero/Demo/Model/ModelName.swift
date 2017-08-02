import Foundation

class ModelName:ModelProtocol
{
    private let kGifName:String = "assetPigIceCream.gif"
    
    func factoryGif() -> GifView
    {
        let view:GifView = GifView()
        view.gifNamed = kGifName
        
        return view
    }
}
