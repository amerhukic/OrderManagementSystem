<p align="center">
<img src="https://raw.githubusercontent.com/amerhukic/OrderManagementSystem/main/Logo.png" width="420" max-width="80%" alt="Logo" />
</p>

<p align="center">
    <img src="https://img.shields.io/badge/Swift-5-orange.svg" />
    <a href="">
        <img src="https://img.shields.io/badge/Licence-MIT-green.svg" alt="License">
    </a>
    <a href="https://twitter.com/hukicamer">
        <img src="https://img.shields.io/badge/contact-%40hukicamer-blue.svg?style=flat" alt="Twitter: @hukicamer" />
    </a>
</p>

This project showcases the implementation of an order management system used for management of delivery orders for a kitchen.

## System description

It's a real-time system that simulates the fulfillment of delivery orders for a kitchen. The system receives 2 delivery orders per second (defined in `dispatch_orders.json` in the project). Each order takes some time (defined as `prepTime`) to be prepared. Once an order is prepared, it is waiting and ready for courier pickup.

Upon receiving an order, the system immediately dispatches a courier to pick it up.
Couriers arrive randomly following a uniform distribution, 3-15 seconds after they’ve been dispatched. 
Couriers have to wait at the kitchen if the order they are picking up is not ready.
Once a courier picks up an order it is instantaneously delivered.

The system supports two courier dispatch strategies and evaluates their performance.
* Matched: a courier is dispatched for a specific order and may only pick up that order
* First-in-first-out: a courier picks up the next available order upon arrival. If there are multiple orders available, an arbitrary order is picked up. If there are no available orders, couriers wait for the next available one. When there are multiple couriers waiting, the next available order is assigned to the earliest arrived courier.

The system prints the statistics each time an order is picked up. After the system has finished processing all orders the following statistics are shown:
* Average food wait time (milliseconds) between order ready and pickup
* Average courier wait time (milliseconds) between arrival and order pickup

## Usage

The project was developed as an iOS app that is used to run the simulation. To run the project:
1. Open the `OrderManagementSystem.xcodeproj` file
2. Run the app in one of the simulators
3. The app will show 2 buttons that correspond to the 2 courier dispatch strategies - FIFO and matched.
4. Tap one of the buttons to run the simulation with the desired strategy.
5. The system will output events (order received, order prepared, courier dispatched, courier arrived, order picked up) in the Xcode console. Once the simulation finishes the average waiting time will be shown in the Xcode console.
