import Foundation

class GifStrategy
{
    private(set) weak var view:GifView?
    
    init(view:GifView)
    {
        self.view = view
    }
    
    //MARK: private
    
    private func stopUpdate()
    {
        view?.displayLink?.isPaused = true
    }
    
    private func startUpdate()
    {
        view?.displayLink?.isPaused = false
    }
    
    //MARK: public
    
    func render()
    {
    }
    
    func changeSource()
    {
        clearModel()
    }
    
    func changeSize()
    {
        clearModel()
    }
    
    func nextFrame(
        model:GifModel,
        timestamp:TimeInterval,
        delta:TimeInterval)
    {
    }
    
    //MARK: final
    
    final func clearModel()
    {
        view?.model = nil
    }
    
    final func animationChange()
    {
        guard
            
            let view:GifView = self.view
            
        else
        {
            return
        }
        
        if view.animating
        {
            startUpdate()
        }
        else
        {
            stopUpdate()
        }
    }
}
