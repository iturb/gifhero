import UIKit

class GifModelRenderModeBetterQuality:GifModelRenderModeProtocol
{
    required init()
    {
    }
    
    func gifSizeFor(view:UIView) -> CGSize
    {
        let viewSize:CGSize = view.bounds.size
        
        return viewSize
    }
}
