import Foundation

class GifStrategy
{
    private(set) weak var view:GifView?
    
    init(view:GifView)
    {
        self.view = view
    }
    
    //MARK: public
    
    func changeSource()
    {
        clearModel()
    }
    
    func changeSize()
    {
        clearModel()
    }
    
    func startAnimating()
    {
    }
    
    func stopAnimating()
    {
    }
    
    //MARK: final
    
    final func clearModel()
    {
        view?.model = nil
    }
}
