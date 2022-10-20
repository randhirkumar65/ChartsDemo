//
//  Constants.swift
//  ChartDemo
//
//  Created by Randhir Kumar on 16/08/20.
//  Copyright © 2020 Randhir Kumar. All rights reserved.
//
import Charts

enum CellIdentifiersTypes: String {
    case chartsTableViewCell = "ChartsTableViewCell"
}

let kBarSequeId = "sequeToBarChart"
let kLineSequeId = "sequeToLineChart"
let kPieSequeId = "sequeToPieChart"
let kBubbleSequeId = "sequeToBubbleChart"
let kCandleStickSequeId = "sequeToCandleStickChart"

enum AnimationOptions: String, CaseIterable {
    case linear
    case easeInCubic
    case easeOutCubic
    case easeInOutCubic
    case easeInQuart
    case easeOutQuart
    case easeInOutQuart
    case easeInQuint
    case easeOutQuint
    case easeInOutQuint
    case easeInSine
    case easeOutSine
    case easeInOutSine
    case easeInExpo
    case easeOutExpo
    case easeInOutExpo
    case easeInCirc
    case easeOutCirc
    case easeInOutCirc
    case easeInElastic
    case easeOutElastic
    case easeInOutElastic
    case easeInBack
    case easeOutBack
    case easeInOutBack
    case easeInBounce
    case easeOutBounce
    case easeInOutBounce
}
