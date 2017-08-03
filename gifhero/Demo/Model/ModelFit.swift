import UIKit

class ModelFit:ModelProtocol
{
    private let kGifName:String = "assetPigSmile.gif"
    
    func factoryGif() -> GifView
    {
        let view:GifView = GifView()
        view.contentMode = UIViewContentMode.scaleAspectFit
        view.gifNamed = kGifName
        
        return view
    }
}
