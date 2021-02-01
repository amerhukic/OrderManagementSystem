//
//  SystemTestViewController.swift
//  OrderManagementSystem
//
//  Created by Amer Hukić on 19. 1. 2021.
//

import UIKit

class SystemTestViewController: UIViewController {
  private let activityIndicator = UIActivityIndicatorView(style: .large)
  private let fifoSystemSimulationButton = UIButton(type: .system)
  private let matchedSystemSimulationButton = UIButton(type: .system)
  private let simulator = SystemSimulator()

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    setupActivityIndicator()
    setupButtons()
  }
}

// MARK: - Private methods
private extension SystemTestViewController {
  func setupActivityIndicator() {
    activityIndicator.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(activityIndicator)
    activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    activityIndicator.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80).isActive = true
  }
  
  func setupButtons() {
    fifoSystemSimulationButton.addTarget(self, action: #selector(fifoSystemSimulationButtonTapped), for: .touchUpInside)
    fifoSystemSimulationButton.setTitle("Start FIFO system simulation", for: .normal)
    fifoSystemSimulationButton.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(fifoSystemSimulationButton)
    fifoSystemSimulationButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    fifoSystemSimulationButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -30).isActive = true
    
    matchedSystemSimulationButton.addTarget(self, action: #selector(matchedSystemSimulationButtonTapped), for: .touchUpInside)
    matchedSystemSimulationButton.setTitle("Start Matched system simulation", for: .normal)
    matchedSystemSimulationButton.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(matchedSystemSimulationButton)
    matchedSystemSimulationButton.topAnchor.constraint(equalTo: fifoSystemSimulationButton.bottomAnchor, constant: 10).isActive = true
    matchedSystemSimulationButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
  }
  
  @objc func fifoSystemSimulationButtonTapped() {
    fifoSystemSimulationButton.isEnabled = false
    matchedSystemSimulationButton.isEnabled = false
    activityIndicator.startAnimating()
    simulator.startSystemSimulation(withPickupStrategy: .fifo) { [weak self] in
      DispatchQueue.main.async {
        self?.activityIndicator.stopAnimating()
        self?.fifoSystemSimulationButton.isEnabled = true
        self?.matchedSystemSimulationButton.isEnabled = true
        self?.showAlert(withTitle: "FIFO system simulation completed!")
      }
    }
  }
  
  @objc func matchedSystemSimulationButtonTapped() {
    fifoSystemSimulationButton.isEnabled = false
    matchedSystemSimulationButton.isEnabled = false
    activityIndicator.startAnimating()
    simulator.startSystemSimulation(withPickupStrategy: .matched) { [weak self] in
      DispatchQueue.main.async {
        self?.activityIndicator.stopAnimating()
        self?.fifoSystemSimulationButton.isEnabled = true
        self?.matchedSystemSimulationButton.isEnabled = true
        self?.showAlert(withTitle: "Matched system simulation completed!")
      }
    }
  }
  
  func showAlert(withTitle title: String) {
    let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
    let okAction = UIAlertAction(title: "OK", style: .default)
    alert.addAction(okAction)
    present(alert, animated: true, completion: nil)
  }
}
