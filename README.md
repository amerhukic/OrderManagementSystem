# Order management system

The project was developed as an iOS app that is used to run the simulation. To run the project:
1. Open the `OrderManagementSystem.xcodeproj` file
2. Run the app in one of the simulators
3. The app will show 2 buttons that correspond to the 2 courier dispatch strategies - FIFO and matched.
4. Tap one of the buttons to run the simulation with the desired strategy. The `dispatch_orders.json` file, provided in the assignment, is embedded in the project and it is used for the simulation.
4. The system will output events (order received, order prepared, courier dispatched, courier arrived, order picked up) in the Xcode console. Once the simulation finishes the average waiting time will be shown in the Xcode console.
5. After the simulation ends you will be able to start another simulation by pressing one of the buttons.
