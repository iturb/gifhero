import UIKit

extension GifView
{
    func factoryDisplayLink(model:GifModel)
    {
        self.model = model
        
        let displayLink:CADisplayLink = CADisplayLink(
            target:self,
            selector:#selector(selectorUpdate(sender:)))
        displayLink.add(
            to:RunLoop.main,
            forMode:RunLoopMode.commonModes)
        self.displayLink = displayLink
        
        strategy?.animationChange()
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
