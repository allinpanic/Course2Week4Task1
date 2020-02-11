//
//  RadioViewController.swift
//  Course2Week4Task1
//
//  Copyright © 2018 e-Legion. All rights reserved.
//

import UIKit

class RadioViewController: UIViewController {
  
  let singer = "Aerosmith"
  let songName = "Hole In My Sole"
  
  private let songIconImage: UIImageView = {
    let image = UIImageView(image: UIImage(named: "albumImage"))
    image.translatesAutoresizingMaskIntoConstraints = false
    image.contentMode = .scaleAspectFill
    return image
  }()
  
  private lazy var songNameLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "\(singer) - \(songName)"
    label.font = .systemFont(ofSize: 22)
    label.sizeToFit()
    label.textColor = .black
    label.numberOfLines = 1
    label.textAlignment = .center
    return label
  }()
  
  private let songProgressBar: UIProgressView = {
    let progressView = UIProgressView()
    progressView.translatesAutoresizingMaskIntoConstraints = false
    progressView.progress = 0.5
    return progressView
  }()
  
  private let radioSlider: UISlider = {
    let slider = UISlider()
    slider.translatesAutoresizingMaskIntoConstraints = false
    slider.value = 0.5
    return slider
  }()
  
  let space = UILayoutGuide()
  
  lazy var regularHeightConstraints: [NSLayoutConstraint] = [
        songProgressBar.topAnchor.constraint(equalTo: songIconImage.bottomAnchor, constant: 30),
        songProgressBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
        songProgressBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
        
        songIconImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
        songIconImage.widthAnchor.constraint(equalTo: songIconImage.heightAnchor, multiplier: 1/1),
        songIconImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
        songIconImage.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
        
        space.topAnchor.constraint(equalTo: songProgressBar.bottomAnchor),
        space.bottomAnchor.constraint(equalTo: radioSlider.topAnchor),
        
        songNameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
        songNameLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
        songNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
        songNameLabel.centerYAnchor.constraint(equalTo: space.centerYAnchor),
        
        radioSlider.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
        radioSlider.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
        radioSlider.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -24),
        radioSlider.heightAnchor.constraint(equalToConstant: 31)
      ]
  
  lazy var compactHeightConstrants: [NSLayoutConstraint] = [
        songProgressBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
        songProgressBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
        songProgressBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
        songProgressBar.bottomAnchor.constraint(equalTo: songIconImage.topAnchor, constant: -16),
        songProgressBar.heightAnchor.constraint(equalToConstant: 2),
  
        songIconImage.bottomAnchor.constraint(equalTo: radioSlider.topAnchor, constant: -16),
        songIconImage.trailingAnchor.constraint(equalTo: songNameLabel.leadingAnchor, constant: 16),
        songIconImage.widthAnchor.constraint(equalTo: songIconImage.heightAnchor, multiplier: 1/1),
        songIconImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),

        space.topAnchor.constraint(equalTo: songProgressBar.bottomAnchor),
        space.bottomAnchor.constraint(equalTo: radioSlider.topAnchor),
  
        songNameLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
        songNameLabel.centerYAnchor.constraint(equalTo: space.centerYAnchor),
  
        radioSlider.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
        radioSlider.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
        radioSlider.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -24),
        radioSlider.heightAnchor.constraint(equalToConstant: 31)
      ]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.view.backgroundColor = .white
    view.addSubview(songProgressBar)
    view.addSubview(songIconImage)
    view.addSubview(songNameLabel)
    view.addSubview(radioSlider)
    view.addLayoutGuide(space)
    
    activateConstraints()
  }
  
  override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
    super.traitCollectionDidChange(previousTraitCollection)
    
    activateConstraints()
  }
}

extension RadioViewController {
  
  func activateConstraints() {
    if view.traitCollection.verticalSizeClass == .regular {
      NSLayoutConstraint.deactivate(compactHeightConstrants)
      NSLayoutConstraint.activate(regularHeightConstraints)
    } else {
      NSLayoutConstraint.deactivate(regularHeightConstraints)
      NSLayoutConstraint.activate(compactHeightConstrants)
    }
  }
}
