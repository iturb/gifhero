import UIKit

extension GifView
{
    override func draw(_ rect:CGRect)
    {
        strategy?.draw(rect:rect)
    }
    
    func asyncNeedsDisplay()
    {
        DispatchQueue.main.async
        { [weak self] in
            
            self?.setNeedsDisplay()
        }
    }
}

