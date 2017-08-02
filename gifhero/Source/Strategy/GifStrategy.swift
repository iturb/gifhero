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
    
    func changeSize()
    {
        clearModel()
    }
    
    func preLoad()
    {
        
    }
    
    func startAnimating()
    {
        
    }
    
    func stopAnimating()
    {
        
    }
}
