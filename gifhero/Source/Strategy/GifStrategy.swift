import Foundation

class GifStrategy
{
    private(set) weak var view:GifView!
    
    init(view:GifView)
    {
        self.view = view
    }
}
