import Foundation

class ModelUrl:ModelProtocol
{
    private let kGifName:String = "assetPigJump.gif"
    
    func factoryGif() -> GifView
    {
        let url:URL? = Bundle.main.url(
            forResource:kGifName,
            withExtension:nil)
        
        let view:GifView = GifView()
        view.url = url
        
        return view
    }
}
