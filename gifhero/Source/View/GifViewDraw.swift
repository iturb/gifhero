import UIKit

extension GifView
{
    override func draw(_ rect:CGRect)
    {
        strategy?.draw()
    }
    
    func asyncNeedsDisplay()
    {
        DispatchQueue.main.async
        { [weak self] in
            
            self?.setNeedsDisplay()
        }
    }
}

