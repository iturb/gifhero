import Foundation

extension GifView
{
    func preLoad()
    {
        strategy?.preLoad()
    }
    
    func startAnimation()
    {
        strategy?.startAnimating()
    }
    
    func stopAnimation()
    {
        strategy?.stopAnimating()
    }
}
