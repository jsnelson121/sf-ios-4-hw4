//
//  MovieListViewController.swift
//  TopMovies
//
//  Created by James Nelson on 1/11/16.
//  Copyright © 2016 GA Student. All rights reserved.
//

import UIKit

class MovieListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var movieListTableView: UITableView!
    
    
    var movies: [NSDictionary]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.movieListTableView.delegate = self
        self.movieListTableView.dataSource = self
        
        self.title = "🔝🎞"
        
        let itunesURL = NSURL(string: "https://itunes.apple.com/us/rss/topmovies/limit=100/json")!
        NSURLSession.sharedSession().dataTaskWithRequest(NSURLRequest(URL: itunesURL)) { (data, response, error) in
            dispatch_async(dispatch_get_main_queue()) {
                let json = try! NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments) as! NSDictionary
                let moviesArray = json.valueForKeyPath("feed.entry") as? [NSDictionary]
                self.movies = moviesArray
                
                //tells table view to call methods
                self.movieListTableView.reloadData()
                
                print("Yay! The Movies Downloaded! 🎉")
            }
            }.resume()
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        
        //casting as superclass value from UITableViewCell
        let movieCell = cell as! MovieTableViewCell
        movieCell.titleLabel.text = "\(indexPath.row)"
        
        let title = self.titleStringForMovieAtIndex(indexPath.row)
        let director = self.directorStringForMovieAtIndex(indexPath.row)
        let summary = self.summaryStringForMovieAtIndex(indexPath.row)
        
        
        
        movieCell.titleLabel?.text = title
        movieCell.directorLabel?.text = director
        movieCell.descriptionLabel?.text = summary
        
        let posterImageURL = self.posterImageURLForMovieAtIndex(indexPath.row)
        //movieCell.posterImageView?.image = nil
        //sets image to nothing in the event that network is slow
        
        movieCell.posterView?.setImageWithURL(posterImageURL)

        
    }
    
    

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // double question marks say if optional is nil, use 0 (ie: nothing to load)
        return self.movies?.count ?? 0
    }
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MovieCell", forIndexPath: indexPath)
        return cell
    }
    
    
    func titleStringForMovieAtIndex(index: Int) -> String? {
        let movie = self.movies?[index]
        let title = movie?.valueForKeyPath("im:name.label") as? String
        return title
    }
    
    func directorStringForMovieAtIndex(index: Int) -> String? {
        let movie = self.movies?[index]
        let director = movie?.valueForKeyPath("im:artist.label") as? String
        return director
    }
    
    func summaryStringForMovieAtIndex(index: Int) -> String? {
        let movie = self.movies?[index]
        let summary = movie?.valueForKeyPath("summary.label") as? String
        return summary
    }
    
    func posterImageURLForMovieAtIndex(index: Int) -> NSURL {
        let movie = self.movies?[index]
        let posterImageURLArray = movie?.valueForKeyPath("im:image.label") as? [String]
        let posterImageURLString = posterImageURLArray?.last
        let posterImageURL = NSURL(string: posterImageURLString!)!
        return posterImageURL
    }
    
    func randomIntegerWithMinimum(min: Int, andMaximum max: Int) -> Int {
        let randomNumber = Int(arc4random_uniform(UInt32((max - min) + 1))) + min
        return randomNumber
    }


    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
