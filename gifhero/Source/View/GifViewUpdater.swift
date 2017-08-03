import UIKit

extension GifView
{
    private static let kMaxFramesPerSecond:Int = 20
    
    func factoryDisplayLink(model:GifModel)
    {
        self.model = model
        
        let displayLink:CADisplayLink = CADisplayLink(
            target:self,
            selector:#selector(selectorUpdate(sender:)))
        displayLink.add(
            to:RunLoop.main,
            forMode:RunLoopMode.commonModes)
        
        if #available(iOS 10.0, *)
        {
            displayLink.preferredFramesPerSecond = GifView.kMaxFramesPerSecond
        }
        
        self.displayLink = displayLink
        
        strategyLoaded()
    }
    
    func updateFrame()
    {
        DispatchQueue.main.async
        { [weak self] in
            
            self?.dispatchUpdateFrame()
        }
    }
    
    //MARK: selectors
    
    func selectorUpdate(
        sender displayLink:CADisplayLink)
    {
        let timestamp:TimeInterval = displayLink.timestamp
        
        model?.update(
            view:self,
            timestamp:timestamp)
    }
    
    //MARK: private
    
    private func dispatchUpdateFrame()
    {
        guard
        
            let frame:GifModelFrame = model?.currentFrame()
        
        else
        {
            return
        }
        
        imageView.image = frame.image
    }
}
