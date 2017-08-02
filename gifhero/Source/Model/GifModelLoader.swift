import UIKit
import ImageIO

class GifModelLoader
{
    var modelResize:GifModelResize?
    private(set) weak var strategy:GifStrategyLoad?
    private let queue:DispatchQueue
    private let kDefaultFrameDuration:TimeInterval = 1
 
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
        
            let source:CGImageSource = CGImageSource.factorySource(
                url:url)
        
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
        var frames:[GifModelFrame] = []
        
        for index:Int in 0 ..< count
        {
            guard
                
                let frame:GifModelFrame = loadFrame(
                    source:source,
                    index:index,
                    options:options)
            
            else
            {
                continue
            }
            
            frames.append(frame)
        }
        
//        framesLoaded(frames:frames)
    }
    
    private func loadFrame(
        source:CGImageSource,
        index:Int,
        options:CFDictionary) -> GifModelFrame?
    {
        guard
            
            let image:CGImage = frameImage(
                source:source,
                index:index,
                options:options)
        
        else
        {
            return nil
        }
        
        let duration:TimeInterval = frameDuration(
            source:source,
            index:index)
        
        let frame:GifModelFrame = GifModelFrame(
            image:image,
            duration:duration)
        
        return frame
    }
    
    private func frameImage(
        source:CGImageSource,
        index:Int,
        options:CFDictionary) -> CGImage?
    {
        guard
            
            let originalImage:CGImage = source.frameImageAt(
                index:index,
                options:options),
            let resizedImage:CGImage = resizeImage(
                image:originalImage)
            
        else
        {
            return nil
        }
        
        return resizedImage
    }
    
    private func frameDuration(
        source:CGImageSource,
        index:Int) -> TimeInterval
    {
        let duration:TimeInterval
        
        if let frameDuration:TimeInterval =  source.frameDurationAt(
            index:index)
        {
            duration = frameDuration
        }
        else
        {
            duration = kDefaultFrameDuration
        }
        
        return duration
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
