//
//  SMSegmentViewController
//
//  Created by Si Ma on 05/01/2015.
//  Copyright (c) 2015 Si Ma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var segmentView: SMSegmentView!
    var multiselectSegmentView: SMSegmentView!
    var margin: CGFloat = 10.0

    private func prepareAppearance(multiselect: Bool = false) -> SMSegmentAppearance {
        /*
          Use SMSegmentAppearance to set segment related UI properties.
          Each property has its own default value, so you only need to specify the ones you are interested.
        */
        let appearance = SMSegmentAppearance()
        appearance.segmentOnSelectionColour = UIColor(red: 245.0/255.0, green: 174.0/255.0, blue: 63.0/255.0, alpha: 1.0)
        appearance.segmentOffSelectionColour = UIColor.white
        appearance.titleOnSelectionFont = UIFont.systemFont(ofSize: 12.0)
        appearance.titleOffSelectionFont = UIFont.systemFont(ofSize: 12.0)
        appearance.contentVerticalMargin = 10.0
        if multiselect {
            appearance.segmentMultiSelect = true
        }
        return appearance

    }

    private func prepareSegmentView(sview: SMSegmentView) {

        sview.backgroundColor = UIColor.clear

        sview.layer.cornerRadius = 5.0
        sview.layer.borderColor = UIColor(white: 0.85, alpha: 1.0).cgColor
        sview.layer.borderWidth = 1.0

        // Add segments
        sview.addSegmentWithTitle("Clip", onSelectionImage: UIImage(named: "clip_light"), offSelectionImage: UIImage(named: "clip"))
        sview.addSegmentWithTitle("Blub", onSelectionImage: UIImage(named: "bulb_light"), offSelectionImage: UIImage(named: "bulb"))
        sview.addSegmentWithTitle("Cloud", onSelectionImage: UIImage(named: "cloud_light"), offSelectionImage: UIImage(named: "cloud"))

        sview.addTarget(self, action: #selector(selectSegmentInSegmentView(segmentView:)), for: .valueChanged)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(white: 0.95, alpha: 1.0)

        let appearance = prepareAppearance()
        
        /*
          Init SMsegmentView
          Set divider colour and width here if there is a need
         */
        let segmentFrame = CGRect(x: self.margin, y: 120.0, width: self.view.frame.size.width - self.margin*2, height: 40.0)
        self.segmentView = SMSegmentView(frame: segmentFrame, dividerColour: UIColor(white: 0.95, alpha: 0.3), dividerWidth: 1.0, segmentAppearance: appearance)

        prepareSegmentView(sview: self.segmentView)

        // Set segment with index 0 as selected by default
        self.segmentView.selectedSegmentsIndexes = [0]
        self.view.addSubview(self.segmentView)

        /*
          Init multiselect SMsegmentView
          Set divider colour and width here if there is a need
         */

        let multiselectAppearance = prepareAppearance( multiselect: true)
        let multuselectSegmentFrame = CGRect(x: self.margin, y: 220.0, width: self.view.frame.size.width - self.margin*2, height: 40.0)
    
        self.multiselectSegmentView = SMSegmentView(frame: multuselectSegmentFrame, dividerColour: UIColor(white: 0.95, alpha: 0.3), dividerWidth: 1.0, segmentAppearance: multiselectAppearance)

        prepareSegmentView(sview: self.multiselectSegmentView)

        // Set segment with index 0 as selected by default
        self.multiselectSegmentView.selectedSegmentsIndexes = [0, 2]
        self.view.addSubview(self.multiselectSegmentView)

    }
    
    // SMSegment selector for .ValueChanged
    @objc func selectSegmentInSegmentView(segmentView: SMSegmentView) {
        /*
        Replace the following line to implement what you want the app to do after the segment gets tapped.
        */
        if segmentView.segmentAppearance?.segmentMultiSelect ?? false {
            print("Select segments at indexes: \(segmentView.selectedSegmentsIndexes)")
        }
        else {
            print("Select segment at index: \(segmentView.selectedSegmentsIndexes.first ?? -1)")
        }
    }
    
    override func willAnimateRotation(to toInterfaceOrientation: UIInterfaceOrientation, duration: TimeInterval) {
        /*
        MARK: Replace the following line to your own frame setting for segmentView.
        */
        if toInterfaceOrientation == UIInterfaceOrientation.landscapeLeft || toInterfaceOrientation == UIInterfaceOrientation.landscapeRight {
            
            self.segmentView.organiseMode = .vertical
            if let appearance = self.segmentView.segmentAppearance {
                appearance.contentVerticalMargin = 25.0
            }
            self.segmentView.frame = CGRect(x: self.view.frame.size.width/2 - 120.0, y: 100.0, width: 80.0, height: 220.0)

            self.multiselectSegmentView.organiseMode = .vertical
            if let appearance = self.multiselectSegmentView.segmentAppearance {
                appearance.contentVerticalMargin = 25.0
            }
            self.multiselectSegmentView.frame = CGRect(x: self.view.frame.size.width/2 + 40.0, y: 100.0, width: 80.0, height: 220.0)

        }
        else {
            
            self.segmentView.organiseMode = .horizontal
            if let appearance = self.segmentView.segmentAppearance {
                appearance.contentVerticalMargin = 10.0
            }
            self.segmentView.frame = CGRect(x: self.margin, y: 120.0, width: self.view.frame.size.width - self.margin*2, height: 40.0)

            self.multiselectSegmentView.organiseMode = .horizontal
            if let appearance = self.multiselectSegmentView.segmentAppearance {
                appearance.contentVerticalMargin = 10.0
            }
            self.multiselectSegmentView.frame = CGRect(x: self.margin, y: 220.0, width: self.view.frame.size.width - self.margin*2, height: 40.0)

        }
    }
}

