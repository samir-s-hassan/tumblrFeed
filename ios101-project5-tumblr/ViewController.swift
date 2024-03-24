//
//  ViewController.swift
//  ios101-project5-tumbler
//

import UIKit
import Nuke

//Samir - conform to the protocol is to implement a few methods that the data source needs to display the table view
class ViewController: UIViewController, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return the number of posts we'll be displaying        
        print("🍏 numberOfRowsInSection called with posts count: \(posts.count)")
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Get a reusable cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "TumCell", for: indexPath) as! TumCell
                
        // Get the movie associated table view row
        let post = posts[indexPath.row]
        
        // Configure the cell (i.e., update UI elements like labels, image views, etc.)
        // Get the first photo in the post's photos array
        if let photo = post.photos.first {
              let url = photo.originalSize.url
              
            Nuke.loadImage(with: url, into: cell.tumblrPicView)

        }
        
        // Set the text on the labels
        cell.numberLabel.text = post.summary //Samir - I had messed up the naming of these labels but summary does belong to numberLabel
        
        // Return the cell for use in the respective table view row
        return cell
    }
    

//Samir - added the outlet here before the viewDidLoad()
    
    @IBOutlet weak var tableView: UITableView!
    
    
    // A property to store the blogs we fetch.
    private var posts: [Post] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        fetchPosts()
    }



    func fetchPosts() {
        let url = URL(string: "https://api.tumblr.com/v2/blog/humansofnewyork/posts/photo?api_key=1zT8CiXGXFcQDyMFG7RtcfGLwTdDjFUJnZzKJaWTmgyK4lKGYk")!
        let session = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("❌ Error: \(error.localizedDescription)")
                return
            }

            guard let statusCode = (response as? HTTPURLResponse)?.statusCode, (200...299).contains(statusCode) else {
                print("❌ Response error: \(String(describing: response))")
                return
            }

            guard let data = data else {
                print("❌ Data is NIL")
                return
            }

            do {
                let blog = try JSONDecoder().decode(Blog.self, from: data)
                let posts = blog.response.posts //Get the posts from the decoded JSON
                
                DispatchQueue.main.async { [weak self] in

                    // Update the posts property so we can access post data anywhere in the view controller.
                    self?.posts = posts
                    self?.tableView.reloadData() //also have to reload the data because async requests are slow

                    print("✅ We got \(posts.count) posts!")
                    for post in posts {
                        print("🍏 Summary: \(post.summary)")
                    }
                }

            } catch {
                print("❌ Error decoding JSON: \(error.localizedDescription)")
            }
        }
        session.resume()
    }
}
