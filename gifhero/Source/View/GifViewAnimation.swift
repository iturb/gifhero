import Foundation

extension GifView
{
    open func startAnimation()
    {
        strategy?.startAnimating()
    }
    
    open func stopAnimation()
    {
        strategy?.stopAnimating()
    }
}
