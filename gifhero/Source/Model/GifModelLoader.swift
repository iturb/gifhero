import UIKit
import ImageIO

class GifModelLoader
{
    private weak var strategy:GifStrategyLoad?
    
    //MARK: private
    
    private func loadForView(view:GifView)
    {
        let gifUrl:URL?
        
        if let url:URL = view.url
        {
            gifUrl = url
        }
        else if let gifNamed:String = view.gifNamed
        {
            gifUrl = GifModelLoader.factoryUrl(
                gifNamed:gifNamed)
        }
        else
        {
            gifUrl = nil
        }
        
        guard
        
            let url:URL = gifUrl
        
        else
        {
            strategy?.loadFail()
            
            return
        }
        
        loadWithUrl(url:url)
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
    }
    
    private func loadFrames(source:CGImageSource)
    {
        let count:Int = CGImageSourceGetCount(source)
        let options:CFDictionary = VGif.frameOptions()
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
        
        let queue:DispatchQueue = GifModelLoader.factoryQueue()
        
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
