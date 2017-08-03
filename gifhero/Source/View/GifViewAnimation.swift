import Foundation

extension GifView
{
    open func preLoad()
    {
        strategy?.preLoad()
    }
    
    open func startAnimation()
    {
        strategy?.startAnimating()
    }
    
    open func stopAnimation()
    {
        strategy?.stopAnimating()
    }
}
