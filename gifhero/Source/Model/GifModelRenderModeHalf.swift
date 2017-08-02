import UIKit

class GifModelRenderModeHalf:GifModelRenderModeProtocol
{
    private let kSizeMultiplier:CGFloat = 0.75
    private let kMinSize:CGFloat = 50
    
    required init()
    {
    }
    
    func gifSizeForView(view:UIView) -> CGSize
    {
        let viewSize:CGSize = view.bounds.size
        let viewWidth:CGFloat = viewSize.width
        let viewHeight:CGFloat = viewSize.height
        var scaledWidth:CGFloat = viewWidth * kSizeMultiplier
        var scaledHeight:CGFloat = viewHeight * kSizeMultiplier
        
        if scaledWidth < kMinSize
        {
            scaledWidth = kMinSize
        }
        
        if scaledHeight < kMinSize
        {
            scaledHeight = kMinSize
        }
        
        let gifSize:CGSize = CGSize(
            width:scaledWidth,
            height:scaledHeight)
        
        return gifSize
    }
}
