//
//  ChartsViewController.swift
//  Near Care
//
//  Created by Niranjan Ravichandran on 30/01/16.
//  Copyright © 2016 adavers. All rights reserved.
//

import UIKit
import Charts

class ChartsViewController: UIViewController {

    @IBOutlet var barChartView: BarChartView!
    let unitsNotSold = [22.0, 2.0, 3.0, 1.5, 6.0, 8.0, 2.0, 9.0, 1.0, 2.0, 2.5, 2.0]
    
    var months = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
        let unitsSold = [20.0, 4.0, 6.0, 3.0, 12.0, 16.0, 4.0, 18.0, 2.0, 4.0, 5.0, 4.0]
        
        
        setChart(months, values: unitsSold)
        
        if let city = currentCity, state = currentState {
        ConnectionManager.sharedManager.getGraphValues(city, state: state, type: currentType) { (avg) -> Void in
            
        }
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setChart(dataPoints: [String], values: [Double]) {
        
        var dataEntries: [BarChartDataEntry] = []
        var unsoldData: [BarChartDataEntry] = []
        for i in 0..<dataPoints.count {
            let dataEntry = BarChartDataEntry(value: values[i], xIndex: i)
            dataEntries.append(dataEntry)
        }
        
        for i in 0..<dataPoints.count {
            let entry = BarChartDataEntry(value: unitsNotSold[i], xIndex: i)
            unsoldData.append(entry)
        }
        
        let chartDataSet = BarChartDataSet(yVals: dataEntries, label: "Units Sold")
        let chartSecondDataSet = BarChartDataSet(yVals: unsoldData, label: "Unsold")
        let chartData = BarChartData(xVals: months, dataSets: [chartDataSet, chartSecondDataSet])
        barChartView.data = chartData
    }


}
