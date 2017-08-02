import UIKit

class GifModelRenderModeBetterPerformance:GifModelRenderModeProtocol
{
    private let kSizeMultiplier:CGFloat = 0.5
    private let kMinSize:CGFloat = 10
    
    required init()
    {
    }
    
    func gifSizeFor(view:UIView) -> CGSize
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
