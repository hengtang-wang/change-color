//
//  ViewController.swift
//  change color
//
//  Created by Wangtong on 2022/9/5.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    let pisc = ["美國隊長", "蝙蝠俠", "超人"]
    var index = 0
    
    
    @IBOutlet weak var alphaLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var randomButton: UIButton!
    @IBOutlet weak var alphaSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        let player = AVPlayer()
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let fileUrl = Bundle.main.url(forResource: "shallow-sing-along-lady-gaga-and-bradley-cooper-netflix", withExtension: "mp3")!
        let playerItem = AVPlayerItem(url: fileUrl)
                player.replaceCurrentItem(with: playerItem)
                player.volume = 1
                player.play()
        
        //設定漸層
        let gradientView = UIView(frame: CGRect(x: 0, y: 0, width: 393, height: 852))
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = gradientView.bounds
        gradientLayer.colors = [CGColor(red: 34/255, green: 1/255, blue: 134/255, alpha: 1),CGColor(red: 0, green: 0, blue: 0, alpha: 1)]
        view.layer.insertSublayer(gradientLayer, at: 0)
        
        
    
    }
    

    @IBAction func preButton(_ sender: Any) {
        index = (index + pisc.count - 1) % pisc.count
        let role = pisc[index]
        imageView.image = UIImage(named: role)
        pageControl.currentPage = index
        segmentedControl.selectedSegmentIndex = index
        
    }
    
    @IBAction func nextButton(_ sender: Any) {
        index = (index + 1) % pisc.count
        imageView.image = UIImage(named: pisc[index])
        pageControl.currentPage = index
        segmentedControl.selectedSegmentIndex = index
        
    }
    
    @IBAction func changePageControl(_ sender: UIPageControl) {
        index = sender.currentPage
        imageView.image = UIImage(named: pisc[index])
        segmentedControl.selectedSegmentIndex = index
    
        
    }
    
    @IBAction func changeSegment(_ sender: UISegmentedControl) {
        index = sender.selectedSegmentIndex
        imageView.image = UIImage(named: pisc[index])
        pageControl.currentPage = index
    }
    
    @IBAction func changeColor(_ sender: Any) {
        imageView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaSlider.value))
        redLabel.text = String(format: "%.2f", redSlider.value)
        greenLabel.text = String(format: "%.2f", greenSlider.value)
        blueLabel.text = String(format: "%.2f", blueSlider.value)
        alphaLabel.text = String(format: "%.2f", alphaSlider.value)
    }
    
    @IBAction func colorRandom(_ sender: Any) {
        redSlider.value = Float.random(in: 0...1)
        greenSlider.value = Float.random(in: 0...1)
        blueSlider.value = Float.random(in: 0...1)
        alphaSlider.value = Float.random(in: 0...1)
        imageView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaSlider.value))
        
        redLabel.text = String(format: "%.2f", redSlider.value)
        greenLabel.text = String(format: "%.2f", greenSlider.value)
        blueLabel.text = String(format: "%.2f", blueSlider.value)
        alphaLabel.text = String(format: "%.2f", alphaSlider.value)
        
    }
    
}

