import UIKit
import ImageIO

class GifModelLoader
{
    private let queue:DispatchQueue
    private weak var strategy:GifStrategyLoad?
 
    init()
    {
        queue = GifModelLoader.factoryQueue()
    }
    
    //MARK: private
    
    private func loadForView(view:GifView)
    {
        guard
        
            let url:URL = GifModelLoader.sourceUrlFor(view:view)
        
        else
        {
            strategy?.loadFail()
            
            return
        }
        
        queue.async
        { [weak self] in
            
            self?.loadWithUrl(url:url)
        }
    }
    
    private func loadWithUrl(url:URL)
    {
        guard
        
            let source:CGImageSource = CGImageSource.factorySource(url:url)
        
        else
        {
            strategy?.loadFail()
            
            return
        }
        
        queue.async
        { [weak self] in
            
            self?.loadFramesFor(source:source)
        }
    }
    
    private func loadFramesFor(source:CGImageSource)
    {
        let count:Int = CGImageSourceGetCount(source)
        let options:CFDictionary = CGImageSource.optionsNoCache()
        var frames:[VGifFrame] = []
        
        for index:Int in 0 ..< count
        {
            guard
                
                let image:CGImage = VGif.frameImage(
                    source:source,
                    index:index,
                    options:options)
                
                else
            {
                continue
            }
            
            let itemDuration:TimeInterval =  frameDuration(
                source:source,
                index:index)
            
            let frame:VGifFrame = VGifFrame(
                image:image,
                duration:itemDuration)
            frames.append(frame)
        }
        
        framesLoaded(frames:frames)
    }
    
    //MARK: public
    
    func load(strategy:GifStrategyLoad)
    {
        self.strategy = strategy
        
        queue.async
        { [weak strategy, weak self] in
                
            guard
            
                let view:GifView = strategy?.view
            
            else
            {
                strategy?.loadFail()
                
                return
            }
            
            self?.loadForView(view:view)
        }
    }
}
