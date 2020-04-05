import UIKit

class ViewController: UIViewController  {

override func viewDidLoad() {
    super.viewDidLoad()
}

override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    // Create destination URL 
    let documentsUrl:URL =  FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first as URL!
    let destinationFileUrl = documentsUrl.appendingPathComponent("downloadedFile.jpg")
    
    //Create URL to the source file you want to download
    let fileURL = URL(string: "https://s3.amazonaws.com/learn-swift/IMG_0001.JPG")
    
    let sessionConfig = URLSessionConfiguration.default
    let session = URLSession(configuration: sessionConfig)
 
    let request = URLRequest(url:fileURL!)
    
    let task = session.downloadTask(with: request) { (tempLocalUrl, response, error) in
        let statusCode = (response as? HTTPURLResponse)?.statusCode
        print("Successfully downloaded. Status code: \(statusCode)")
        
        FileManager.default.copyItem(at: tempLocalUrl, to: destinationFileUrl)
    }
    task.resume()
    
  }

}