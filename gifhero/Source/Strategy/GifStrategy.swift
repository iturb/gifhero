import Foundation

class GifStrategy
{
    private(set) weak var view:GifView!
    
    init(view:GifView)
    {
        self.view = view
    }
    
    //MARK: public
    
    func clearModel()
    {
        view.model = nil
    }
}
