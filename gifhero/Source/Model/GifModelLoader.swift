import UIKit
import ImageIO

class GifModelLoader
{
    var modelResize:GifModelResize?
    private(set) weak var strategy:GifStrategyLoad?
    private let model:GifModel
    private let queue:DispatchQueue
    private let kDefaultFrameDuration:TimeInterval = 1
 
    init()
    {
        model = GifModel()
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
            
            self?.loadFrames(source:source)
        }
    }
    
    private func loadFrames(source:CGImageSource)
    {   
        let count:Int = CGImageSourceGetCount(source)
        let options:CFDictionary = CGImageSource.optionsNoCache()
        
        checkLoadFrames(
            source:source,
            count:count,
            index:0,
            options:options)
    }
    
    private func checkLoadFrames(
        source:CGImageSource,
        count:Int,
        index:Int,
        options:CFDictionary)
    {
        if index < count
        {
            let nextIndex:Int = index + 1
            
            queue.async
            { [weak self] in
                
                self?.recursiveLoadFrames(
                    source:source,
                    count:count,
                    index:nextIndex,
                    options:options)
            }
        }
        else
        {
            queue.async
            { [weak self] in
                
                self?.loadFinished()
            }
        }
    }
    
    private func loadFinished()
    {
        strategy?.view?.strategyLoaded()
    }
    
    private func recursiveLoadFrames(
        source:CGImageSource,
        count:Int,
        index:Int,
        options:CFDictionary)
    {
        if let frame:GifModelFrame = loadFrame(
            source:source,
            index:index,
            options:options)
        {
            model.addFrame(frame:frame)
        }
        
        checkLoadFrames(
            source:source,
            count:count,
            index:index,
            options:options)
        
        if index == 1
        {
            displayFirstFrame()
        }
    }
    
    private func loadFrame(
        source:CGImageSource,
        index:Int,
        options:CFDictionary) -> GifModelFrame?
    {
        guard
            
            let image:UIImage = frameImage(
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
        options:CFDictionary) -> UIImage?
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
        
        let image:UIImage = UIImage(cgImage:resizedImage)
        
        return image
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
    
    private func displayFirstFrame()
    {
        strategy?.view?.startRender(
            model:model)
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
