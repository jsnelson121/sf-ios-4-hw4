//
//  RandomMovieViewController.swift
//  TopMovies
//
//  Created by Jeffrey Bergier on 12/12/15.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//

import UIKit

class MovieDetailViewController: UIViewController {
    
    //
    // Put IBOutlets Below This Line
    //
    
    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var directorLabel: UILabel?
    @IBOutlet weak var summaryLabel: UILabel?
    @IBOutlet weak var posterImageView: UIImageView?
    
    //
    // Put IBOutlets Above This Line
    //
    
    //var movies: [NSDictionary]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*
        self.title = "🔝🎞"
        
        let itunesURL = NSURL(string: "https://itunes.apple.com/us/rss/topmovies/limit=100/json")!
        NSURLSession.sharedSession().dataTaskWithRequest(NSURLRequest(URL: itunesURL)) { (data, response, error) in
            dispatch_async(dispatch_get_main_queue()) {
                let json = try! NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments) as! NSDictionary
                let moviesArray = json.valueForKeyPath("feed.entry") as? [NSDictionary]
                self.movies = moviesArray
                print("Yay! The Movies Downloaded! 🎉")
            }
        }.resume()
        */
    }
    
    //
    // Put IBAction Below This Line
    //
    
    /*
    @IBAction func didTapChangeMovieButton(sender: AnyObject) {
        let max = self.movies!.count - 1
        
        let randomNumber = self.randomIntegerWithMinimum(0, andMaximum: max)
        
        let title = self.titleStringForMovieAtIndex(randomNumber)
        let director = self.directorStringForMovieAtIndex(randomNumber)
        let summary = self.summaryStringForMovieAtIndex(randomNumber)
        
        
        
        self.titleLabel?.text = title
        self.directorLabel?.text = director
        self.summaryLabel?.text = summary
        
        let posterImageURL = self.posterImageURLForMovieAtIndex(randomNumber)
        self.posterImageView?.image = nil
        //sets image to nothing in the event that network is slow
        
        self.posterImageView?.setImageWithURL(posterImageURL)
    }
    */
    
    //
    // Put IBAction Above This Line
    //
    /*
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
    */
}
