

import UIKit
import AVFoundation

class ViewController: UIViewController {
    let eggTimes = ["Soft":30, "Medium":40, "Hard":60]
    var timer = Timer()
    var totalTime = 0
    var secondPassed = 0
    var player: AVAudioPlayer!
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var textLabel: UILabel!
    @IBAction func EggPressed(_ sender: UIButton) {

        timer.invalidate()
        let hardness = sender.currentTitle!
        totalTime = eggTimes[hardness]!
        
        progressBar.progress = 0.0
        secondPassed = 0
        textLabel.text = hardness
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
    }
    
    @objc func updateTimer(){
        if secondPassed  < totalTime{
            secondPassed += 1
            progressBar.progress = Float(secondPassed) / Float(totalTime)
            

        }else{
            timer.invalidate()
            textLabel.text = "DONE!"
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
        }
    }
    

}
