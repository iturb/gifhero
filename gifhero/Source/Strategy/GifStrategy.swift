import UIKit

class GifStrategy
{
    private(set) weak var view:GifView!
    
    init(view:GifView)
    {
        self.view = view
    }
    
    //MARK: public
    
    func changeSource()
    {
        clearModel()
    }
    
    func changeSize()
    {
        clearModel()
    }
    
    func preLoad()
    {
    }
    
    func draw(rect:CGRect)
    {
    }
    
    func startAnimating()
    {
    }
    
    func stopAnimating()
    {
    }
    
    //MARK: final
    
    final func clearModel()
    {
        view.model = nil
    }
    
    final func drawCurrentFrame(rect:CGRect)
    {
        guard
        
            let frame:GifModelFrame = view.model?.currentFrame(),
            let context:CGContext = UIGraphicsGetCurrentContext()
        
        else
        {
            return
        }
        
        let image:CGImage = frame.image
        context.draw(image, in:rect)
    }
}
