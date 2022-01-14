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

## Example output

For those who are interested in how the output looks like, here are some example runs:

<details> 
  <summary>
  
  ```
  FIFO strategy simulation
  ```
  
  </summary>
  
```
2022-01-14 09:22:09.722676+0100 OrderManagementSystem[9962:490547] -------------------------------------------------------------------------
2022-01-14 09:22:09.724332+0100 OrderManagementSystem[9962:490547] Starting First-in-first-out strategy order management system simulation
2022-01-14 09:22:09.724484+0100 OrderManagementSystem[9962:490547] -------------------------------------------------------------------------
2022-01-14 09:22:10.726732+0100 OrderManagementSystem[9962:490547] Order received
2022-01-14 09:22:10.730058+0100 OrderManagementSystem[9962:490547] Courier dispatched
2022-01-14 09:22:10.730569+0100 OrderManagementSystem[9962:490547] Order received
2022-01-14 09:22:10.730757+0100 OrderManagementSystem[9962:490547] Courier dispatched
2022-01-14 09:22:11.726352+0100 OrderManagementSystem[9962:490547] Order received
2022-01-14 09:22:11.726563+0100 OrderManagementSystem[9962:490547] Courier dispatched
2022-01-14 09:22:11.727309+0100 OrderManagementSystem[9962:490547] Order received
2022-01-14 09:22:11.727488+0100 OrderManagementSystem[9962:490547] Courier dispatched
2022-01-14 09:22:12.726664+0100 OrderManagementSystem[9962:490547] Order received
2022-01-14 09:22:12.726945+0100 OrderManagementSystem[9962:490547] Courier dispatched
2022-01-14 09:22:12.727485+0100 OrderManagementSystem[9962:490547] Order received
2022-01-14 09:22:12.727650+0100 OrderManagementSystem[9962:490547] Courier dispatched
2022-01-14 09:22:13.726609+0100 OrderManagementSystem[9962:490547] Order received
2022-01-14 09:22:13.726995+0100 OrderManagementSystem[9962:490547] Courier dispatched
2022-01-14 09:22:13.727531+0100 OrderManagementSystem[9962:490547] Order received
2022-01-14 09:22:13.727734+0100 OrderManagementSystem[9962:490547] Courier dispatched
2022-01-14 09:22:13.730411+0100 OrderManagementSystem[9962:490547] Courier arrived
2022-01-14 09:22:14.726487+0100 OrderManagementSystem[9962:490547] Order received
2022-01-14 09:22:14.726754+0100 OrderManagementSystem[9962:490547] Courier dispatched
2022-01-14 09:22:14.727442+0100 OrderManagementSystem[9962:490547] Order received
2022-01-14 09:22:14.727656+0100 OrderManagementSystem[9962:490547] Courier dispatched
2022-01-14 09:22:15.126389+0100 OrderManagementSystem[9962:495944] Order prepared
2022-01-14 09:22:15.126971+0100 OrderManagementSystem[9962:495944] Courier arrived
2022-01-14 09:22:15.127508+0100 OrderManagementSystem[9962:495944] Order picked up
2022-01-14 09:22:15.127986+0100 OrderManagementSystem[9962:495944] Courier wait time: 1396 ms
2022-01-14 09:22:15.726234+0100 OrderManagementSystem[9962:495944] Order received
2022-01-14 09:22:15.726615+0100 OrderManagementSystem[9962:495944] Courier dispatched
2022-01-14 09:22:15.727072+0100 OrderManagementSystem[9962:495944] Order received
2022-01-14 09:22:15.727248+0100 OrderManagementSystem[9962:495944] Courier dispatched
2022-01-14 09:22:16.726249+0100 OrderManagementSystem[9962:495796] Order received
2022-01-14 09:22:16.726394+0100 OrderManagementSystem[9962:495796] Courier dispatched
2022-01-14 09:22:16.726785+0100 OrderManagementSystem[9962:495796] Order received
2022-01-14 09:22:16.726911+0100 OrderManagementSystem[9962:495796] Courier dispatched
2022-01-14 09:22:17.726929+0100 OrderManagementSystem[9962:490547] Order prepared
2022-01-14 09:22:17.727625+0100 OrderManagementSystem[9962:490547] Order received
2022-01-14 09:22:17.728160+0100 OrderManagementSystem[9962:490547] Order prepared
2022-01-14 09:22:17.728622+0100 OrderManagementSystem[9962:490547] Order picked up
2022-01-14 09:22:17.729091+0100 OrderManagementSystem[9962:490547] Courier wait time: 2601 ms
2022-01-14 09:22:17.729265+0100 OrderManagementSystem[9962:490547] Courier dispatched
2022-01-14 09:22:17.729724+0100 OrderManagementSystem[9962:490547] Order received
2022-01-14 09:22:17.729875+0100 OrderManagementSystem[9962:490547] Courier dispatched
2022-01-14 09:22:18.726464+0100 OrderManagementSystem[9962:495796] Order received
2022-01-14 09:22:18.726678+0100 OrderManagementSystem[9962:495796] Courier dispatched
2022-01-14 09:22:18.727217+0100 OrderManagementSystem[9962:495796] Order received
2022-01-14 09:22:18.727417+0100 OrderManagementSystem[9962:495796] Courier dispatched
2022-01-14 09:22:18.727730+0100 OrderManagementSystem[9962:495796] Courier arrived
2022-01-14 09:22:18.728075+0100 OrderManagementSystem[9962:495796] Order prepared
2022-01-14 09:22:18.728397+0100 OrderManagementSystem[9962:495796] Order picked up
2022-01-14 09:22:18.728751+0100 OrderManagementSystem[9962:495796] Food wait time: 999 ms
2022-01-14 09:22:19.726572+0100 OrderManagementSystem[9962:490547] Order received
2022-01-14 09:22:19.726862+0100 OrderManagementSystem[9962:490547] Courier dispatched
2022-01-14 09:22:19.727480+0100 OrderManagementSystem[9962:490547] Order received
2022-01-14 09:22:19.727758+0100 OrderManagementSystem[9962:490547] Courier dispatched
2022-01-14 09:22:19.728321+0100 OrderManagementSystem[9962:490547] Order prepared
2022-01-14 09:22:20.726654+0100 OrderManagementSystem[9962:490547] Order received
2022-01-14 09:22:20.726932+0100 OrderManagementSystem[9962:490547] Courier dispatched
2022-01-14 09:22:20.727516+0100 OrderManagementSystem[9962:490547] Order received
2022-01-14 09:22:20.727732+0100 OrderManagementSystem[9962:490547] Courier dispatched
2022-01-14 09:22:20.728087+0100 OrderManagementSystem[9962:490547] Order prepared
2022-01-14 09:22:21.726559+0100 OrderManagementSystem[9962:490547] Order received
2022-01-14 09:22:21.726773+0100 OrderManagementSystem[9962:490547] Courier dispatched
2022-01-14 09:22:21.727319+0100 OrderManagementSystem[9962:490547] Order received
2022-01-14 09:22:21.727504+0100 OrderManagementSystem[9962:490547] Courier dispatched
2022-01-14 09:22:21.727835+0100 OrderManagementSystem[9962:490547] Order prepared
2022-01-14 09:22:22.121591+0100 OrderManagementSystem[9962:496021] Courier arrived
2022-01-14 09:22:22.121995+0100 OrderManagementSystem[9962:496021] Order picked up
2022-01-14 09:22:22.122278+0100 OrderManagementSystem[9962:496021] Food wait time: 3395 ms
2022-01-14 09:22:22.726661+0100 OrderManagementSystem[9962:496021] Order received
2022-01-14 09:22:22.726937+0100 OrderManagementSystem[9962:496021] Courier dispatched
2022-01-14 09:22:22.727646+0100 OrderManagementSystem[9962:496021] Order received
2022-01-14 09:22:22.727841+0100 OrderManagementSystem[9962:496021] Courier dispatched
2022-01-14 09:22:22.728241+0100 OrderManagementSystem[9962:496021] Courier arrived
2022-01-14 09:22:22.728730+0100 OrderManagementSystem[9962:496021] Courier arrived
2022-01-14 09:22:22.729136+0100 OrderManagementSystem[9962:496021] Order prepared
2022-01-14 09:22:22.729526+0100 OrderManagementSystem[9962:496021] Order picked up
2022-01-14 09:22:22.729888+0100 OrderManagementSystem[9962:496021] Food wait time: 3001 ms
2022-01-14 09:22:22.730195+0100 OrderManagementSystem[9962:496021] Order picked up
2022-01-14 09:22:22.730490+0100 OrderManagementSystem[9962:496021] Food wait time: 2000 ms
2022-01-14 09:22:23.726480+0100 OrderManagementSystem[9962:495944] Order received
2022-01-14 09:22:23.726692+0100 OrderManagementSystem[9962:495944] Courier dispatched
2022-01-14 09:22:23.727136+0100 OrderManagementSystem[9962:495944] Order received
2022-01-14 09:22:23.727276+0100 OrderManagementSystem[9962:495944] Courier dispatched
2022-01-14 09:22:23.727700+0100 OrderManagementSystem[9962:495944] Order prepared
2022-01-14 09:22:23.728097+0100 OrderManagementSystem[9962:495944] Courier arrived
2022-01-14 09:22:23.728550+0100 OrderManagementSystem[9962:495944] Order prepared
2022-01-14 09:22:23.728991+0100 OrderManagementSystem[9962:495944] Order prepared
2022-01-14 09:22:23.729407+0100 OrderManagementSystem[9962:495944] Order picked up
2022-01-14 09:22:23.729831+0100 OrderManagementSystem[9962:495944] Food wait time: 2000 ms
2022-01-14 09:22:24.026452+0100 OrderManagementSystem[9962:490547] Courier arrived
2022-01-14 09:22:24.027052+0100 OrderManagementSystem[9962:490547] Order prepared
2022-01-14 09:22:24.027647+0100 OrderManagementSystem[9962:490547] Order picked up
2022-01-14 09:22:24.028011+0100 OrderManagementSystem[9962:490547] Food wait time: 1299 ms
2022-01-14 09:22:24.726567+0100 OrderManagementSystem[9962:490547] Order received
2022-01-14 09:22:24.726829+0100 OrderManagementSystem[9962:490547] Courier dispatched
2022-01-14 09:22:24.727352+0100 OrderManagementSystem[9962:490547] Order received
2022-01-14 09:22:24.727771+0100 OrderManagementSystem[9962:490547] Order prepared
2022-01-14 09:22:24.727920+0100 OrderManagementSystem[9962:490547] Courier dispatched
2022-01-14 09:22:24.728280+0100 OrderManagementSystem[9962:490547] Courier arrived
2022-01-14 09:22:24.728658+0100 OrderManagementSystem[9962:490547] Order picked up
2022-01-14 09:22:24.728978+0100 OrderManagementSystem[9962:490547] Food wait time: 1000 ms
2022-01-14 09:22:25.726739+0100 OrderManagementSystem[9962:490547] Order received
2022-01-14 09:22:25.727111+0100 OrderManagementSystem[9962:490547] Courier dispatched
2022-01-14 09:22:25.727763+0100 OrderManagementSystem[9962:490547] Order received
2022-01-14 09:22:25.727948+0100 OrderManagementSystem[9962:490547] Courier dispatched
2022-01-14 09:22:25.728460+0100 OrderManagementSystem[9962:490547] Order prepared
2022-01-14 09:22:25.728969+0100 OrderManagementSystem[9962:490547] Courier arrived
2022-01-14 09:22:25.729349+0100 OrderManagementSystem[9962:490547] Courier arrived
2022-01-14 09:22:25.729793+0100 OrderManagementSystem[9962:490547] Order picked up
2022-01-14 09:22:25.730144+0100 OrderManagementSystem[9962:490547] Food wait time: 2001 ms
2022-01-14 09:22:25.730449+0100 OrderManagementSystem[9962:490547] Order picked up
2022-01-14 09:22:25.730736+0100 OrderManagementSystem[9962:490547] Food wait time: 2001 ms
2022-01-14 09:22:25.964362+0100 OrderManagementSystem[9962:495796] Order prepared
2022-01-14 09:22:26.726888+0100 OrderManagementSystem[9962:496021] Order received
2022-01-14 09:22:26.727595+0100 OrderManagementSystem[9962:496021] Courier arrived
2022-01-14 09:22:26.728060+0100 OrderManagementSystem[9962:496021] Order prepared
2022-01-14 09:22:26.728430+0100 OrderManagementSystem[9962:496021] Order prepared
2022-01-14 09:22:26.728787+0100 OrderManagementSystem[9962:496021] Order picked up
2022-01-14 09:22:26.729246+0100 OrderManagementSystem[9962:496021] Food wait time: 2701 ms
2022-01-14 09:22:26.729383+0100 OrderManagementSystem[9962:496021] Courier dispatched
2022-01-14 09:22:26.729687+0100 OrderManagementSystem[9962:496021] Order received
2022-01-14 09:22:26.729818+0100 OrderManagementSystem[9962:496021] Courier dispatched
2022-01-14 09:22:27.726597+0100 OrderManagementSystem[9962:496021] Order received
2022-01-14 09:22:27.726861+0100 OrderManagementSystem[9962:496021] Courier dispatched
2022-01-14 09:22:27.727507+0100 OrderManagementSystem[9962:496021] Order received
2022-01-14 09:22:27.727739+0100 OrderManagementSystem[9962:496021] Courier dispatched
2022-01-14 09:22:27.728125+0100 OrderManagementSystem[9962:496021] Courier arrived
2022-01-14 09:22:27.728521+0100 OrderManagementSystem[9962:496021] Order picked up
2022-01-14 09:22:27.728832+0100 OrderManagementSystem[9962:496021] Food wait time: 3000 ms
2022-01-14 09:22:27.729191+0100 OrderManagementSystem[9962:496021] Courier arrived
2022-01-14 09:22:27.729522+0100 OrderManagementSystem[9962:496021] Courier arrived
2022-01-14 09:22:27.729790+0100 OrderManagementSystem[9962:496021] Courier arrived
2022-01-14 09:22:27.730061+0100 OrderManagementSystem[9962:496021] Order picked up
2022-01-14 09:22:27.730344+0100 OrderManagementSystem[9962:496021] Food wait time: 1999 ms
2022-01-14 09:22:27.730613+0100 OrderManagementSystem[9962:496021] Courier arrived
2022-01-14 09:22:27.730889+0100 OrderManagementSystem[9962:496021] Order picked up
2022-01-14 09:22:27.731132+0100 OrderManagementSystem[9962:496021] Food wait time: 1762 ms
2022-01-14 09:22:27.737272+0100 OrderManagementSystem[9962:496021] Order picked up
2022-01-14 09:22:27.737572+0100 OrderManagementSystem[9962:496021] Food wait time: 999 ms
2022-01-14 09:22:27.737869+0100 OrderManagementSystem[9962:496021] Order picked up
2022-01-14 09:22:27.738116+0100 OrderManagementSystem[9962:496021] Food wait time: 999 ms
2022-01-14 09:22:28.225266+0100 OrderManagementSystem[9962:496021] Order prepared
2022-01-14 09:22:28.225970+0100 OrderManagementSystem[9962:496021] Courier arrived
2022-01-14 09:22:28.226412+0100 OrderManagementSystem[9962:496021] Order picked up
2022-01-14 09:22:28.226847+0100 OrderManagementSystem[9962:496021] Food wait time: 0 ms
2022-01-14 09:22:28.725775+0100 OrderManagementSystem[9962:496021] Order received
2022-01-14 09:22:28.726014+0100 OrderManagementSystem[9962:496021] Courier dispatched
2022-01-14 09:22:28.726520+0100 OrderManagementSystem[9962:496021] Order received
2022-01-14 09:22:28.726676+0100 OrderManagementSystem[9962:496021] Courier dispatched
2022-01-14 09:22:29.024921+0100 OrderManagementSystem[9962:495944] Order prepared
2022-01-14 09:22:29.025327+0100 OrderManagementSystem[9962:495944] Order prepared
2022-01-14 09:22:29.025715+0100 OrderManagementSystem[9962:495944] Order prepared
2022-01-14 09:22:29.026040+0100 OrderManagementSystem[9962:495944] Courier arrived
2022-01-14 09:22:29.026389+0100 OrderManagementSystem[9962:495944] Courier arrived
2022-01-14 09:22:29.026712+0100 OrderManagementSystem[9962:495944] Order prepared
2022-01-14 09:22:29.026990+0100 OrderManagementSystem[9962:495944] Order picked up
2022-01-14 09:22:29.027330+0100 OrderManagementSystem[9962:495944] Food wait time: 0 ms
2022-01-14 09:22:29.027646+0100 OrderManagementSystem[9962:495944] Order picked up
2022-01-14 09:22:29.027917+0100 OrderManagementSystem[9962:495944] Food wait time: 0 ms
2022-01-14 09:22:29.726558+0100 OrderManagementSystem[9962:495944] Order received
2022-01-14 09:22:29.726922+0100 OrderManagementSystem[9962:495944] Courier dispatched
2022-01-14 09:22:29.727515+0100 OrderManagementSystem[9962:495944] Order received
2022-01-14 09:22:29.727702+0100 OrderManagementSystem[9962:495944] Courier dispatched
2022-01-14 09:22:29.728266+0100 OrderManagementSystem[9962:495944] Courier arrived
2022-01-14 09:22:29.728747+0100 OrderManagementSystem[9962:495944] Order picked up
2022-01-14 09:22:29.729157+0100 OrderManagementSystem[9962:495944] Food wait time: 701 ms
2022-01-14 09:22:30.726215+0100 OrderManagementSystem[9962:495944] Order received
2022-01-14 09:22:30.726366+0100 OrderManagementSystem[9962:495944] Courier dispatched
2022-01-14 09:22:30.726739+0100 OrderManagementSystem[9962:495944] Order received
2022-01-14 09:22:30.726865+0100 OrderManagementSystem[9962:495944] Courier dispatched
2022-01-14 09:22:30.727212+0100 OrderManagementSystem[9962:495944] Courier arrived
2022-01-14 09:22:30.727574+0100 OrderManagementSystem[9962:495944] Order prepared
2022-01-14 09:22:30.727942+0100 OrderManagementSystem[9962:495944] Order picked up
2022-01-14 09:22:30.728248+0100 OrderManagementSystem[9962:495944] Food wait time: 1701 ms
2022-01-14 09:22:31.026289+0100 OrderManagementSystem[9962:496620] Order prepared
2022-01-14 09:22:31.026935+0100 OrderManagementSystem[9962:496620] Courier arrived
2022-01-14 09:22:31.027432+0100 OrderManagementSystem[9962:496620] Courier arrived
2022-01-14 09:22:31.027830+0100 OrderManagementSystem[9962:496620] Order picked up
2022-01-14 09:22:31.028274+0100 OrderManagementSystem[9962:496620] Food wait time: 300 ms
2022-01-14 09:22:31.028651+0100 OrderManagementSystem[9962:496620] Order prepared
2022-01-14 09:22:31.029002+0100 OrderManagementSystem[9962:496620] Order prepared
2022-01-14 09:22:31.029328+0100 OrderManagementSystem[9962:496620] Courier arrived
2022-01-14 09:22:31.029576+0100 OrderManagementSystem[9962:496620] Order picked up
2022-01-14 09:22:31.029839+0100 OrderManagementSystem[9962:496620] Food wait time: 0 ms
2022-01-14 09:22:31.030087+0100 OrderManagementSystem[9962:496620] Order picked up
2022-01-14 09:22:31.030313+0100 OrderManagementSystem[9962:496620] Food wait time: 0 ms
2022-01-14 09:22:31.726525+0100 OrderManagementSystem[9962:496620] Order received
2022-01-14 09:22:31.726884+0100 OrderManagementSystem[9962:496620] Courier dispatched
2022-01-14 09:22:31.727479+0100 OrderManagementSystem[9962:496620] Order received
2022-01-14 09:22:31.727649+0100 OrderManagementSystem[9962:496620] Courier dispatched
2022-01-14 09:22:31.728205+0100 OrderManagementSystem[9962:496620] Courier arrived
2022-01-14 09:22:31.728676+0100 OrderManagementSystem[9962:496620] Order picked up
2022-01-14 09:22:31.729108+0100 OrderManagementSystem[9962:496620] Food wait time: 700 ms
2022-01-14 09:22:32.225689+0100 OrderManagementSystem[9962:496161] Order prepared
2022-01-14 09:22:32.226379+0100 OrderManagementSystem[9962:496161] Order prepared
2022-01-14 09:22:32.226738+0100 OrderManagementSystem[9962:496161] Courier arrived
2022-01-14 09:22:32.227075+0100 OrderManagementSystem[9962:496161] Order prepared
2022-01-14 09:22:32.227417+0100 OrderManagementSystem[9962:496161] Order picked up
2022-01-14 09:22:32.227784+0100 OrderManagementSystem[9962:496161] Food wait time: 0 ms
2022-01-14 09:22:32.726365+0100 OrderManagementSystem[9962:496161] Order received
2022-01-14 09:22:32.726580+0100 OrderManagementSystem[9962:496161] Courier dispatched
2022-01-14 09:22:32.727196+0100 OrderManagementSystem[9962:496161] Order received
2022-01-14 09:22:32.727445+0100 OrderManagementSystem[9962:496161] Courier dispatched
2022-01-14 09:22:33.512681+0100 OrderManagementSystem[9962:496021] Order prepared
2022-01-14 09:22:33.726455+0100 OrderManagementSystem[9962:496021] Order received
2022-01-14 09:22:33.726710+0100 OrderManagementSystem[9962:496021] Courier dispatched
2022-01-14 09:22:33.727236+0100 OrderManagementSystem[9962:496021] Order received
2022-01-14 09:22:33.727465+0100 OrderManagementSystem[9962:496021] Courier dispatched
2022-01-14 09:22:34.326565+0100 OrderManagementSystem[9962:490547] Order prepared
2022-01-14 09:22:34.327250+0100 OrderManagementSystem[9962:490547] Order prepared
2022-01-14 09:22:34.327876+0100 OrderManagementSystem[9962:490547] Order prepared
2022-01-14 09:22:34.328267+0100 OrderManagementSystem[9962:490547] Order prepared
2022-01-14 09:22:34.726532+0100 OrderManagementSystem[9962:490547] Order received
2022-01-14 09:22:34.726769+0100 OrderManagementSystem[9962:490547] Courier dispatched
2022-01-14 09:22:34.727333+0100 OrderManagementSystem[9962:490547] Order received
2022-01-14 09:22:34.727500+0100 OrderManagementSystem[9962:490547] Courier dispatched
2022-01-14 09:22:34.727921+0100 OrderManagementSystem[9962:490547] Courier arrived
2022-01-14 09:22:34.728369+0100 OrderManagementSystem[9962:490547] Order prepared
2022-01-14 09:22:34.728782+0100 OrderManagementSystem[9962:490547] Order picked up
2022-01-14 09:22:34.729108+0100 OrderManagementSystem[9962:490547] Food wait time: 2501 ms
2022-01-14 09:22:35.526501+0100 OrderManagementSystem[9962:496161] Courier arrived
2022-01-14 09:22:35.527179+0100 OrderManagementSystem[9962:496161] Courier arrived
2022-01-14 09:22:35.527804+0100 OrderManagementSystem[9962:496161] Order prepared
2022-01-14 09:22:35.528290+0100 OrderManagementSystem[9962:496161] Courier arrived
2022-01-14 09:22:35.528714+0100 OrderManagementSystem[9962:496161] Order picked up
2022-01-14 09:22:35.529166+0100 OrderManagementSystem[9962:496161] Food wait time: 3301 ms
2022-01-14 09:22:35.529507+0100 OrderManagementSystem[9962:496161] Order picked up
2022-01-14 09:22:35.529852+0100 OrderManagementSystem[9962:496161] Food wait time: 2014 ms
2022-01-14 09:22:35.530173+0100 OrderManagementSystem[9962:496161] Order picked up
2022-01-14 09:22:35.530456+0100 OrderManagementSystem[9962:496161] Food wait time: 1200 ms
2022-01-14 09:22:35.726674+0100 OrderManagementSystem[9962:496161] Order received
2022-01-14 09:22:35.727062+0100 OrderManagementSystem[9962:496161] Courier dispatched
2022-01-14 09:22:35.727729+0100 OrderManagementSystem[9962:496161] Order received
2022-01-14 09:22:35.727929+0100 OrderManagementSystem[9962:496161] Courier dispatched
2022-01-14 09:22:35.728561+0100 OrderManagementSystem[9962:496161] Order prepared
2022-01-14 09:22:36.726529+0100 OrderManagementSystem[9962:496161] Order received
2022-01-14 09:22:36.726748+0100 OrderManagementSystem[9962:496161] Courier dispatched
2022-01-14 09:22:36.727229+0100 OrderManagementSystem[9962:496161] Order received
2022-01-14 09:22:36.727374+0100 OrderManagementSystem[9962:496161] Courier dispatched
2022-01-14 09:22:36.727746+0100 OrderManagementSystem[9962:496161] Courier arrived
2022-01-14 09:22:36.728041+0100 OrderManagementSystem[9962:496161] Order picked up
2022-01-14 09:22:36.728332+0100 OrderManagementSystem[9962:496161] Food wait time: 2400 ms
2022-01-14 09:22:37.726652+0100 OrderManagementSystem[9962:496161] Order received
2022-01-14 09:22:37.726871+0100 OrderManagementSystem[9962:496161] Courier dispatched
2022-01-14 09:22:37.727389+0100 OrderManagementSystem[9962:496161] Order received
2022-01-14 09:22:37.727564+0100 OrderManagementSystem[9962:496161] Courier dispatched
2022-01-14 09:22:37.728100+0100 OrderManagementSystem[9962:496161] Order prepared
2022-01-14 09:22:37.728664+0100 OrderManagementSystem[9962:496161] Courier arrived
2022-01-14 09:22:37.729111+0100 OrderManagementSystem[9962:496161] Courier arrived
2022-01-14 09:22:37.729463+0100 OrderManagementSystem[9962:496161] Order picked up
2022-01-14 09:22:37.729780+0100 OrderManagementSystem[9962:496161] Food wait time: 3400 ms
2022-01-14 09:22:37.730078+0100 OrderManagementSystem[9962:496161] Order picked up
2022-01-14 09:22:37.730401+0100 OrderManagementSystem[9962:496161] Food wait time: 3400 ms
2022-01-14 09:22:38.726169+0100 OrderManagementSystem[9962:496161] Order received
2022-01-14 09:22:38.726355+0100 OrderManagementSystem[9962:496161] Courier dispatched
2022-01-14 09:22:38.726840+0100 OrderManagementSystem[9962:496161] Order received
2022-01-14 09:22:38.727052+0100 OrderManagementSystem[9962:496161] Courier dispatched
2022-01-14 09:22:38.727462+0100 OrderManagementSystem[9962:496161] Courier arrived
2022-01-14 09:22:38.727894+0100 OrderManagementSystem[9962:496161] Order prepared
2022-01-14 09:22:38.728226+0100 OrderManagementSystem[9962:496161] Courier arrived
2022-01-14 09:22:38.728516+0100 OrderManagementSystem[9962:496161] Order picked up
2022-01-14 09:22:38.728796+0100 OrderManagementSystem[9962:496161] Food wait time: 4000 ms
2022-01-14 09:22:38.729066+0100 OrderManagementSystem[9962:496161] Order picked up
2022-01-14 09:22:38.729282+0100 OrderManagementSystem[9962:496161] Food wait time: 3200 ms
2022-01-14 09:22:39.425605+0100 OrderManagementSystem[9962:496620] Order prepared
2022-01-14 09:22:39.426221+0100 OrderManagementSystem[9962:496620] Courier arrived
2022-01-14 09:22:39.426627+0100 OrderManagementSystem[9962:496620] Order picked up
2022-01-14 09:22:39.426960+0100 OrderManagementSystem[9962:496620] Food wait time: 3699 ms
2022-01-14 09:22:39.726548+0100 OrderManagementSystem[9962:496620] Order received
2022-01-14 09:22:39.726891+0100 OrderManagementSystem[9962:496620] Courier dispatched
2022-01-14 09:22:39.727371+0100 OrderManagementSystem[9962:496620] Order received
2022-01-14 09:22:39.727535+0100 OrderManagementSystem[9962:496620] Courier dispatched
2022-01-14 09:22:40.026288+0100 OrderManagementSystem[9962:495944] Courier arrived
2022-01-14 09:22:40.026851+0100 OrderManagementSystem[9962:495944] Courier arrived
2022-01-14 09:22:40.027221+0100 OrderManagementSystem[9962:495944] Courier arrived
2022-01-14 09:22:40.027803+0100 OrderManagementSystem[9962:495944] Order picked up
2022-01-14 09:22:40.028210+0100 OrderManagementSystem[9962:495944] Food wait time: 2300 ms
2022-01-14 09:22:40.028624+0100 OrderManagementSystem[9962:495944] Order picked up
2022-01-14 09:22:40.028935+0100 OrderManagementSystem[9962:495944] Food wait time: 1300 ms
2022-01-14 09:22:40.029247+0100 OrderManagementSystem[9962:495944] Order picked up
2022-01-14 09:22:40.029539+0100 OrderManagementSystem[9962:495944] Food wait time: 601 ms
2022-01-14 09:22:40.726364+0100 OrderManagementSystem[9962:495944] Order received
2022-01-14 09:22:40.726625+0100 OrderManagementSystem[9962:495944] Courier dispatched
2022-01-14 09:22:40.727276+0100 OrderManagementSystem[9962:495944] Order received
2022-01-14 09:22:40.727502+0100 OrderManagementSystem[9962:495944] Courier dispatched
2022-01-14 09:22:41.226292+0100 OrderManagementSystem[9962:496161] Courier arrived
2022-01-14 09:22:41.226888+0100 OrderManagementSystem[9962:496161] Courier arrived
2022-01-14 09:22:41.227357+0100 OrderManagementSystem[9962:496161] Order prepared
2022-01-14 09:22:41.227670+0100 OrderManagementSystem[9962:496161] Courier arrived
2022-01-14 09:22:41.228035+0100 OrderManagementSystem[9962:496161] Courier arrived
2022-01-14 09:22:41.228336+0100 OrderManagementSystem[9962:496161] Order picked up
2022-01-14 09:22:41.228608+0100 OrderManagementSystem[9962:496161] Courier wait time: 0 ms
2022-01-14 09:22:41.726229+0100 OrderManagementSystem[9962:496161] Order received
2022-01-14 09:22:41.726447+0100 OrderManagementSystem[9962:496161] Courier dispatched
2022-01-14 09:22:41.726922+0100 OrderManagementSystem[9962:496161] Order received
2022-01-14 09:22:41.727147+0100 OrderManagementSystem[9962:496161] Courier dispatched
2022-01-14 09:22:41.727698+0100 OrderManagementSystem[9962:496161] Order prepared
2022-01-14 09:22:41.728110+0100 OrderManagementSystem[9962:496161] Order prepared
2022-01-14 09:22:41.728492+0100 OrderManagementSystem[9962:496161] Order picked up
2022-01-14 09:22:41.728867+0100 OrderManagementSystem[9962:496161] Courier wait time: 500 ms
2022-01-14 09:22:41.729210+0100 OrderManagementSystem[9962:496161] Order picked up
2022-01-14 09:22:41.729575+0100 OrderManagementSystem[9962:496161] Courier wait time: 500 ms
2022-01-14 09:22:42.013906+0100 OrderManagementSystem[9962:495796] Courier arrived
2022-01-14 09:22:42.014373+0100 OrderManagementSystem[9962:495796] Order prepared
2022-01-14 09:22:42.014793+0100 OrderManagementSystem[9962:495796] Order prepared
2022-01-14 09:22:42.015221+0100 OrderManagementSystem[9962:495796] Order picked up
2022-01-14 09:22:42.015635+0100 OrderManagementSystem[9962:495796] Courier wait time: 788 ms
2022-01-14 09:22:42.016043+0100 OrderManagementSystem[9962:495796] Order picked up
2022-01-14 09:22:42.016425+0100 OrderManagementSystem[9962:495796] Courier wait time: 0 ms
2022-01-14 09:22:42.726886+0100 OrderManagementSystem[9962:496161] Courier arrived
2022-01-14 09:22:42.727376+0100 OrderManagementSystem[9962:496161] Order received
2022-01-14 09:22:42.727789+0100 OrderManagementSystem[9962:496161] Courier arrived
2022-01-14 09:22:42.728215+0100 OrderManagementSystem[9962:496161] Courier arrived
2022-01-14 09:22:42.728589+0100 OrderManagementSystem[9962:496161] Courier arrived
2022-01-14 09:22:42.728753+0100 OrderManagementSystem[9962:496161] Courier dispatched
2022-01-14 09:22:42.729114+0100 OrderManagementSystem[9962:496161] Order received
2022-01-14 09:22:42.729276+0100 OrderManagementSystem[9962:496161] Courier dispatched
2022-01-14 09:22:43.726488+0100 OrderManagementSystem[9962:496161] Order received
2022-01-14 09:22:43.726771+0100 OrderManagementSystem[9962:496161] Courier dispatched
2022-01-14 09:22:43.727302+0100 OrderManagementSystem[9962:496161] Order received
2022-01-14 09:22:43.727505+0100 OrderManagementSystem[9962:496161] Courier dispatched
2022-01-14 09:22:44.726492+0100 OrderManagementSystem[9962:496161] Order received
2022-01-14 09:22:44.726773+0100 OrderManagementSystem[9962:496161] Courier dispatched
2022-01-14 09:22:44.727323+0100 OrderManagementSystem[9962:496161] Order received
2022-01-14 09:22:44.727512+0100 OrderManagementSystem[9962:496161] Courier dispatched
2022-01-14 09:22:44.728070+0100 OrderManagementSystem[9962:496161] Order prepared
2022-01-14 09:22:44.728581+0100 OrderManagementSystem[9962:496161] Order prepared
2022-01-14 09:22:44.729000+0100 OrderManagementSystem[9962:496161] Order prepared
2022-01-14 09:22:44.729448+0100 OrderManagementSystem[9962:496161] Order picked up
2022-01-14 09:22:44.729758+0100 OrderManagementSystem[9962:496161] Courier wait time: 2000 ms
2022-01-14 09:22:44.730044+0100 OrderManagementSystem[9962:496161] Order picked up
2022-01-14 09:22:44.730375+0100 OrderManagementSystem[9962:496161] Courier wait time: 2000 ms
2022-01-14 09:22:44.730649+0100 OrderManagementSystem[9962:496161] Order picked up
2022-01-14 09:22:44.730911+0100 OrderManagementSystem[9962:496161] Courier wait time: 2000 ms
2022-01-14 09:22:45.706293+0100 OrderManagementSystem[9962:495944] Order prepared
2022-01-14 09:22:45.706931+0100 OrderManagementSystem[9962:495944] Courier arrived
2022-01-14 09:22:45.707311+0100 OrderManagementSystem[9962:495944] Order picked up
2022-01-14 09:22:45.707673+0100 OrderManagementSystem[9962:495944] Courier wait time: 2979 ms
2022-01-14 09:22:45.708045+0100 OrderManagementSystem[9962:495944] Courier arrived
2022-01-14 09:22:45.726231+0100 OrderManagementSystem[9962:495944] Order received
2022-01-14 09:22:45.726438+0100 OrderManagementSystem[9962:495944] Courier dispatched
2022-01-14 09:22:45.726874+0100 OrderManagementSystem[9962:495944] Order received
2022-01-14 09:22:45.727037+0100 OrderManagementSystem[9962:495944] Courier dispatched
2022-01-14 09:22:46.123206+0100 OrderManagementSystem[9962:495796] Courier arrived
2022-01-14 09:22:46.123834+0100 OrderManagementSystem[9962:495796] Order prepared
2022-01-14 09:22:46.124240+0100 OrderManagementSystem[9962:495796] Order prepared
2022-01-14 09:22:46.124606+0100 OrderManagementSystem[9962:495796] Courier arrived
2022-01-14 09:22:46.124958+0100 OrderManagementSystem[9962:495796] Order picked up
2022-01-14 09:22:46.125331+0100 OrderManagementSystem[9962:495796] Courier wait time: 417 ms
2022-01-14 09:22:46.125763+0100 OrderManagementSystem[9962:495796] Order prepared
2022-01-14 09:22:46.126166+0100 OrderManagementSystem[9962:495796] Order prepared
2022-01-14 09:22:46.126498+0100 OrderManagementSystem[9962:495796] Order picked up
2022-01-14 09:22:46.126803+0100 OrderManagementSystem[9962:495796] Courier wait time: 417 ms
2022-01-14 09:22:46.127169+0100 OrderManagementSystem[9962:495796] Order picked up
2022-01-14 09:22:46.127516+0100 OrderManagementSystem[9962:495796] Courier wait time: 0 ms
2022-01-14 09:22:46.127857+0100 OrderManagementSystem[9962:495796] Order picked up
2022-01-14 09:22:46.128147+0100 OrderManagementSystem[9962:495796] Courier wait time: 0 ms
2022-01-14 09:22:46.726306+0100 OrderManagementSystem[9962:495796] Order received
2022-01-14 09:22:46.726551+0100 OrderManagementSystem[9962:495796] Courier dispatched
2022-01-14 09:22:46.727030+0100 OrderManagementSystem[9962:495796] Order received
2022-01-14 09:22:46.727195+0100 OrderManagementSystem[9962:495796] Courier dispatched
2022-01-14 09:22:47.025221+0100 OrderManagementSystem[9962:496161] Courier arrived
2022-01-14 09:22:47.025618+0100 OrderManagementSystem[9962:496161] Courier arrived
2022-01-14 09:22:47.026020+0100 OrderManagementSystem[9962:496161] Order prepared
2022-01-14 09:22:47.026372+0100 OrderManagementSystem[9962:496161] Courier arrived
2022-01-14 09:22:47.026739+0100 OrderManagementSystem[9962:496161] Order picked up
2022-01-14 09:22:47.027078+0100 OrderManagementSystem[9962:496161] Courier wait time: 0 ms
2022-01-14 09:22:47.726355+0100 OrderManagementSystem[9962:496621] Order received
2022-01-14 09:22:47.726623+0100 OrderManagementSystem[9962:496621] Courier dispatched
2022-01-14 09:22:47.727172+0100 OrderManagementSystem[9962:496621] Order received
2022-01-14 09:22:47.727373+0100 OrderManagementSystem[9962:496621] Courier dispatched
2022-01-14 09:22:47.727753+0100 OrderManagementSystem[9962:496621] Courier arrived
2022-01-14 09:22:48.505355+0100 OrderManagementSystem[9962:495944] Order prepared
2022-01-14 09:22:48.506064+0100 OrderManagementSystem[9962:495944] Courier arrived
2022-01-14 09:22:48.506630+0100 OrderManagementSystem[9962:495944] Order prepared
2022-01-14 09:22:48.507042+0100 OrderManagementSystem[9962:495944] Order prepared
2022-01-14 09:22:48.507400+0100 OrderManagementSystem[9962:495944] Order picked up
2022-01-14 09:22:48.507734+0100 OrderManagementSystem[9962:495944] Courier wait time: 1480 ms
2022-01-14 09:22:48.508082+0100 OrderManagementSystem[9962:495944] Order picked up
2022-01-14 09:22:48.508415+0100 OrderManagementSystem[9962:495944] Courier wait time: 1480 ms
2022-01-14 09:22:48.508760+0100 OrderManagementSystem[9962:495944] Order picked up
2022-01-14 09:22:48.509087+0100 OrderManagementSystem[9962:495944] Courier wait time: 779 ms
2022-01-14 09:22:48.726287+0100 OrderManagementSystem[9962:495944] Order received
2022-01-14 09:22:48.726504+0100 OrderManagementSystem[9962:495944] Courier dispatched
2022-01-14 09:22:48.726939+0100 OrderManagementSystem[9962:495944] Order received
2022-01-14 09:22:48.727104+0100 OrderManagementSystem[9962:495944] Courier dispatched
2022-01-14 09:22:48.727485+0100 OrderManagementSystem[9962:495944] Courier arrived
2022-01-14 09:22:48.727874+0100 OrderManagementSystem[9962:495944] Courier arrived
2022-01-14 09:22:48.728293+0100 OrderManagementSystem[9962:495944] Order prepared
2022-01-14 09:22:48.728640+0100 OrderManagementSystem[9962:495944] Order picked up
2022-01-14 09:22:48.728964+0100 OrderManagementSystem[9962:495944] Courier wait time: 221 ms
2022-01-14 09:22:49.726412+0100 OrderManagementSystem[9962:490547] Order received
2022-01-14 09:22:49.726721+0100 OrderManagementSystem[9962:490547] Courier dispatched
2022-01-14 09:22:49.727247+0100 OrderManagementSystem[9962:490547] Order received
2022-01-14 09:22:49.727404+0100 OrderManagementSystem[9962:490547] Courier dispatched
2022-01-14 09:22:49.727925+0100 OrderManagementSystem[9962:490547] Courier arrived
2022-01-14 09:22:49.728471+0100 OrderManagementSystem[9962:490547] Order prepared
2022-01-14 09:22:49.728907+0100 OrderManagementSystem[9962:490547] Order picked up
2022-01-14 09:22:49.729301+0100 OrderManagementSystem[9962:490547] Courier wait time: 1000 ms
2022-01-14 09:22:50.025435+0100 OrderManagementSystem[9962:496161] Order prepared
2022-01-14 09:22:50.026138+0100 OrderManagementSystem[9962:496161] Courier arrived
2022-01-14 09:22:50.026680+0100 OrderManagementSystem[9962:496161] Courier arrived
2022-01-14 09:22:50.027051+0100 OrderManagementSystem[9962:496161] Order picked up
2022-01-14 09:22:50.027408+0100 OrderManagementSystem[9962:496161] Courier wait time: 1299 ms
2022-01-14 09:22:50.027763+0100 OrderManagementSystem[9962:496161] Courier arrived
2022-01-14 09:22:50.028180+0100 OrderManagementSystem[9962:496161] Order prepared
2022-01-14 09:22:50.028621+0100 OrderManagementSystem[9962:496161] Order picked up
2022-01-14 09:22:50.028954+0100 OrderManagementSystem[9962:496161] Courier wait time: 299 ms
2022-01-14 09:22:50.726645+0100 OrderManagementSystem[9962:496161] Order received
2022-01-14 09:22:50.726992+0100 OrderManagementSystem[9962:496161] Courier dispatched
2022-01-14 09:22:50.727568+0100 OrderManagementSystem[9962:496161] Order received
2022-01-14 09:22:50.727782+0100 OrderManagementSystem[9962:496161] Courier dispatched
2022-01-14 09:22:50.728333+0100 OrderManagementSystem[9962:496161] Courier arrived
2022-01-14 09:22:50.728855+0100 OrderManagementSystem[9962:496161] Courier arrived
2022-01-14 09:22:50.729382+0100 OrderManagementSystem[9962:496161] Courier arrived
2022-01-14 09:22:50.729806+0100 OrderManagementSystem[9962:496161] Order prepared
2022-01-14 09:22:50.730147+0100 OrderManagementSystem[9962:496161] Order picked up
2022-01-14 09:22:50.730419+0100 OrderManagementSystem[9962:496161] Courier wait time: 701 ms
2022-01-14 09:22:51.505111+0100 OrderManagementSystem[9962:490547] Courier arrived
2022-01-14 09:22:51.505625+0100 OrderManagementSystem[9962:490547] Order prepared
2022-01-14 09:22:51.506048+0100 OrderManagementSystem[9962:490547] Order prepared
2022-01-14 09:22:51.506399+0100 OrderManagementSystem[9962:490547] Order picked up
2022-01-14 09:22:51.506739+0100 OrderManagementSystem[9962:490547] Courier wait time: 1480 ms
2022-01-14 09:22:51.507047+0100 OrderManagementSystem[9962:490547] Order prepared
2022-01-14 09:22:51.507315+0100 OrderManagementSystem[9962:490547] Order picked up
2022-01-14 09:22:51.507567+0100 OrderManagementSystem[9962:490547] Courier wait time: 1480 ms
2022-01-14 09:22:51.507851+0100 OrderManagementSystem[9962:490547] Order picked up
2022-01-14 09:22:51.508110+0100 OrderManagementSystem[9962:490547] Courier wait time: 779 ms
2022-01-14 09:22:51.726730+0100 OrderManagementSystem[9962:490547] Order received
2022-01-14 09:22:51.727044+0100 OrderManagementSystem[9962:490547] Courier dispatched
2022-01-14 09:22:51.727476+0100 OrderManagementSystem[9962:490547] Order received
2022-01-14 09:22:51.727653+0100 OrderManagementSystem[9962:490547] Courier dispatched
2022-01-14 09:22:51.728145+0100 OrderManagementSystem[9962:490547] Courier arrived
2022-01-14 09:22:52.726663+0100 OrderManagementSystem[9962:496621] Order received
2022-01-14 09:22:52.727002+0100 OrderManagementSystem[9962:496621] Courier dispatched
2022-01-14 09:22:52.727572+0100 OrderManagementSystem[9962:496621] Order received
2022-01-14 09:22:52.727796+0100 OrderManagementSystem[9962:496621] Courier dispatched
2022-01-14 09:22:52.728337+0100 OrderManagementSystem[9962:496621] Courier arrived
2022-01-14 09:22:52.728774+0100 OrderManagementSystem[9962:496621] Courier arrived
2022-01-14 09:22:52.729212+0100 OrderManagementSystem[9962:496621] Order prepared
2022-01-14 09:22:52.729674+0100 OrderManagementSystem[9962:496621] Order prepared
2022-01-14 09:22:52.730042+0100 OrderManagementSystem[9962:496621] Order picked up
2022-01-14 09:22:52.730371+0100 OrderManagementSystem[9962:496621] Courier wait time: 2000 ms
2022-01-14 09:22:52.730678+0100 OrderManagementSystem[9962:496621] Order prepared
2022-01-14 09:22:52.730965+0100 OrderManagementSystem[9962:496621] Order prepared
2022-01-14 09:22:52.731251+0100 OrderManagementSystem[9962:496621] Order picked up
2022-01-14 09:22:52.731512+0100 OrderManagementSystem[9962:496621] Courier wait time: 2000 ms
2022-01-14 09:22:52.731846+0100 OrderManagementSystem[9962:496621] Order picked up
2022-01-14 09:22:52.739676+0100 OrderManagementSystem[9962:496621] Courier wait time: 1221 ms
2022-01-14 09:22:52.740014+0100 OrderManagementSystem[9962:496621] Order picked up
2022-01-14 09:22:52.740260+0100 OrderManagementSystem[9962:496621] Courier wait time: 1000 ms
2022-01-14 09:22:53.726449+0100 OrderManagementSystem[9962:496621] Order received
2022-01-14 09:22:53.726757+0100 OrderManagementSystem[9962:496621] Courier dispatched
2022-01-14 09:22:53.727289+0100 OrderManagementSystem[9962:496621] Order received
2022-01-14 09:22:53.727459+0100 OrderManagementSystem[9962:496621] Courier dispatched
2022-01-14 09:22:53.727978+0100 OrderManagementSystem[9962:496621] Courier arrived
2022-01-14 09:22:53.728539+0100 OrderManagementSystem[9962:496621] Order prepared
2022-01-14 09:22:53.729034+0100 OrderManagementSystem[9962:496621] Order prepared
2022-01-14 09:22:53.729529+0100 OrderManagementSystem[9962:496621] Order picked up
2022-01-14 09:22:53.729858+0100 OrderManagementSystem[9962:496621] Courier wait time: 1000 ms
2022-01-14 09:22:53.730201+0100 OrderManagementSystem[9962:496621] Courier arrived
2022-01-14 09:22:53.730513+0100 OrderManagementSystem[9962:496621] Order prepared
2022-01-14 09:22:53.730794+0100 OrderManagementSystem[9962:496621] Order picked up
2022-01-14 09:22:53.731070+0100 OrderManagementSystem[9962:496621] Courier wait time: 1000 ms
2022-01-14 09:22:53.731492+0100 OrderManagementSystem[9962:496621] Order picked up
2022-01-14 09:22:53.731804+0100 OrderManagementSystem[9962:496621] Courier wait time: 0 ms
2022-01-14 09:22:54.726536+0100 OrderManagementSystem[9962:496621] Order received
2022-01-14 09:22:54.726900+0100 OrderManagementSystem[9962:496621] Courier dispatched
2022-01-14 09:22:54.727362+0100 OrderManagementSystem[9962:496621] Order received
2022-01-14 09:22:54.727540+0100 OrderManagementSystem[9962:496621] Courier dispatched
2022-01-14 09:22:54.727934+0100 OrderManagementSystem[9962:496621] Order prepared
2022-01-14 09:22:54.728436+0100 OrderManagementSystem[9962:496621] Courier arrived
2022-01-14 09:22:54.728802+0100 OrderManagementSystem[9962:496621] Order picked up
2022-01-14 09:22:54.729165+0100 OrderManagementSystem[9962:496621] Courier wait time: 1000 ms
2022-01-14 09:22:55.726575+0100 OrderManagementSystem[9962:490547] Order received
2022-01-14 09:22:55.726824+0100 OrderManagementSystem[9962:490547] Courier dispatched
2022-01-14 09:22:55.727221+0100 OrderManagementSystem[9962:490547] Order received
2022-01-14 09:22:55.727436+0100 OrderManagementSystem[9962:490547] Courier dispatched
2022-01-14 09:22:55.727962+0100 OrderManagementSystem[9962:490547] Courier arrived
2022-01-14 09:22:55.728478+0100 OrderManagementSystem[9962:490547] Courier arrived
2022-01-14 09:22:55.728922+0100 OrderManagementSystem[9962:490547] Courier arrived
2022-01-14 09:22:56.726577+0100 OrderManagementSystem[9962:490547] Order received
2022-01-14 09:22:56.726947+0100 OrderManagementSystem[9962:490547] Courier dispatched
2022-01-14 09:22:56.727532+0100 OrderManagementSystem[9962:490547] Order received
2022-01-14 09:22:56.727750+0100 OrderManagementSystem[9962:490547] Courier dispatched
2022-01-14 09:22:56.728233+0100 OrderManagementSystem[9962:490547] Order prepared
2022-01-14 09:22:56.728741+0100 OrderManagementSystem[9962:490547] Order picked up
2022-01-14 09:22:56.729200+0100 OrderManagementSystem[9962:490547] Courier wait time: 2000 ms
2022-01-14 09:22:56.729659+0100 OrderManagementSystem[9962:490547] Order prepared
2022-01-14 09:22:56.729987+0100 OrderManagementSystem[9962:490547] Order picked up
2022-01-14 09:22:56.730270+0100 OrderManagementSystem[9962:490547] Courier wait time: 1000 ms
2022-01-14 09:22:57.726662+0100 OrderManagementSystem[9962:496620] Order received
2022-01-14 09:22:57.727019+0100 OrderManagementSystem[9962:496620] Courier dispatched
2022-01-14 09:22:57.727461+0100 OrderManagementSystem[9962:496620] Order received
2022-01-14 09:22:57.727604+0100 OrderManagementSystem[9962:496620] Courier dispatched
2022-01-14 09:22:57.727966+0100 OrderManagementSystem[9962:496620] Courier arrived
2022-01-14 09:22:57.728373+0100 OrderManagementSystem[9962:496620] Order prepared
2022-01-14 09:22:57.728766+0100 OrderManagementSystem[9962:496620] Courier arrived
2022-01-14 09:22:57.729187+0100 OrderManagementSystem[9962:496620] Order picked up
2022-01-14 09:22:57.729551+0100 OrderManagementSystem[9962:496620] Courier wait time: 2000 ms
2022-01-14 09:22:58.085459+0100 OrderManagementSystem[9962:496620] Order prepared
2022-01-14 09:22:58.086089+0100 OrderManagementSystem[9962:496620] Order picked up
2022-01-14 09:22:58.086619+0100 OrderManagementSystem[9962:496620] Courier wait time: 2359 ms
2022-01-14 09:22:58.726835+0100 OrderManagementSystem[9962:490547] Order prepared
2022-01-14 09:22:58.727312+0100 OrderManagementSystem[9962:490547] Order received
2022-01-14 09:22:58.727915+0100 OrderManagementSystem[9962:490547] Order prepared
2022-01-14 09:22:58.728350+0100 OrderManagementSystem[9962:490547] Order prepared
2022-01-14 09:22:58.728800+0100 OrderManagementSystem[9962:490547] Order picked up
2022-01-14 09:22:58.729225+0100 OrderManagementSystem[9962:490547] Courier wait time: 1000 ms
2022-01-14 09:22:58.729705+0100 OrderManagementSystem[9962:490547] Courier arrived
2022-01-14 09:22:58.730050+0100 OrderManagementSystem[9962:490547] Order picked up
2022-01-14 09:22:58.730330+0100 OrderManagementSystem[9962:490547] Courier wait time: 1000 ms
2022-01-14 09:22:58.730472+0100 OrderManagementSystem[9962:490547] Courier dispatched
2022-01-14 09:22:58.730755+0100 OrderManagementSystem[9962:490547] Order received
2022-01-14 09:22:58.730887+0100 OrderManagementSystem[9962:490547] Courier dispatched
2022-01-14 09:22:58.731224+0100 OrderManagementSystem[9962:490547] Order picked up
2022-01-14 09:22:58.731534+0100 OrderManagementSystem[9962:490547] Courier wait time: 0 ms
2022-01-14 09:22:59.726353+0100 OrderManagementSystem[9962:496621] Order received
2022-01-14 09:22:59.726701+0100 OrderManagementSystem[9962:496621] Courier dispatched
2022-01-14 09:22:59.727114+0100 OrderManagementSystem[9962:496621] Order received
2022-01-14 09:22:59.727318+0100 OrderManagementSystem[9962:496621] Courier dispatched
2022-01-14 09:23:00.026314+0100 OrderManagementSystem[9962:496621] Courier arrived
2022-01-14 09:23:00.726358+0100 OrderManagementSystem[9962:496621] Order received
2022-01-14 09:23:00.726722+0100 OrderManagementSystem[9962:496621] Courier dispatched
2022-01-14 09:23:00.727197+0100 OrderManagementSystem[9962:496621] Order received
2022-01-14 09:23:00.727381+0100 OrderManagementSystem[9962:496621] Courier dispatched
2022-01-14 09:23:01.309306+0100 OrderManagementSystem[9962:495944] Order prepared
2022-01-14 09:23:01.309694+0100 OrderManagementSystem[9962:495944] Courier arrived
2022-01-14 09:23:01.310032+0100 OrderManagementSystem[9962:495944] Order prepared
2022-01-14 09:23:01.310303+0100 OrderManagementSystem[9962:495944] Order picked up
2022-01-14 09:23:01.310617+0100 OrderManagementSystem[9962:495944] Courier wait time: 1283 ms
2022-01-14 09:23:01.310959+0100 OrderManagementSystem[9962:495944] Order picked up
2022-01-14 09:23:01.311345+0100 OrderManagementSystem[9962:495944] Courier wait time: 0 ms
2022-01-14 09:23:01.726385+0100 OrderManagementSystem[9962:495944] Order received
2022-01-14 09:23:01.726790+0100 OrderManagementSystem[9962:495944] Courier dispatched
2022-01-14 09:23:01.727295+0100 OrderManagementSystem[9962:495944] Order received
2022-01-14 09:23:01.727476+0100 OrderManagementSystem[9962:495944] Courier dispatched
2022-01-14 09:23:02.526025+0100 OrderManagementSystem[9962:495944] Order prepared
2022-01-14 09:23:02.526440+0100 OrderManagementSystem[9962:495944] Order prepared
2022-01-14 09:23:02.726369+0100 OrderManagementSystem[9962:495944] Order received
2022-01-14 09:23:02.726700+0100 OrderManagementSystem[9962:495944] Courier dispatched
2022-01-14 09:23:02.727325+0100 OrderManagementSystem[9962:495944] Order received
2022-01-14 09:23:02.727542+0100 OrderManagementSystem[9962:495944] Courier dispatched
2022-01-14 09:23:02.728065+0100 OrderManagementSystem[9962:495944] Courier arrived
2022-01-14 09:23:02.728551+0100 OrderManagementSystem[9962:495944] Order picked up
2022-01-14 09:23:02.728969+0100 OrderManagementSystem[9962:495944] Food wait time: 200 ms
2022-01-14 09:23:03.625930+0100 OrderManagementSystem[9962:496620] Order prepared
2022-01-14 09:23:03.626298+0100 OrderManagementSystem[9962:496620] Courier arrived
2022-01-14 09:23:03.626606+0100 OrderManagementSystem[9962:496620] Courier arrived
2022-01-14 09:23:03.626937+0100 OrderManagementSystem[9962:496620] Order picked up
2022-01-14 09:23:03.627220+0100 OrderManagementSystem[9962:496620] Food wait time: 1100 ms
2022-01-14 09:23:03.627534+0100 OrderManagementSystem[9962:496620] Courier arrived
2022-01-14 09:23:03.627832+0100 OrderManagementSystem[9962:496620] Order picked up
2022-01-14 09:23:03.628073+0100 OrderManagementSystem[9962:496620] Food wait time: 0 ms
2022-01-14 09:23:03.726623+0100 OrderManagementSystem[9962:496161] Courier arrived
2022-01-14 09:23:03.727050+0100 OrderManagementSystem[9962:496161] Order received
2022-01-14 09:23:03.727371+0100 OrderManagementSystem[9962:496161] Courier arrived
2022-01-14 09:23:03.727708+0100 OrderManagementSystem[9962:496161] Order prepared
2022-01-14 09:23:03.728081+0100 OrderManagementSystem[9962:496161] Order prepared
2022-01-14 09:23:03.728412+0100 OrderManagementSystem[9962:496161] Courier arrived
2022-01-14 09:23:03.728683+0100 OrderManagementSystem[9962:496161] Order prepared
2022-01-14 09:23:03.729093+0100 OrderManagementSystem[9962:496161] Order picked up
2022-01-14 09:23:03.729576+0100 OrderManagementSystem[9962:496161] Courier wait time: 100 ms
2022-01-14 09:23:03.729859+0100 OrderManagementSystem[9962:496161] Courier arrived
2022-01-14 09:23:03.729975+0100 OrderManagementSystem[9962:496161] Courier dispatched
2022-01-14 09:23:03.730239+0100 OrderManagementSystem[9962:496161] Order received
2022-01-14 09:23:03.730491+0100 OrderManagementSystem[9962:496161] Order picked up
2022-01-14 09:23:03.730698+0100 OrderManagementSystem[9962:496161] Courier wait time: 0 ms
2022-01-14 09:23:03.730801+0100 OrderManagementSystem[9962:496161] Courier dispatched
2022-01-14 09:23:03.731017+0100 OrderManagementSystem[9962:496161] Order picked up
2022-01-14 09:23:03.731246+0100 OrderManagementSystem[9962:496161] Courier wait time: 0 ms
2022-01-14 09:23:04.726124+0100 OrderManagementSystem[9962:496161] Order received
2022-01-14 09:23:04.726379+0100 OrderManagementSystem[9962:496161] Courier dispatched
2022-01-14 09:23:04.726918+0100 OrderManagementSystem[9962:496161] Order received
2022-01-14 09:23:04.727170+0100 OrderManagementSystem[9962:496161] Courier dispatched
2022-01-14 09:23:04.809369+0100 OrderManagementSystem[9962:497404] Order prepared
2022-01-14 09:23:04.809820+0100 OrderManagementSystem[9962:497404] Order prepared
2022-01-14 09:23:04.810265+0100 OrderManagementSystem[9962:497404] Order picked up
2022-01-14 09:23:04.810620+0100 OrderManagementSystem[9962:497404] Courier wait time: 1083 ms
2022-01-14 09:23:04.811016+0100 OrderManagementSystem[9962:497404] Order picked up
2022-01-14 09:23:04.811309+0100 OrderManagementSystem[9962:497404] Courier wait time: 1083 ms
2022-01-14 09:23:05.726597+0100 OrderManagementSystem[9962:495944] Order received
2022-01-14 09:23:05.727177+0100 OrderManagementSystem[9962:495944] Courier arrived
2022-01-14 09:23:05.727694+0100 OrderManagementSystem[9962:495944] Courier arrived
2022-01-14 09:23:05.728248+0100 OrderManagementSystem[9962:495944] Courier arrived
2022-01-14 09:23:05.728446+0100 OrderManagementSystem[9962:495944] Courier dispatched
2022-01-14 09:23:05.728840+0100 OrderManagementSystem[9962:495944] Order received
2022-01-14 09:23:05.728981+0100 OrderManagementSystem[9962:495944] Courier dispatched
2022-01-14 09:23:05.729480+0100 OrderManagementSystem[9962:495944] Courier arrived
2022-01-14 09:23:05.729839+0100 OrderManagementSystem[9962:495944] Order prepared
2022-01-14 09:23:05.730130+0100 OrderManagementSystem[9962:495944] Courier arrived
2022-01-14 09:23:05.730423+0100 OrderManagementSystem[9962:495944] Order picked up
2022-01-14 09:23:05.730733+0100 OrderManagementSystem[9962:495944] Courier wait time: 0 ms
2022-01-14 09:23:06.726129+0100 OrderManagementSystem[9962:495944] Order received
2022-01-14 09:23:06.726373+0100 OrderManagementSystem[9962:495944] Courier dispatched
2022-01-14 09:23:06.726942+0100 OrderManagementSystem[9962:495944] Order received
2022-01-14 09:23:06.727155+0100 OrderManagementSystem[9962:495944] Courier dispatched
2022-01-14 09:23:07.226129+0100 OrderManagementSystem[9962:490547] Courier arrived
2022-01-14 09:23:07.226770+0100 OrderManagementSystem[9962:490547] Order prepared
2022-01-14 09:23:07.227279+0100 OrderManagementSystem[9962:490547] Courier arrived
2022-01-14 09:23:07.227788+0100 OrderManagementSystem[9962:490547] Order picked up
2022-01-14 09:23:07.228252+0100 OrderManagementSystem[9962:490547] Courier wait time: 1500 ms
2022-01-14 09:23:07.726144+0100 OrderManagementSystem[9962:490547] Order received
2022-01-14 09:23:07.726388+0100 OrderManagementSystem[9962:490547] Courier dispatched
2022-01-14 09:23:07.726967+0100 OrderManagementSystem[9962:490547] Order received
2022-01-14 09:23:07.727186+0100 OrderManagementSystem[9962:490547] Courier dispatched
2022-01-14 09:23:08.307562+0100 OrderManagementSystem[9962:495944] Courier arrived
2022-01-14 09:23:08.307953+0100 OrderManagementSystem[9962:495944] Order prepared
2022-01-14 09:23:08.308267+0100 OrderManagementSystem[9962:495944] Order prepared
2022-01-14 09:23:08.308560+0100 OrderManagementSystem[9962:495944] Order picked up
2022-01-14 09:23:08.308803+0100 OrderManagementSystem[9962:495944] Courier wait time: 2581 ms
2022-01-14 09:23:08.309049+0100 OrderManagementSystem[9962:495944] Order prepared
2022-01-14 09:23:08.309313+0100 OrderManagementSystem[9962:495944] Order picked up
2022-01-14 09:23:08.309592+0100 OrderManagementSystem[9962:495944] Courier wait time: 2581 ms
2022-01-14 09:23:08.309866+0100 OrderManagementSystem[9962:495944] Order picked up
2022-01-14 09:23:08.310122+0100 OrderManagementSystem[9962:495944] Courier wait time: 2581 ms
2022-01-14 09:23:08.726091+0100 OrderManagementSystem[9962:495944] Order received
2022-01-14 09:23:08.726348+0100 OrderManagementSystem[9962:495944] Courier dispatched
2022-01-14 09:23:08.727023+0100 OrderManagementSystem[9962:495944] Order received
2022-01-14 09:23:08.727264+0100 OrderManagementSystem[9962:495944] Courier dispatched
2022-01-14 09:23:09.726057+0100 OrderManagementSystem[9962:495944] Order received
2022-01-14 09:23:09.726201+0100 OrderManagementSystem[9962:495944] Courier dispatched
2022-01-14 09:23:09.726539+0100 OrderManagementSystem[9962:495944] Order received
2022-01-14 09:23:09.726655+0100 OrderManagementSystem[9962:495944] Courier dispatched
2022-01-14 09:23:09.726904+0100 OrderManagementSystem[9962:495944] Courier arrived
2022-01-14 09:23:09.727142+0100 OrderManagementSystem[9962:495944] Order prepared
2022-01-14 09:23:09.727382+0100 OrderManagementSystem[9962:495944] Order picked up
2022-01-14 09:23:09.727596+0100 OrderManagementSystem[9962:495944] Courier wait time: 2500 ms
2022-01-14 09:23:10.173216+0100 OrderManagementSystem[9962:496620] Order prepared
2022-01-14 09:23:10.173578+0100 OrderManagementSystem[9962:496620] Courier arrived
2022-01-14 09:23:10.173887+0100 OrderManagementSystem[9962:496620] Order prepared
2022-01-14 09:23:10.174138+0100 OrderManagementSystem[9962:496620] Order prepared
2022-01-14 09:23:10.174347+0100 OrderManagementSystem[9962:496620] Order prepared
2022-01-14 09:23:10.174533+0100 OrderManagementSystem[9962:496620] Courier arrived
2022-01-14 09:23:10.174730+0100 OrderManagementSystem[9962:496620] Order picked up
2022-01-14 09:23:10.174913+0100 OrderManagementSystem[9962:496620] Courier wait time: 2947 ms
2022-01-14 09:23:10.175202+0100 OrderManagementSystem[9962:496620] Order picked up
2022-01-14 09:23:10.175437+0100 OrderManagementSystem[9962:496620] Courier wait time: 1866 ms
2022-01-14 09:23:10.175701+0100 OrderManagementSystem[9962:496620] Order picked up
2022-01-14 09:23:10.175953+0100 OrderManagementSystem[9962:496620] Courier wait time: 447 ms
2022-01-14 09:23:10.176219+0100 OrderManagementSystem[9962:496620] Order picked up
2022-01-14 09:23:10.176468+0100 OrderManagementSystem[9962:496620] Courier wait time: 0 ms
2022-01-14 09:23:10.725962+0100 OrderManagementSystem[9962:496620] Order received
2022-01-14 09:23:10.726139+0100 OrderManagementSystem[9962:496620] Courier dispatched
2022-01-14 09:23:10.726504+0100 OrderManagementSystem[9962:496620] Order received
2022-01-14 09:23:10.726684+0100 OrderManagementSystem[9962:496620] Courier dispatched
2022-01-14 09:23:11.025940+0100 OrderManagementSystem[9962:490547] Courier arrived
2022-01-14 09:23:11.026326+0100 OrderManagementSystem[9962:490547] Order prepared
2022-01-14 09:23:11.026689+0100 OrderManagementSystem[9962:490547] Order prepared
2022-01-14 09:23:11.026986+0100 OrderManagementSystem[9962:490547] Order prepared
2022-01-14 09:23:11.027304+0100 OrderManagementSystem[9962:490547] Order picked up
2022-01-14 09:23:11.027582+0100 OrderManagementSystem[9962:490547] Courier wait time: 853 ms
2022-01-14 09:23:11.027808+0100 OrderManagementSystem[9962:490547] Courier arrived
2022-01-14 09:23:11.028075+0100 OrderManagementSystem[9962:490547] Order picked up
2022-01-14 09:23:11.028369+0100 OrderManagementSystem[9962:490547] Courier wait time: 0 ms
2022-01-14 09:23:11.028673+0100 OrderManagementSystem[9962:490547] Order picked up
2022-01-14 09:23:11.028921+0100 OrderManagementSystem[9962:490547] Courier wait time: 0 ms
2022-01-14 09:23:11.725997+0100 OrderManagementSystem[9962:490547] Order received
2022-01-14 09:23:11.726180+0100 OrderManagementSystem[9962:490547] Courier dispatched
2022-01-14 09:23:11.726604+0100 OrderManagementSystem[9962:490547] Order received
2022-01-14 09:23:11.726731+0100 OrderManagementSystem[9962:490547] Courier dispatched
2022-01-14 09:23:12.225993+0100 OrderManagementSystem[9962:496161] Order prepared
2022-01-14 09:23:12.226500+0100 OrderManagementSystem[9962:496161] Order prepared
2022-01-14 09:23:12.226912+0100 OrderManagementSystem[9962:496161] Courier arrived
2022-01-14 09:23:12.227287+0100 OrderManagementSystem[9962:496161] Order prepared
2022-01-14 09:23:12.227669+0100 OrderManagementSystem[9962:496161] Order prepared
2022-01-14 09:23:12.227961+0100 OrderManagementSystem[9962:496161] Order prepared
2022-01-14 09:23:12.228229+0100 OrderManagementSystem[9962:496161] Courier arrived
2022-01-14 09:23:12.228548+0100 OrderManagementSystem[9962:496161] Order prepared
2022-01-14 09:23:12.228857+0100 OrderManagementSystem[9962:496161] Order picked up
2022-01-14 09:23:12.229210+0100 OrderManagementSystem[9962:496161] Food wait time: 0 ms
2022-01-14 09:23:12.229587+0100 OrderManagementSystem[9962:496161] Order picked up
2022-01-14 09:23:12.229934+0100 OrderManagementSystem[9962:496161] Food wait time: 0 ms
2022-01-14 09:23:12.726392+0100 OrderManagementSystem[9962:496161] Order received
2022-01-14 09:23:12.726734+0100 OrderManagementSystem[9962:496161] Courier dispatched
2022-01-14 09:23:12.727179+0100 OrderManagementSystem[9962:496161] Order received
2022-01-14 09:23:12.727339+0100 OrderManagementSystem[9962:496161] Courier dispatched
2022-01-14 09:23:12.727723+0100 OrderManagementSystem[9962:496161] Order prepared
2022-01-14 09:23:12.728194+0100 OrderManagementSystem[9962:496161] Courier arrived
2022-01-14 09:23:12.728596+0100 OrderManagementSystem[9962:496161] Order picked up
2022-01-14 09:23:12.729020+0100 OrderManagementSystem[9962:496161] Food wait time: 500 ms
2022-01-14 09:23:13.726498+0100 OrderManagementSystem[9962:497404] Order received
2022-01-14 09:23:13.726833+0100 OrderManagementSystem[9962:497404] Courier dispatched
2022-01-14 09:23:13.727329+0100 OrderManagementSystem[9962:497404] Order received
2022-01-14 09:23:13.727547+0100 OrderManagementSystem[9962:497404] Courier dispatched
2022-01-14 09:23:13.728078+0100 OrderManagementSystem[9962:497404] Courier arrived
2022-01-14 09:23:13.728481+0100 OrderManagementSystem[9962:497404] Order picked up
2022-01-14 09:23:13.728899+0100 OrderManagementSystem[9962:497404] Food wait time: 1500 ms
2022-01-14 09:23:13.729359+0100 OrderManagementSystem[9962:497404] Courier arrived
2022-01-14 09:23:13.729673+0100 OrderManagementSystem[9962:497404] Courier arrived
2022-01-14 09:23:13.729965+0100 OrderManagementSystem[9962:497404] Order picked up
2022-01-14 09:23:13.730385+0100 OrderManagementSystem[9962:497404] Food wait time: 1500 ms
2022-01-14 09:23:13.730802+0100 OrderManagementSystem[9962:497404] Courier arrived
2022-01-14 09:23:13.731120+0100 OrderManagementSystem[9962:497404] Courier arrived
2022-01-14 09:23:13.731414+0100 OrderManagementSystem[9962:497404] Courier arrived
2022-01-14 09:23:13.731681+0100 OrderManagementSystem[9962:497404] Order picked up
2022-01-14 09:23:13.733128+0100 OrderManagementSystem[9962:497404] Food wait time: 1500 ms
2022-01-14 09:23:13.733380+0100 OrderManagementSystem[9962:497404] Order picked up
2022-01-14 09:23:13.733582+0100 OrderManagementSystem[9962:497404] Food wait time: 1000 ms
2022-01-14 09:23:14.145137+0100 OrderManagementSystem[9962:497404] Order prepared
2022-01-14 09:23:14.145769+0100 OrderManagementSystem[9962:497404] Order picked up
2022-01-14 09:23:14.146243+0100 OrderManagementSystem[9962:497404] Courier wait time: 419 ms
2022-01-14 09:23:14.726773+0100 OrderManagementSystem[9962:497626] Order prepared
2022-01-14 09:23:14.727336+0100 OrderManagementSystem[9962:497626] Order prepared
2022-01-14 09:23:14.727737+0100 OrderManagementSystem[9962:497626] Order received
2022-01-14 09:23:14.728177+0100 OrderManagementSystem[9962:497626] Order picked up
2022-01-14 09:23:14.728734+0100 OrderManagementSystem[9962:497626] Courier wait time: 1000 ms
2022-01-14 09:23:14.728921+0100 OrderManagementSystem[9962:497626] Courier dispatched
2022-01-14 09:23:14.729442+0100 OrderManagementSystem[9962:497626] Order received
2022-01-14 09:23:14.729588+0100 OrderManagementSystem[9962:497626] Courier dispatched
2022-01-14 09:23:15.726955+0100 OrderManagementSystem[9962:497626] Order received
2022-01-14 09:23:15.727200+0100 OrderManagementSystem[9962:497626] Courier dispatched
2022-01-14 09:23:15.727726+0100 OrderManagementSystem[9962:497626] Order received
2022-01-14 09:23:15.727931+0100 OrderManagementSystem[9962:497626] Courier dispatched
2022-01-14 09:23:15.728450+0100 OrderManagementSystem[9962:497626] Order prepared
2022-01-14 09:23:15.728853+0100 OrderManagementSystem[9962:497626] Courier arrived
2022-01-14 09:23:15.729179+0100 OrderManagementSystem[9962:497626] Order prepared
2022-01-14 09:23:15.729603+0100 OrderManagementSystem[9962:497626] Order prepared
2022-01-14 09:23:15.729968+0100 OrderManagementSystem[9962:497626] Order prepared
2022-01-14 09:23:15.730259+0100 OrderManagementSystem[9962:497626] Order prepared
2022-01-14 09:23:15.730535+0100 OrderManagementSystem[9962:497626] Order picked up
2022-01-14 09:23:15.730805+0100 OrderManagementSystem[9962:497626] Food wait time: 1001 ms
2022-01-14 09:23:17.126487+0100 OrderManagementSystem[9962:496620] Order prepared
2022-01-14 09:23:17.127140+0100 OrderManagementSystem[9962:496620] Courier arrived
2022-01-14 09:23:17.127531+0100 OrderManagementSystem[9962:496620] Courier arrived
2022-01-14 09:23:17.127927+0100 OrderManagementSystem[9962:496620] Order picked up
2022-01-14 09:23:17.128294+0100 OrderManagementSystem[9962:496620] Food wait time: 1399 ms
2022-01-14 09:23:17.128727+0100 OrderManagementSystem[9962:496620] Courier arrived
2022-01-14 09:23:17.129070+0100 OrderManagementSystem[9962:496620] Courier arrived
2022-01-14 09:23:17.129423+0100 OrderManagementSystem[9962:496620] Order picked up
2022-01-14 09:23:17.129719+0100 OrderManagementSystem[9962:496620] Food wait time: 1399 ms
2022-01-14 09:23:17.129991+0100 OrderManagementSystem[9962:496620] Order picked up
2022-01-14 09:23:17.130284+0100 OrderManagementSystem[9962:496620] Food wait time: 1399 ms
2022-01-14 09:23:17.130577+0100 OrderManagementSystem[9962:496620] Order picked up
2022-01-14 09:23:17.130851+0100 OrderManagementSystem[9962:496620] Food wait time: 1399 ms
2022-01-14 09:23:18.525233+0100 OrderManagementSystem[9962:496161] Courier arrived
2022-01-14 09:23:18.525943+0100 OrderManagementSystem[9962:496161] Order prepared
2022-01-14 09:23:18.526476+0100 OrderManagementSystem[9962:496161] Order picked up
2022-01-14 09:23:18.526839+0100 OrderManagementSystem[9962:496161] Food wait time: 2798 ms
2022-01-14 09:23:18.527166+0100 OrderManagementSystem[9962:496161] Courier arrived
2022-01-14 09:23:18.527505+0100 OrderManagementSystem[9962:496161] Order picked up
2022-01-14 09:23:18.527826+0100 OrderManagementSystem[9962:496161] Food wait time: 1399 ms
2022-01-14 09:23:19.016306+0100 OrderManagementSystem[9962:497626] Order prepared
2022-01-14 09:23:19.016828+0100 OrderManagementSystem[9962:497626] Courier arrived
2022-01-14 09:23:19.017246+0100 OrderManagementSystem[9962:497626] Order prepared
2022-01-14 09:23:19.017563+0100 OrderManagementSystem[9962:497626] Order picked up
2022-01-14 09:23:19.017833+0100 OrderManagementSystem[9962:497626] Food wait time: 491 ms
2022-01-14 09:23:20.214677+0100 OrderManagementSystem[9962:495796] Courier arrived
2022-01-14 09:23:20.215363+0100 OrderManagementSystem[9962:495796] Courier arrived
2022-01-14 09:23:20.215934+0100 OrderManagementSystem[9962:495796] Order picked up
2022-01-14 09:23:20.216381+0100 OrderManagementSystem[9962:495796] Food wait time: 1198 ms
2022-01-14 09:23:20.216718+0100 OrderManagementSystem[9962:495796] Courier arrived
2022-01-14 09:23:20.217063+0100 OrderManagementSystem[9962:495796] Order prepared
2022-01-14 09:23:20.217446+0100 OrderManagementSystem[9962:495796] Order picked up
2022-01-14 09:23:20.217795+0100 OrderManagementSystem[9962:495796] Food wait time: 1198 ms
2022-01-14 09:23:20.218185+0100 OrderManagementSystem[9962:495796] Order picked up
2022-01-14 09:23:20.218523+0100 OrderManagementSystem[9962:495796] Food wait time: 0 ms
2022-01-14 09:23:22.126204+0100 OrderManagementSystem[9962:495944] Courier arrived
2022-01-14 09:23:22.126682+0100 OrderManagementSystem[9962:495944] Courier arrived
2022-01-14 09:23:22.127116+0100 OrderManagementSystem[9962:495944] Order prepared
2022-01-14 09:23:22.127469+0100 OrderManagementSystem[9962:495944] Courier arrived
2022-01-14 09:23:22.127796+0100 OrderManagementSystem[9962:495944] Order picked up
2022-01-14 09:23:22.128164+0100 OrderManagementSystem[9962:495944] Courier wait time: 0 ms
2022-01-14 09:23:22.726175+0100 OrderManagementSystem[9962:497404] Courier arrived
2022-01-14 09:23:22.726550+0100 OrderManagementSystem[9962:497404] Order prepared
2022-01-14 09:23:22.726880+0100 OrderManagementSystem[9962:497404] Order prepared
2022-01-14 09:23:22.727298+0100 OrderManagementSystem[9962:497404] Order picked up
2022-01-14 09:23:22.727750+0100 OrderManagementSystem[9962:497404] Courier wait time: 600 ms
2022-01-14 09:23:22.728147+0100 OrderManagementSystem[9962:497404] Order picked up
2022-01-14 09:23:22.728561+0100 OrderManagementSystem[9962:497404] Courier wait time: 600 ms
2022-01-14 09:23:23.426457+0100 OrderManagementSystem[9962:497626] Order prepared
2022-01-14 09:23:23.427088+0100 OrderManagementSystem[9962:497626] Order prepared
2022-01-14 09:23:23.427632+0100 OrderManagementSystem[9962:497626] Order picked up
2022-01-14 09:23:23.428080+0100 OrderManagementSystem[9962:497626] Courier wait time: 700 ms
2022-01-14 09:23:23.428642+0100 OrderManagementSystem[9962:497626] Order prepared
2022-01-14 09:23:24.614698+0100 OrderManagementSystem[9962:495944] Order prepared
2022-01-14 09:23:24.615346+0100 OrderManagementSystem[9962:495944] Courier arrived
2022-01-14 09:23:24.615781+0100 OrderManagementSystem[9962:495944] Order picked up
2022-01-14 09:23:24.616180+0100 OrderManagementSystem[9962:495944] Food wait time: 1188 ms
2022-01-14 09:23:25.726373+0100 OrderManagementSystem[9962:497404] Courier arrived
2022-01-14 09:23:25.726746+0100 OrderManagementSystem[9962:497404] Courier arrived
2022-01-14 09:23:25.727079+0100 OrderManagementSystem[9962:497404] Order prepared
2022-01-14 09:23:25.727407+0100 OrderManagementSystem[9962:497404] Courier arrived
2022-01-14 09:23:25.727668+0100 OrderManagementSystem[9962:497404] Order picked up
2022-01-14 09:23:25.727977+0100 OrderManagementSystem[9962:497404] Food wait time: 2300 ms
2022-01-14 09:23:25.728337+0100 OrderManagementSystem[9962:497404] Order picked up
2022-01-14 09:23:25.728597+0100 OrderManagementSystem[9962:497404] Food wait time: 1112 ms
2022-01-14 09:23:25.728892+0100 OrderManagementSystem[9962:497404] Order picked up
2022-01-14 09:23:25.729141+0100 OrderManagementSystem[9962:497404] Food wait time: 0 ms
2022-01-14 09:23:26.813354+0100 OrderManagementSystem[9962:495944] Order prepared
2022-01-14 09:23:30.727429+0100 OrderManagementSystem[9962:490547] Courier arrived
2022-01-14 09:23:30.728067+0100 OrderManagementSystem[9962:490547] Order picked up
2022-01-14 09:23:30.728556+0100 OrderManagementSystem[9962:490547] Food wait time: 3914 ms
2022-01-14 09:23:30.728949+0100 OrderManagementSystem[9962:490547] Average order wait time: 1490 ms
2022-01-14 09:23:30.729311+0100 OrderManagementSystem[9962:490547] Average courier wait time: 1027 ms
```

</details>

<details> 
  <summary>
  
  ```
  Matched strategy simulation
  ```
  
  </summary>
  
```
2022-01-14 09:27:58.634446+0100 OrderManagementSystem[9962:497627] -------------------------------------------------------------------------
2022-01-14 09:27:58.634845+0100 OrderManagementSystem[9962:497627] Starting Matched strategy order management system simulation
2022-01-14 09:27:58.634983+0100 OrderManagementSystem[9962:497627] -------------------------------------------------------------------------
2022-01-14 09:27:59.638085+0100 OrderManagementSystem[9962:497627] Order received
2022-01-14 09:27:59.638293+0100 OrderManagementSystem[9962:497627] Courier dispatched
2022-01-14 09:27:59.638876+0100 OrderManagementSystem[9962:497627] Order received
2022-01-14 09:27:59.639086+0100 OrderManagementSystem[9962:497627] Courier dispatched
2022-01-14 09:28:00.637473+0100 OrderManagementSystem[9962:497627] Order received
2022-01-14 09:28:00.637574+0100 OrderManagementSystem[9962:497627] Courier dispatched
2022-01-14 09:28:00.637879+0100 OrderManagementSystem[9962:497627] Order received
2022-01-14 09:28:00.637981+0100 OrderManagementSystem[9962:497627] Courier dispatched
2022-01-14 09:28:01.638696+0100 OrderManagementSystem[9962:497627] Order received
2022-01-14 09:28:01.638929+0100 OrderManagementSystem[9962:497627] Courier dispatched
2022-01-14 09:28:01.639407+0100 OrderManagementSystem[9962:497627] Order received
2022-01-14 09:28:01.639581+0100 OrderManagementSystem[9962:497627] Courier dispatched
2022-01-14 09:28:02.637405+0100 OrderManagementSystem[9962:497627] Order received
2022-01-14 09:28:02.637550+0100 OrderManagementSystem[9962:497627] Courier dispatched
2022-01-14 09:28:02.637899+0100 OrderManagementSystem[9962:497627] Order received
2022-01-14 09:28:02.637997+0100 OrderManagementSystem[9962:497627] Courier dispatched
2022-01-14 09:28:03.638384+0100 OrderManagementSystem[9962:505470] Order received
2022-01-14 09:28:03.638889+0100 OrderManagementSystem[9962:505470] Order prepared
2022-01-14 09:28:03.639298+0100 OrderManagementSystem[9962:505470] Courier arrived
2022-01-14 09:28:03.639476+0100 OrderManagementSystem[9962:505470] Courier dispatched
2022-01-14 09:28:03.639818+0100 OrderManagementSystem[9962:505470] Order received
2022-01-14 09:28:03.639983+0100 OrderManagementSystem[9962:505470] Courier dispatched
2022-01-14 09:28:03.640308+0100 OrderManagementSystem[9962:505470] Order picked up
2022-01-14 09:28:03.640603+0100 OrderManagementSystem[9962:505470] Food wait time: 0 ms
2022-01-14 09:28:04.637682+0100 OrderManagementSystem[9962:505470] Order received
2022-01-14 09:28:04.637847+0100 OrderManagementSystem[9962:505470] Courier dispatched
2022-01-14 09:28:04.638239+0100 OrderManagementSystem[9962:505470] Order received
2022-01-14 09:28:04.638379+0100 OrderManagementSystem[9962:505470] Courier dispatched
2022-01-14 09:28:05.638656+0100 OrderManagementSystem[9962:505470] Order received
2022-01-14 09:28:05.638961+0100 OrderManagementSystem[9962:505470] Courier dispatched
2022-01-14 09:28:05.639506+0100 OrderManagementSystem[9962:505470] Order received
2022-01-14 09:28:05.639697+0100 OrderManagementSystem[9962:505470] Courier dispatched
2022-01-14 09:28:06.637417+0100 OrderManagementSystem[9962:505470] Order received
2022-01-14 09:28:06.637537+0100 OrderManagementSystem[9962:505470] Courier dispatched
2022-01-14 09:28:06.637836+0100 OrderManagementSystem[9962:505470] Order received
2022-01-14 09:28:06.637924+0100 OrderManagementSystem[9962:505470] Courier dispatched
2022-01-14 09:28:06.926548+0100 OrderManagementSystem[9962:505471] Order prepared
2022-01-14 09:28:06.927047+0100 OrderManagementSystem[9962:505471] Order prepared
2022-01-14 09:28:06.927487+0100 OrderManagementSystem[9962:505471] Courier arrived
2022-01-14 09:28:07.638109+0100 OrderManagementSystem[9962:505170] Courier arrived
2022-01-14 09:28:07.638471+0100 OrderManagementSystem[9962:505170] Order received
2022-01-14 09:28:07.638888+0100 OrderManagementSystem[9962:505170] Courier arrived
2022-01-14 09:28:07.639020+0100 OrderManagementSystem[9962:505170] Courier dispatched
2022-01-14 09:28:07.639289+0100 OrderManagementSystem[9962:505170] Order received
2022-01-14 09:28:07.639386+0100 OrderManagementSystem[9962:505170] Courier dispatched
2022-01-14 09:28:08.037052+0100 OrderManagementSystem[9962:505470] Order prepared
2022-01-14 09:28:08.037686+0100 OrderManagementSystem[9962:505470] Courier arrived
2022-01-14 09:28:08.038088+0100 OrderManagementSystem[9962:505470] Order picked up
2022-01-14 09:28:08.038541+0100 OrderManagementSystem[9962:505470] Food wait time: 1110 ms
2022-01-14 09:28:08.637570+0100 OrderManagementSystem[9962:505470] Order received
2022-01-14 09:28:08.637724+0100 OrderManagementSystem[9962:505470] Courier dispatched
2022-01-14 09:28:08.638220+0100 OrderManagementSystem[9962:505470] Order received
2022-01-14 09:28:08.638415+0100 OrderManagementSystem[9962:505470] Courier dispatched
2022-01-14 09:28:08.638853+0100 OrderManagementSystem[9962:505470] Courier arrived
2022-01-14 09:28:08.639170+0100 OrderManagementSystem[9962:505470] Order prepared
2022-01-14 09:28:09.638251+0100 OrderManagementSystem[9962:505470] Order received
2022-01-14 09:28:09.638455+0100 OrderManagementSystem[9962:505470] Courier dispatched
2022-01-14 09:28:09.638927+0100 OrderManagementSystem[9962:505470] Order received
2022-01-14 09:28:09.639080+0100 OrderManagementSystem[9962:505470] Courier dispatched
2022-01-14 09:28:09.639479+0100 OrderManagementSystem[9962:505470] Order prepared
2022-01-14 09:28:10.638289+0100 OrderManagementSystem[9962:505470] Order received
2022-01-14 09:28:10.638554+0100 OrderManagementSystem[9962:505470] Courier dispatched
2022-01-14 09:28:10.639104+0100 OrderManagementSystem[9962:505470] Order received
2022-01-14 09:28:10.639283+0100 OrderManagementSystem[9962:505470] Courier dispatched
2022-01-14 09:28:11.531790+0100 OrderManagementSystem[9962:497627] Order prepared
2022-01-14 09:28:11.532191+0100 OrderManagementSystem[9962:497627] Order picked up
2022-01-14 09:28:11.532542+0100 OrderManagementSystem[9962:497627] Courier wait time: 4605 ms
2022-01-14 09:28:11.638729+0100 OrderManagementSystem[9962:497627] Order received
2022-01-14 09:28:11.638952+0100 OrderManagementSystem[9962:497627] Courier dispatched
2022-01-14 09:28:11.639432+0100 OrderManagementSystem[9962:497627] Order received
2022-01-14 09:28:11.639642+0100 OrderManagementSystem[9962:497627] Courier dispatched
2022-01-14 09:28:11.640182+0100 OrderManagementSystem[9962:497627] Order prepared
2022-01-14 09:28:11.640670+0100 OrderManagementSystem[9962:497627] Courier arrived
2022-01-14 09:28:11.641064+0100 OrderManagementSystem[9962:497627] Order picked up
2022-01-14 09:28:11.641466+0100 OrderManagementSystem[9962:497627] Food wait time: 4712 ms
2022-01-14 09:28:12.638858+0100 OrderManagementSystem[9962:497627] Order received
2022-01-14 09:28:12.639210+0100 OrderManagementSystem[9962:497627] Courier dispatched
2022-01-14 09:28:12.639697+0100 OrderManagementSystem[9962:497627] Order received
2022-01-14 09:28:12.639869+0100 OrderManagementSystem[9962:497627] Courier dispatched
2022-01-14 09:28:12.640221+0100 OrderManagementSystem[9962:497627] Courier arrived
2022-01-14 09:28:12.640574+0100 OrderManagementSystem[9962:497627] Order prepared
2022-01-14 09:28:12.640971+0100 OrderManagementSystem[9962:497627] Order prepared
2022-01-14 09:28:12.641355+0100 OrderManagementSystem[9962:497627] Order prepared
2022-01-14 09:28:12.641705+0100 OrderManagementSystem[9962:497627] Courier arrived
2022-01-14 09:28:12.642009+0100 OrderManagementSystem[9962:497627] Order picked up
2022-01-14 09:28:12.642279+0100 OrderManagementSystem[9962:497627] Courier wait time: 5001 ms
2022-01-14 09:28:12.642551+0100 OrderManagementSystem[9962:497627] Order prepared
2022-01-14 09:28:12.642838+0100 OrderManagementSystem[9962:497627] Order picked up
2022-01-14 09:28:12.643151+0100 OrderManagementSystem[9962:497627] Food wait time: 4000 ms
2022-01-14 09:28:13.638542+0100 OrderManagementSystem[9962:505470] Courier arrived
2022-01-14 09:28:13.639270+0100 OrderManagementSystem[9962:505470] Order prepared
2022-01-14 09:28:13.639925+0100 OrderManagementSystem[9962:505470] Order received
2022-01-14 09:28:13.640272+0100 OrderManagementSystem[9962:505470] Courier arrived
2022-01-14 09:28:13.640605+0100 OrderManagementSystem[9962:505470] Order prepared
2022-01-14 09:28:13.640993+0100 OrderManagementSystem[9962:505470] Courier arrived
2022-01-14 09:28:13.641369+0100 OrderManagementSystem[9962:505470] Order picked up
2022-01-14 09:28:13.641760+0100 OrderManagementSystem[9962:505470] Courier wait time: 0 ms
2022-01-14 09:28:13.641919+0100 OrderManagementSystem[9962:505470] Courier dispatched
2022-01-14 09:28:13.642272+0100 OrderManagementSystem[9962:505470] Order received
2022-01-14 09:28:13.642420+0100 OrderManagementSystem[9962:505470] Courier dispatched
2022-01-14 09:28:13.642686+0100 OrderManagementSystem[9962:505470] Order picked up
2022-01-14 09:28:13.643017+0100 OrderManagementSystem[9962:505470] Food wait time: 1000 ms
2022-01-14 09:28:13.643338+0100 OrderManagementSystem[9962:505470] Courier arrived
2022-01-14 09:28:13.643728+0100 OrderManagementSystem[9962:505470] Order picked up
2022-01-14 09:28:13.646623+0100 OrderManagementSystem[9962:505470] Courier wait time: 6001 ms
2022-01-14 09:28:13.647002+0100 OrderManagementSystem[9962:505470] Order picked up
2022-01-14 09:28:13.647339+0100 OrderManagementSystem[9962:505470] Food wait time: 1000 ms
2022-01-14 09:28:13.647648+0100 OrderManagementSystem[9962:505470] Order picked up
2022-01-14 09:28:13.647936+0100 OrderManagementSystem[9962:505470] Food wait time: 1000 ms
2022-01-14 09:28:14.638689+0100 OrderManagementSystem[9962:505470] Order received
2022-01-14 09:28:14.638992+0100 OrderManagementSystem[9962:505470] Courier dispatched
2022-01-14 09:28:14.639464+0100 OrderManagementSystem[9962:505470] Order received
2022-01-14 09:28:14.639634+0100 OrderManagementSystem[9962:505470] Courier dispatched
2022-01-14 09:28:14.640036+0100 OrderManagementSystem[9962:505470] Order prepared
2022-01-14 09:28:14.640374+0100 OrderManagementSystem[9962:505470] Courier arrived
2022-01-14 09:28:15.638833+0100 OrderManagementSystem[9962:505470] Order received
2022-01-14 09:28:15.639185+0100 OrderManagementSystem[9962:505470] Courier dispatched
2022-01-14 09:28:15.639700+0100 OrderManagementSystem[9962:505470] Order received
2022-01-14 09:28:15.639843+0100 OrderManagementSystem[9962:505470] Courier dispatched
2022-01-14 09:28:15.640213+0100 OrderManagementSystem[9962:505470] Courier arrived
2022-01-14 09:28:15.640566+0100 OrderManagementSystem[9962:505470] Order picked up
2022-01-14 09:28:15.640922+0100 OrderManagementSystem[9962:505470] Food wait time: 6000 ms
2022-01-14 09:28:15.641272+0100 OrderManagementSystem[9962:505470] Order prepared
2022-01-14 09:28:15.641617+0100 OrderManagementSystem[9962:505470] Order prepared
2022-01-14 09:28:15.641909+0100 OrderManagementSystem[9962:505470] Courier arrived
2022-01-14 09:28:15.642180+0100 OrderManagementSystem[9962:505470] Order picked up
2022-01-14 09:28:15.642435+0100 OrderManagementSystem[9962:505470] Courier wait time: 3000 ms
2022-01-14 09:28:15.642715+0100 OrderManagementSystem[9962:505470] Order picked up
2022-01-14 09:28:15.642989+0100 OrderManagementSystem[9962:505470] Food wait time: 7602 ms
2022-01-14 09:28:16.637681+0100 OrderManagementSystem[9962:505470] Order received
2022-01-14 09:28:16.637809+0100 OrderManagementSystem[9962:505470] Courier dispatched
2022-01-14 09:28:16.638159+0100 OrderManagementSystem[9962:505470] Order received
2022-01-14 09:28:16.638283+0100 OrderManagementSystem[9962:505470] Courier dispatched
2022-01-14 09:28:17.132364+0100 OrderManagementSystem[9962:505471] Order prepared
2022-01-14 09:28:17.132726+0100 OrderManagementSystem[9962:505471] Courier arrived
2022-01-14 09:28:17.638277+0100 OrderManagementSystem[9962:505471] Order received
2022-01-14 09:28:17.638478+0100 OrderManagementSystem[9962:505471] Courier dispatched
2022-01-14 09:28:17.638960+0100 OrderManagementSystem[9962:505471] Order received
2022-01-14 09:28:17.639122+0100 OrderManagementSystem[9962:505471] Courier dispatched
2022-01-14 09:28:17.639524+0100 OrderManagementSystem[9962:505471] Courier arrived
2022-01-14 09:28:17.639898+0100 OrderManagementSystem[9962:505471] Order prepared
2022-01-14 09:28:17.640269+0100 OrderManagementSystem[9962:505471] Order picked up
2022-01-14 09:28:17.640618+0100 OrderManagementSystem[9962:505471] Food wait time: 2999 ms
2022-01-14 09:28:18.126738+0100 OrderManagementSystem[9962:505643] Order prepared
2022-01-14 09:28:18.127315+0100 OrderManagementSystem[9962:505643] Courier arrived
2022-01-14 09:28:18.127777+0100 OrderManagementSystem[9962:505643] Order picked up
2022-01-14 09:28:18.128185+0100 OrderManagementSystem[9962:505643] Courier wait time: 3488 ms
2022-01-14 09:28:18.128616+0100 OrderManagementSystem[9962:505643] Order prepared
2022-01-14 09:28:18.128998+0100 OrderManagementSystem[9962:505643] Order prepared
2022-01-14 09:28:18.129432+0100 OrderManagementSystem[9962:505643] Order picked up
2022-01-14 09:28:18.129758+0100 OrderManagementSystem[9962:505643] Food wait time: 2488 ms
2022-01-14 09:28:18.130067+0100 OrderManagementSystem[9962:505643] Order picked up
2022-01-14 09:28:18.130350+0100 OrderManagementSystem[9962:505643] Courier wait time: 9488 ms
2022-01-14 09:28:18.638470+0100 OrderManagementSystem[9962:506032] Order received
2022-01-14 09:28:18.638644+0100 OrderManagementSystem[9962:506032] Courier dispatched
2022-01-14 09:28:18.639018+0100 OrderManagementSystem[9962:506032] Order received
2022-01-14 09:28:18.639149+0100 OrderManagementSystem[9962:506032] Courier dispatched
2022-01-14 09:28:18.639460+0100 OrderManagementSystem[9962:506032] Courier arrived
2022-01-14 09:28:18.639699+0100 OrderManagementSystem[9962:506032] Order prepared
2022-01-14 09:28:18.639994+0100 OrderManagementSystem[9962:506032] Courier arrived
2022-01-14 09:28:18.640207+0100 OrderManagementSystem[9962:506032] Courier arrived
2022-01-14 09:28:18.640393+0100 OrderManagementSystem[9962:506032] Order picked up
2022-01-14 09:28:18.640563+0100 OrderManagementSystem[9962:506032] Courier wait time: 0 ms
2022-01-14 09:28:19.638828+0100 OrderManagementSystem[9962:506032] Order received
2022-01-14 09:28:19.639161+0100 OrderManagementSystem[9962:506032] Courier dispatched
2022-01-14 09:28:19.639872+0100 OrderManagementSystem[9962:506032] Order received
2022-01-14 09:28:19.640184+0100 OrderManagementSystem[9962:506032] Courier dispatched
2022-01-14 09:28:19.640547+0100 OrderManagementSystem[9962:506032] Courier arrived
2022-01-14 09:28:19.640862+0100 OrderManagementSystem[9962:506032] Order prepared
2022-01-14 09:28:19.641226+0100 OrderManagementSystem[9962:506032] Order picked up
2022-01-14 09:28:19.641582+0100 OrderManagementSystem[9962:506032] Food wait time: 2001 ms
2022-01-14 09:28:19.641941+0100 OrderManagementSystem[9962:506032] Courier arrived
2022-01-14 09:28:19.642305+0100 OrderManagementSystem[9962:506032] Order prepared
2022-01-14 09:28:19.642684+0100 OrderManagementSystem[9962:506032] Courier arrived
2022-01-14 09:28:19.642978+0100 OrderManagementSystem[9962:506032] Courier arrived
2022-01-14 09:28:19.643340+0100 OrderManagementSystem[9962:506032] Order picked up
2022-01-14 09:28:19.643666+0100 OrderManagementSystem[9962:506032] Food wait time: 1512 ms
2022-01-14 09:28:19.643971+0100 OrderManagementSystem[9962:506032] Order prepared
2022-01-14 09:28:19.646041+0100 OrderManagementSystem[9962:506032] Order picked up
2022-01-14 09:28:19.646478+0100 OrderManagementSystem[9962:506032] Courier wait time: 1000 ms
2022-01-14 09:28:20.637679+0100 OrderManagementSystem[9962:506032] Order received
2022-01-14 09:28:20.637902+0100 OrderManagementSystem[9962:506032] Courier dispatched
2022-01-14 09:28:20.638360+0100 OrderManagementSystem[9962:506032] Order received
2022-01-14 09:28:20.638549+0100 OrderManagementSystem[9962:506032] Courier dispatched
2022-01-14 09:28:21.132997+0100 OrderManagementSystem[9962:505471] Order prepared
2022-01-14 09:28:21.133395+0100 OrderManagementSystem[9962:505471] Order prepared
2022-01-14 09:28:21.133660+0100 OrderManagementSystem[9962:505471] Order prepared
2022-01-14 09:28:21.638887+0100 OrderManagementSystem[9962:505471] Order received
2022-01-14 09:28:21.639137+0100 OrderManagementSystem[9962:505471] Courier dispatched
2022-01-14 09:28:21.639686+0100 OrderManagementSystem[9962:505471] Order received
2022-01-14 09:28:21.639841+0100 OrderManagementSystem[9962:505471] Courier dispatched
2022-01-14 09:28:21.640204+0100 OrderManagementSystem[9962:505471] Order prepared
2022-01-14 09:28:21.640578+0100 OrderManagementSystem[9962:505471] Courier arrived
2022-01-14 09:28:21.640934+0100 OrderManagementSystem[9962:505471] Order picked up
2022-01-14 09:28:21.641298+0100 OrderManagementSystem[9962:505471] Food wait time: 4506 ms
2022-01-14 09:28:22.638767+0100 OrderManagementSystem[9962:505471] Order received
2022-01-14 09:28:22.639066+0100 OrderManagementSystem[9962:505471] Courier dispatched
2022-01-14 09:28:22.639754+0100 OrderManagementSystem[9962:505471] Order received
2022-01-14 09:28:22.640053+0100 OrderManagementSystem[9962:505471] Courier dispatched
2022-01-14 09:28:22.640511+0100 OrderManagementSystem[9962:505471] Order prepared
2022-01-14 09:28:22.640862+0100 OrderManagementSystem[9962:505471] Order picked up
2022-01-14 09:28:22.641230+0100 OrderManagementSystem[9962:505471] Courier wait time: 4000 ms
2022-01-14 09:28:22.641595+0100 OrderManagementSystem[9962:505471] Order prepared
2022-01-14 09:28:22.641933+0100 OrderManagementSystem[9962:505471] Order prepared
2022-01-14 09:28:22.642315+0100 OrderManagementSystem[9962:505471] Order picked up
2022-01-14 09:28:22.642643+0100 OrderManagementSystem[9962:505471] Courier wait time: 3000 ms
2022-01-14 09:28:22.642954+0100 OrderManagementSystem[9962:505471] Order prepared
2022-01-14 09:28:22.643253+0100 OrderManagementSystem[9962:505471] Courier arrived
2022-01-14 09:28:22.643553+0100 OrderManagementSystem[9962:505471] Order picked up
2022-01-14 09:28:22.643843+0100 OrderManagementSystem[9962:505471] Food wait time: 1506 ms
2022-01-14 09:28:23.637994+0100 OrderManagementSystem[9962:505471] Order received
2022-01-14 09:28:23.638141+0100 OrderManagementSystem[9962:505471] Courier dispatched
2022-01-14 09:28:23.638557+0100 OrderManagementSystem[9962:505471] Order received
2022-01-14 09:28:23.638697+0100 OrderManagementSystem[9962:505471] Courier dispatched
2022-01-14 09:28:23.639006+0100 OrderManagementSystem[9962:505471] Courier arrived
2022-01-14 09:28:23.639259+0100 OrderManagementSystem[9962:505471] Courier arrived
2022-01-14 09:28:23.639457+0100 OrderManagementSystem[9962:505471] Order picked up
2022-01-14 09:28:23.639710+0100 OrderManagementSystem[9962:505471] Food wait time: 11999 ms
2022-01-14 09:28:24.126974+0100 OrderManagementSystem[9962:506096] Order prepared
2022-01-14 09:28:24.127458+0100 OrderManagementSystem[9962:506096] Order prepared
2022-01-14 09:28:24.127909+0100 OrderManagementSystem[9962:506096] Order picked up
2022-01-14 09:28:24.128321+0100 OrderManagementSystem[9962:506096] Courier wait time: 4488 ms
2022-01-14 09:28:24.638667+0100 OrderManagementSystem[9962:506096] Order received
2022-01-14 09:28:24.638902+0100 OrderManagementSystem[9962:506096] Courier dispatched
2022-01-14 09:28:24.639413+0100 OrderManagementSystem[9962:506096] Order prepared
2022-01-14 09:28:24.639824+0100 OrderManagementSystem[9962:506096] Order received
2022-01-14 09:28:24.640157+0100 OrderManagementSystem[9962:506096] Courier arrived
2022-01-14 09:28:24.640529+0100 OrderManagementSystem[9962:506096] Courier arrived
2022-01-14 09:28:24.640691+0100 OrderManagementSystem[9962:506096] Courier dispatched
2022-01-14 09:28:24.640988+0100 OrderManagementSystem[9962:506096] Order picked up
2022-01-14 09:28:24.641255+0100 OrderManagementSystem[9962:506096] Food wait time: 2000 ms
2022-01-14 09:28:25.637664+0100 OrderManagementSystem[9962:506096] Order received
2022-01-14 09:28:25.637826+0100 OrderManagementSystem[9962:506096] Courier dispatched
2022-01-14 09:28:25.638188+0100 OrderManagementSystem[9962:506096] Order received
2022-01-14 09:28:25.638326+0100 OrderManagementSystem[9962:506096] Courier dispatched
2022-01-14 09:28:26.638546+0100 OrderManagementSystem[9962:506096] Order received
2022-01-14 09:28:26.638731+0100 OrderManagementSystem[9962:506096] Courier dispatched
2022-01-14 09:28:26.639174+0100 OrderManagementSystem[9962:506096] Order received
2022-01-14 09:28:26.639348+0100 OrderManagementSystem[9962:506096] Courier dispatched
2022-01-14 09:28:26.639778+0100 OrderManagementSystem[9962:506096] Order prepared
2022-01-14 09:28:26.640114+0100 OrderManagementSystem[9962:506096] Courier arrived
2022-01-14 09:28:26.640364+0100 OrderManagementSystem[9962:506096] Courier arrived
2022-01-14 09:28:26.640589+0100 OrderManagementSystem[9962:506096] Order picked up
2022-01-14 09:28:26.640902+0100 OrderManagementSystem[9962:506096] Courier wait time: 9506 ms
2022-01-14 09:28:26.641181+0100 OrderManagementSystem[9962:506096] Courier arrived
2022-01-14 09:28:26.641411+0100 OrderManagementSystem[9962:506096] Order picked up
2022-01-14 09:28:26.641619+0100 OrderManagementSystem[9962:506096] Food wait time: 5506 ms
2022-01-14 09:28:26.641831+0100 OrderManagementSystem[9962:506096] Order picked up
2022-01-14 09:28:26.642030+0100 OrderManagementSystem[9962:506096] Food wait time: 5000 ms
2022-01-14 09:28:26.642307+0100 OrderManagementSystem[9962:506096] Order picked up
2022-01-14 09:28:26.645272+0100 OrderManagementSystem[9962:506096] Food wait time: 4000 ms
2022-01-14 09:28:27.326860+0100 OrderManagementSystem[9962:497627] Courier arrived
2022-01-14 09:28:27.327587+0100 OrderManagementSystem[9962:497627] Courier arrived
2022-01-14 09:28:27.328095+0100 OrderManagementSystem[9962:497627] Order picked up
2022-01-14 09:28:27.328468+0100 OrderManagementSystem[9962:497627] Food wait time: 6194 ms
2022-01-14 09:28:27.328875+0100 OrderManagementSystem[9962:497627] Courier arrived
2022-01-14 09:28:27.329276+0100 OrderManagementSystem[9962:497627] Order picked up
2022-01-14 09:28:27.329701+0100 OrderManagementSystem[9962:497627] Food wait time: 7688 ms
2022-01-14 09:28:27.638620+0100 OrderManagementSystem[9962:506096] Order received
2022-01-14 09:28:27.638829+0100 OrderManagementSystem[9962:506096] Courier dispatched
2022-01-14 09:28:27.639290+0100 OrderManagementSystem[9962:506096] Order received
2022-01-14 09:28:27.639477+0100 OrderManagementSystem[9962:506096] Courier dispatched
2022-01-14 09:28:27.639894+0100 OrderManagementSystem[9962:506096] Order prepared
2022-01-14 09:28:27.640204+0100 OrderManagementSystem[9962:506096] Order prepared
2022-01-14 09:28:27.640484+0100 OrderManagementSystem[9962:506096] Courier arrived
2022-01-14 09:28:28.638526+0100 OrderManagementSystem[9962:506096] Order received
2022-01-14 09:28:28.638664+0100 OrderManagementSystem[9962:506096] Courier dispatched
2022-01-14 09:28:28.638985+0100 OrderManagementSystem[9962:506096] Order received
2022-01-14 09:28:28.639074+0100 OrderManagementSystem[9962:506096] Courier dispatched
2022-01-14 09:28:28.639342+0100 OrderManagementSystem[9962:506096] Courier arrived
2022-01-14 09:28:29.637544+0100 OrderManagementSystem[9962:506096] Order received
2022-01-14 09:28:29.637670+0100 OrderManagementSystem[9962:506096] Courier dispatched
2022-01-14 09:28:29.637970+0100 OrderManagementSystem[9962:506096] Order received
2022-01-14 09:28:29.638066+0100 OrderManagementSystem[9962:506096] Courier dispatched
2022-01-14 09:28:29.638532+0100 OrderManagementSystem[9962:497627] Order prepared
2022-01-14 09:28:29.638803+0100 OrderManagementSystem[9962:497627] Courier arrived
2022-01-14 09:28:29.639084+0100 OrderManagementSystem[9962:497627] Order picked up
2022-01-14 09:28:29.639300+0100 OrderManagementSystem[9962:497627] Courier wait time: 2000 ms
2022-01-14 09:28:29.639480+0100 OrderManagementSystem[9962:497627] Order picked up
2022-01-14 09:28:29.639733+0100 OrderManagementSystem[9962:497627] Food wait time: 5512 ms
2022-01-14 09:28:30.638309+0100 OrderManagementSystem[9962:506096] Courier arrived
2022-01-14 09:28:30.638713+0100 OrderManagementSystem[9962:506096] Order prepared
2022-01-14 09:28:30.639071+0100 OrderManagementSystem[9962:506096] Order picked up
2022-01-14 09:28:30.639375+0100 OrderManagementSystem[9962:506096] Courier wait time: 7000 ms
2022-01-14 09:28:30.639623+0100 OrderManagementSystem[9962:506096] Order picked up
2022-01-14 09:28:30.639810+0100 OrderManagementSystem[9962:506096] Food wait time: 2999 ms
2022-01-14 09:28:30.640000+0100 OrderManagementSystem[9962:506096] Order received
2022-01-14 09:28:30.640075+0100 OrderManagementSystem[9962:506096] Courier dispatched
2022-01-14 09:28:30.640288+0100 OrderManagementSystem[9962:506096] Order received
2022-01-14 09:28:30.640361+0100 OrderManagementSystem[9962:506096] Courier dispatched
2022-01-14 09:28:30.929531+0100 OrderManagementSystem[9962:505471] Order prepared
2022-01-14 09:28:30.929944+0100 OrderManagementSystem[9962:505471] Courier arrived
2022-01-14 09:28:30.930399+0100 OrderManagementSystem[9962:505471] Order prepared
2022-01-14 09:28:30.930738+0100 OrderManagementSystem[9962:505471] Courier arrived
2022-01-14 09:28:30.931047+0100 OrderManagementSystem[9962:505471] Order prepared
2022-01-14 09:28:30.931361+0100 OrderManagementSystem[9962:505471] Order picked up
2022-01-14 09:28:30.931725+0100 OrderManagementSystem[9962:505471] Food wait time: 0 ms
2022-01-14 09:28:31.638605+0100 OrderManagementSystem[9962:505471] Order received
2022-01-14 09:28:31.638820+0100 OrderManagementSystem[9962:505471] Courier dispatched
2022-01-14 09:28:31.639354+0100 OrderManagementSystem[9962:505471] Order received
2022-01-14 09:28:31.639909+0100 OrderManagementSystem[9962:505471] Courier arrived
2022-01-14 09:28:31.640265+0100 OrderManagementSystem[9962:505471] Courier arrived
2022-01-14 09:28:31.640389+0100 OrderManagementSystem[9962:505471] Courier dispatched
2022-01-14 09:28:31.640703+0100 OrderManagementSystem[9962:505471] Courier arrived
2022-01-14 09:28:31.641024+0100 OrderManagementSystem[9962:505471] Order picked up
2022-01-14 09:28:31.641293+0100 OrderManagementSystem[9962:505471] Food wait time: 12000 ms
2022-01-14 09:28:32.638661+0100 OrderManagementSystem[9962:505471] Order received
2022-01-14 09:28:32.638870+0100 OrderManagementSystem[9962:505471] Courier dispatched
2022-01-14 09:28:32.639330+0100 OrderManagementSystem[9962:505471] Order received
2022-01-14 09:28:32.639500+0100 OrderManagementSystem[9962:505471] Courier dispatched
2022-01-14 09:28:32.639865+0100 OrderManagementSystem[9962:505471] Courier arrived
2022-01-14 09:28:33.638911+0100 OrderManagementSystem[9962:505471] Order received
2022-01-14 09:28:33.639266+0100 OrderManagementSystem[9962:505471] Courier dispatched
2022-01-14 09:28:33.639711+0100 OrderManagementSystem[9962:505471] Order received
2022-01-14 09:28:33.639900+0100 OrderManagementSystem[9962:505471] Courier dispatched
2022-01-14 09:28:33.640247+0100 OrderManagementSystem[9962:505471] Courier arrived
2022-01-14 09:28:33.640571+0100 OrderManagementSystem[9962:505471] Order prepared
2022-01-14 09:28:33.640980+0100 OrderManagementSystem[9962:505471] Order prepared
2022-01-14 09:28:33.641403+0100 OrderManagementSystem[9962:505471] Order picked up
2022-01-14 09:28:33.641779+0100 OrderManagementSystem[9962:505471] Courier wait time: 1000 ms
2022-01-14 09:28:33.642045+0100 OrderManagementSystem[9962:505471] Courier arrived
2022-01-14 09:28:33.642322+0100 OrderManagementSystem[9962:505471] Order prepared
2022-01-14 09:28:33.642588+0100 OrderManagementSystem[9962:505471] Order prepared
2022-01-14 09:28:33.642875+0100 OrderManagementSystem[9962:505471] Order picked up
2022-01-14 09:28:33.643159+0100 OrderManagementSystem[9962:505471] Courier wait time: 0 ms
2022-01-14 09:28:33.643520+0100 OrderManagementSystem[9962:505471] Order picked up
2022-01-14 09:28:33.646160+0100 OrderManagementSystem[9962:505471] Courier wait time: 6312 ms
2022-01-14 09:28:34.638623+0100 OrderManagementSystem[9962:506032] Order received
2022-01-14 09:28:34.638827+0100 OrderManagementSystem[9962:506032] Courier dispatched
2022-01-14 09:28:34.639274+0100 OrderManagementSystem[9962:506032] Order received
2022-01-14 09:28:34.639432+0100 OrderManagementSystem[9962:506032] Courier dispatched
2022-01-14 09:28:34.639870+0100 OrderManagementSystem[9962:506032] Order prepared
2022-01-14 09:28:34.640284+0100 OrderManagementSystem[9962:506032] Courier arrived
2022-01-14 09:28:34.640573+0100 OrderManagementSystem[9962:506032] Courier arrived
2022-01-14 09:28:34.640832+0100 OrderManagementSystem[9962:506032] Order prepared
2022-01-14 09:28:34.641116+0100 OrderManagementSystem[9962:506032] Order picked up
2022-01-14 09:28:34.641376+0100 OrderManagementSystem[9962:506032] Food wait time: 10000 ms
2022-01-14 09:28:34.641646+0100 OrderManagementSystem[9962:506032] Order picked up
2022-01-14 09:28:34.641877+0100 OrderManagementSystem[9962:506032] Courier wait time: 3000 ms
2022-01-14 09:28:35.638003+0100 OrderManagementSystem[9962:497627] Order received
2022-01-14 09:28:35.638383+0100 OrderManagementSystem[9962:497627] Courier arrived
2022-01-14 09:28:35.638671+0100 OrderManagementSystem[9962:497627] Order prepared
2022-01-14 09:28:35.638941+0100 OrderManagementSystem[9962:497627] Order prepared
2022-01-14 09:28:35.639190+0100 OrderManagementSystem[9962:497627] Courier arrived
2022-01-14 09:28:35.639391+0100 OrderManagementSystem[9962:497627] Order picked up
2022-01-14 09:28:35.639629+0100 OrderManagementSystem[9962:497627] Food wait time: 1999 ms
2022-01-14 09:28:35.639721+0100 OrderManagementSystem[9962:497627] Courier dispatched
2022-01-14 09:28:35.639963+0100 OrderManagementSystem[9962:497627] Order received
2022-01-14 09:28:35.640048+0100 OrderManagementSystem[9962:497627] Courier dispatched
2022-01-14 09:28:35.640237+0100 OrderManagementSystem[9962:497627] Order picked up
2022-01-14 09:28:35.640412+0100 OrderManagementSystem[9962:497627] Courier wait time: 10999 ms
2022-01-14 09:28:35.640603+0100 OrderManagementSystem[9962:497627] Order picked up
2022-01-14 09:28:35.640773+0100 OrderManagementSystem[9962:497627] Food wait time: 7999 ms
2022-01-14 09:28:35.643688+0100 OrderManagementSystem[9962:497627] Order picked up
2022-01-14 09:28:35.644083+0100 OrderManagementSystem[9962:497627] Courier wait time: 4708 ms
2022-01-14 09:28:35.935130+0100 OrderManagementSystem[9962:506032] Courier arrived
2022-01-14 09:28:35.935529+0100 OrderManagementSystem[9962:506032] Order prepared
2022-01-14 09:28:35.935890+0100 OrderManagementSystem[9962:506032] Courier arrived
2022-01-14 09:28:35.936213+0100 OrderManagementSystem[9962:506032] Courier arrived
2022-01-14 09:28:35.936473+0100 OrderManagementSystem[9962:506032] Order picked up
2022-01-14 09:28:35.936729+0100 OrderManagementSystem[9962:506032] Food wait time: 5005 ms
2022-01-14 09:28:36.637654+0100 OrderManagementSystem[9962:505643] Order received
2022-01-14 09:28:36.637869+0100 OrderManagementSystem[9962:505643] Courier dispatched
2022-01-14 09:28:36.638281+0100 OrderManagementSystem[9962:505643] Order received
2022-01-14 09:28:36.638445+0100 OrderManagementSystem[9962:505643] Courier dispatched
2022-01-14 09:28:36.638778+0100 OrderManagementSystem[9962:505643] Courier arrived
2022-01-14 09:28:36.639072+0100 OrderManagementSystem[9962:505643] Order prepared
2022-01-14 09:28:36.639377+0100 OrderManagementSystem[9962:505643] Order prepared
2022-01-14 09:28:36.639668+0100 OrderManagementSystem[9962:505643] Order prepared
2022-01-14 09:28:36.639955+0100 OrderManagementSystem[9962:505643] Order picked up
2022-01-14 09:28:36.640230+0100 OrderManagementSystem[9962:505643] Courier wait time: 8000 ms
2022-01-14 09:28:37.638603+0100 OrderManagementSystem[9962:505643] Order received
2022-01-14 09:28:37.638802+0100 OrderManagementSystem[9962:505643] Courier dispatched
2022-01-14 09:28:37.639260+0100 OrderManagementSystem[9962:505643] Order received
2022-01-14 09:28:37.639429+0100 OrderManagementSystem[9962:505643] Courier dispatched
2022-01-14 09:28:37.639832+0100 OrderManagementSystem[9962:505643] Courier arrived
2022-01-14 09:28:37.640185+0100 OrderManagementSystem[9962:505643] Courier arrived
2022-01-14 09:28:37.640476+0100 OrderManagementSystem[9962:505643] Order picked up
2022-01-14 09:28:37.640787+0100 OrderManagementSystem[9962:505643] Food wait time: 6709 ms
2022-01-14 09:28:37.641070+0100 OrderManagementSystem[9962:505643] Order prepared
2022-01-14 09:28:37.641318+0100 OrderManagementSystem[9962:505643] Order picked up
2022-01-14 09:28:37.641536+0100 OrderManagementSystem[9962:505643] Food wait time: 1000 ms
2022-01-14 09:28:38.638673+0100 OrderManagementSystem[9962:505470] Order received
2022-01-14 09:28:38.638875+0100 OrderManagementSystem[9962:505470] Courier dispatched
2022-01-14 09:28:38.639253+0100 OrderManagementSystem[9962:505470] Order received
2022-01-14 09:28:38.639441+0100 OrderManagementSystem[9962:505470] Courier dispatched
2022-01-14 09:28:38.639814+0100 OrderManagementSystem[9962:505470] Order prepared
2022-01-14 09:28:38.640113+0100 OrderManagementSystem[9962:505470] Courier arrived
2022-01-14 09:28:38.640404+0100 OrderManagementSystem[9962:505470] Order prepared
2022-01-14 09:28:38.640662+0100 OrderManagementSystem[9962:505470] Order picked up
2022-01-14 09:28:38.640952+0100 OrderManagementSystem[9962:505470] Courier wait time: 2704 ms
2022-01-14 09:28:38.641229+0100 OrderManagementSystem[9962:505470] Order prepared
2022-01-14 09:28:38.641497+0100 OrderManagementSystem[9962:505470] Courier arrived
2022-01-14 09:28:38.641749+0100 OrderManagementSystem[9962:505470] Courier arrived
2022-01-14 09:28:38.642020+0100 OrderManagementSystem[9962:505470] Order picked up
2022-01-14 09:28:38.642325+0100 OrderManagementSystem[9962:505470] Food wait time: 2704 ms
2022-01-14 09:28:39.638522+0100 OrderManagementSystem[9962:505470] Order received
2022-01-14 09:28:39.638659+0100 OrderManagementSystem[9962:505470] Courier dispatched
2022-01-14 09:28:39.639008+0100 OrderManagementSystem[9962:505470] Order received
2022-01-14 09:28:39.639151+0100 OrderManagementSystem[9962:505470] Courier dispatched
2022-01-14 09:28:39.639441+0100 OrderManagementSystem[9962:505470] Courier arrived
2022-01-14 09:28:39.639683+0100 OrderManagementSystem[9962:505470] Order prepared
2022-01-14 09:28:39.639956+0100 OrderManagementSystem[9962:505470] Order prepared
2022-01-14 09:28:39.640270+0100 OrderManagementSystem[9962:505470] Order prepared
2022-01-14 09:28:39.640512+0100 OrderManagementSystem[9962:505470] Order picked up
2022-01-14 09:28:39.640704+0100 OrderManagementSystem[9962:505470] Courier wait time: 1000 ms
2022-01-14 09:28:39.640942+0100 OrderManagementSystem[9962:505470] Order picked up
2022-01-14 09:28:39.641141+0100 OrderManagementSystem[9962:505470] Courier wait time: 6000 ms
2022-01-14 09:28:39.641335+0100 OrderManagementSystem[9962:505470] Order picked up
2022-01-14 09:28:39.641581+0100 OrderManagementSystem[9962:505470] Courier wait time: 3000 ms
2022-01-14 09:28:40.432973+0100 OrderManagementSystem[9962:497627] Order prepared
2022-01-14 09:28:40.638504+0100 OrderManagementSystem[9962:497627] Order received
2022-01-14 09:28:40.638642+0100 OrderManagementSystem[9962:497627] Courier dispatched
2022-01-14 09:28:40.638987+0100 OrderManagementSystem[9962:497627] Order received
2022-01-14 09:28:40.639113+0100 OrderManagementSystem[9962:497627] Courier dispatched
2022-01-14 09:28:41.637772+0100 OrderManagementSystem[9962:505471] Order received
2022-01-14 09:28:41.637910+0100 OrderManagementSystem[9962:505471] Courier dispatched
2022-01-14 09:28:41.638238+0100 OrderManagementSystem[9962:505471] Order received
2022-01-14 09:28:41.638324+0100 OrderManagementSystem[9962:505471] Courier dispatched
2022-01-14 09:28:41.638535+0100 OrderManagementSystem[9962:505471] Courier arrived
2022-01-14 09:28:41.638752+0100 OrderManagementSystem[9962:505471] Order picked up
2022-01-14 09:28:41.638962+0100 OrderManagementSystem[9962:505471] Food wait time: 6999 ms
2022-01-14 09:28:42.431336+0100 OrderManagementSystem[9962:506032] Order prepared
2022-01-14 09:28:42.431812+0100 OrderManagementSystem[9962:506032] Order prepared
2022-01-14 09:28:42.432124+0100 OrderManagementSystem[9962:506032] Order prepared
2022-01-14 09:28:42.432374+0100 OrderManagementSystem[9962:506032] Order picked up
2022-01-14 09:28:42.432645+0100 OrderManagementSystem[9962:506032] Courier wait time: 10792 ms
2022-01-14 09:28:42.432886+0100 OrderManagementSystem[9962:506032] Order prepared
2022-01-14 09:28:42.433110+0100 OrderManagementSystem[9962:506032] Order picked up
2022-01-14 09:28:42.433312+0100 OrderManagementSystem[9962:506032] Courier wait time: 7792 ms
2022-01-14 09:28:42.433487+0100 OrderManagementSystem[9962:506032] Order picked up
2022-01-14 09:28:42.433687+0100 OrderManagementSystem[9962:506032] Courier wait time: 3792 ms
2022-01-14 09:28:42.637606+0100 OrderManagementSystem[9962:506032] Order received
2022-01-14 09:28:42.637761+0100 OrderManagementSystem[9962:506032] Courier dispatched
2022-01-14 09:28:42.638187+0100 OrderManagementSystem[9962:506032] Order received
2022-01-14 09:28:42.638349+0100 OrderManagementSystem[9962:506032] Courier dispatched
2022-01-14 09:28:43.134646+0100 OrderManagementSystem[9962:506096] Order prepared
2022-01-14 09:28:43.135036+0100 OrderManagementSystem[9962:506096] Order prepared
2022-01-14 09:28:43.135455+0100 OrderManagementSystem[9962:506096] Courier arrived
2022-01-14 09:28:43.135768+0100 OrderManagementSystem[9962:506096] Courier arrived
2022-01-14 09:28:43.136029+0100 OrderManagementSystem[9962:506096] Order prepared
2022-01-14 09:28:43.136279+0100 OrderManagementSystem[9962:506096] Order picked up
2022-01-14 09:28:43.136546+0100 OrderManagementSystem[9962:506096] Food wait time: 6496 ms
2022-01-14 09:28:43.136792+0100 OrderManagementSystem[9962:506096] Order picked up
2022-01-14 09:28:43.137005+0100 OrderManagementSystem[9962:506096] Food wait time: 704 ms
2022-01-14 09:28:43.638162+0100 OrderManagementSystem[9962:506096] Order received
2022-01-14 09:28:43.638313+0100 OrderManagementSystem[9962:506096] Courier dispatched
2022-01-14 09:28:43.638680+0100 OrderManagementSystem[9962:506096] Order received
2022-01-14 09:28:43.638802+0100 OrderManagementSystem[9962:506096] Courier dispatched
2022-01-14 09:28:43.926770+0100 OrderManagementSystem[9962:505470] Courier arrived
2022-01-14 09:28:43.927126+0100 OrderManagementSystem[9962:505470] Courier arrived
2022-01-14 09:28:43.927426+0100 OrderManagementSystem[9962:505470] Courier arrived
2022-01-14 09:28:43.927682+0100 OrderManagementSystem[9962:505470] Order prepared
2022-01-14 09:28:43.927926+0100 OrderManagementSystem[9962:505470] Order picked up
2022-01-14 09:28:43.928145+0100 OrderManagementSystem[9962:505470] Food wait time: 792 ms
2022-01-14 09:28:43.928390+0100 OrderManagementSystem[9962:505470] Order picked up
2022-01-14 09:28:43.928634+0100 OrderManagementSystem[9962:505470] Food wait time: 5288 ms
2022-01-14 09:28:44.637720+0100 OrderManagementSystem[9962:505470] Order received
2022-01-14 09:28:44.637888+0100 OrderManagementSystem[9962:505470] Courier dispatched
2022-01-14 09:28:44.638264+0100 OrderManagementSystem[9962:505470] Order received
2022-01-14 09:28:44.638400+0100 OrderManagementSystem[9962:505470] Courier dispatched
2022-01-14 09:28:45.233822+0100 OrderManagementSystem[9962:505470] Courier arrived
2022-01-14 09:28:45.234382+0100 OrderManagementSystem[9962:505470] Courier arrived
2022-01-14 09:28:45.234801+0100 OrderManagementSystem[9962:505470] Order picked up
2022-01-14 09:28:45.235231+0100 OrderManagementSystem[9962:505470] Food wait time: 4801 ms
2022-01-14 09:28:45.637657+0100 OrderManagementSystem[9962:505470] Order received
2022-01-14 09:28:45.637789+0100 OrderManagementSystem[9962:505470] Courier dispatched
2022-01-14 09:28:45.638150+0100 OrderManagementSystem[9962:505470] Order received
2022-01-14 09:28:45.638267+0100 OrderManagementSystem[9962:505470] Courier dispatched
2022-01-14 09:28:45.638864+0100 OrderManagementSystem[9962:506096] Courier arrived
2022-01-14 09:28:45.639266+0100 OrderManagementSystem[9962:506096] Courier arrived
2022-01-14 09:28:45.639713+0100 OrderManagementSystem[9962:506096] Courier arrived
2022-01-14 09:28:45.640024+0100 OrderManagementSystem[9962:506096] Order picked up
2022-01-14 09:28:45.640262+0100 OrderManagementSystem[9962:506096] Food wait time: 7000 ms
2022-01-14 09:28:45.640579+0100 OrderManagementSystem[9962:506096] Order prepared
2022-01-14 09:28:45.640890+0100 OrderManagementSystem[9962:506096] Courier arrived
2022-01-14 09:28:45.641133+0100 OrderManagementSystem[9962:506096] Order prepared
2022-01-14 09:28:45.641394+0100 OrderManagementSystem[9962:506096] Order picked up
2022-01-14 09:28:45.641625+0100 OrderManagementSystem[9962:506096] Food wait time: 1712 ms
2022-01-14 09:28:45.641839+0100 OrderManagementSystem[9962:506096] Order picked up
2022-01-14 09:28:45.643730+0100 OrderManagementSystem[9962:506096] Food wait time: 8000 ms
2022-01-14 09:28:45.644122+0100 OrderManagementSystem[9962:506096] Order picked up
2022-01-14 09:28:45.644455+0100 OrderManagementSystem[9962:506096] Courier wait time: 9704 ms
2022-01-14 09:28:46.637684+0100 OrderManagementSystem[9962:505470] Order prepared
2022-01-14 09:28:46.638009+0100 OrderManagementSystem[9962:505470] Courier arrived
2022-01-14 09:28:46.638311+0100 OrderManagementSystem[9962:505470] Order received
2022-01-14 09:28:46.638558+0100 OrderManagementSystem[9962:505470] Order picked up
2022-01-14 09:28:46.638822+0100 OrderManagementSystem[9962:505470] Courier wait time: 6999 ms
2022-01-14 09:28:46.638948+0100 OrderManagementSystem[9962:505470] Courier dispatched
2022-01-14 09:28:46.639233+0100 OrderManagementSystem[9962:505470] Order received
2022-01-14 09:28:46.639485+0100 OrderManagementSystem[9962:505470] Order picked up
2022-01-14 09:28:46.639723+0100 OrderManagementSystem[9962:505470] Food wait time: 3503 ms
2022-01-14 09:28:46.639880+0100 OrderManagementSystem[9962:505470] Courier dispatched
2022-01-14 09:28:47.236116+0100 OrderManagementSystem[9962:506098] Courier arrived
2022-01-14 09:28:47.236532+0100 OrderManagementSystem[9962:506098] Order prepared
2022-01-14 09:28:47.237024+0100 OrderManagementSystem[9962:506098] Order picked up
2022-01-14 09:28:47.237416+0100 OrderManagementSystem[9962:506098] Courier wait time: 3309 ms
2022-01-14 09:28:47.638922+0100 OrderManagementSystem[9962:505471] Order received
2022-01-14 09:28:47.639234+0100 OrderManagementSystem[9962:505471] Courier dispatched
2022-01-14 09:28:47.639707+0100 OrderManagementSystem[9962:505471] Order received
2022-01-14 09:28:47.639894+0100 OrderManagementSystem[9962:505471] Courier dispatched
2022-01-14 09:28:47.640268+0100 OrderManagementSystem[9962:505471] Order prepared
2022-01-14 09:28:47.640642+0100 OrderManagementSystem[9962:505471] Courier arrived
2022-01-14 09:28:47.640978+0100 OrderManagementSystem[9962:505471] Order prepared
2022-01-14 09:28:47.641317+0100 OrderManagementSystem[9962:505471] Courier arrived
2022-01-14 09:28:47.641650+0100 OrderManagementSystem[9962:505471] Order picked up
2022-01-14 09:28:47.641964+0100 OrderManagementSystem[9962:505471] Food wait time: 4504 ms
2022-01-14 09:28:47.642265+0100 OrderManagementSystem[9962:505471] Order prepared
2022-01-14 09:28:48.638762+0100 OrderManagementSystem[9962:505471] Order received
2022-01-14 09:28:48.638995+0100 OrderManagementSystem[9962:505471] Courier dispatched
2022-01-14 09:28:48.639481+0100 OrderManagementSystem[9962:505471] Order received
2022-01-14 09:28:48.639667+0100 OrderManagementSystem[9962:505471] Courier dispatched
2022-01-14 09:28:48.640020+0100 OrderManagementSystem[9962:505471] Courier arrived
2022-01-14 09:28:48.640417+0100 OrderManagementSystem[9962:505471] Courier arrived
2022-01-14 09:28:48.640760+0100 OrderManagementSystem[9962:505471] Courier arrived
2022-01-14 09:28:48.641029+0100 OrderManagementSystem[9962:505471] Courier arrived
2022-01-14 09:28:48.641314+0100 OrderManagementSystem[9962:505471] Order picked up
2022-01-14 09:28:48.641579+0100 OrderManagementSystem[9962:505471] Food wait time: 1000 ms
2022-01-14 09:28:48.641861+0100 OrderManagementSystem[9962:505471] Courier arrived
2022-01-14 09:28:49.638791+0100 OrderManagementSystem[9962:506096] Order received
2022-01-14 09:28:49.638996+0100 OrderManagementSystem[9962:506096] Courier dispatched
2022-01-14 09:28:49.639381+0100 OrderManagementSystem[9962:506096] Order received
2022-01-14 09:28:49.639565+0100 OrderManagementSystem[9962:506096] Courier dispatched
2022-01-14 09:28:49.639954+0100 OrderManagementSystem[9962:506096] Order prepared
2022-01-14 09:28:49.640321+0100 OrderManagementSystem[9962:506096] Order prepared
2022-01-14 09:28:49.640684+0100 OrderManagementSystem[9962:506096] Order picked up
2022-01-14 09:28:49.641035+0100 OrderManagementSystem[9962:506096] Courier wait time: 1000 ms
2022-01-14 09:28:50.638228+0100 OrderManagementSystem[9962:506096] Order received
2022-01-14 09:28:50.638466+0100 OrderManagementSystem[9962:506096] Courier dispatched
2022-01-14 09:28:50.638998+0100 OrderManagementSystem[9962:506096] Order received
2022-01-14 09:28:50.639212+0100 OrderManagementSystem[9962:506096] Courier dispatched
2022-01-14 09:28:50.639591+0100 OrderManagementSystem[9962:506096] Order prepared
2022-01-14 09:28:50.639972+0100 OrderManagementSystem[9962:506096] Order prepared
2022-01-14 09:28:50.926678+0100 OrderManagementSystem[9962:506096] Courier arrived
2022-01-14 09:28:51.638010+0100 OrderManagementSystem[9962:506096] Order received
2022-01-14 09:28:51.638218+0100 OrderManagementSystem[9962:506096] Courier dispatched
2022-01-14 09:28:51.638608+0100 OrderManagementSystem[9962:506096] Order received
2022-01-14 09:28:51.638772+0100 OrderManagementSystem[9962:506096] Courier dispatched
2022-01-14 09:28:51.639144+0100 OrderManagementSystem[9962:506096] Order prepared
2022-01-14 09:28:51.639479+0100 OrderManagementSystem[9962:506096] Courier arrived
2022-01-14 09:28:51.639791+0100 OrderManagementSystem[9962:506096] Courier arrived
2022-01-14 09:28:51.640069+0100 OrderManagementSystem[9962:506096] Order picked up
2022-01-14 09:28:51.640337+0100 OrderManagementSystem[9962:506096] Courier wait time: 2999 ms
2022-01-14 09:28:51.640602+0100 OrderManagementSystem[9962:506096] Order picked up
2022-01-14 09:28:51.640847+0100 OrderManagementSystem[9962:506096] Food wait time: 1000 ms
2022-01-14 09:28:52.638594+0100 OrderManagementSystem[9962:506096] Order received
2022-01-14 09:28:52.638754+0100 OrderManagementSystem[9962:506096] Courier dispatched
2022-01-14 09:28:52.639097+0100 OrderManagementSystem[9962:506096] Order received
2022-01-14 09:28:52.639248+0100 OrderManagementSystem[9962:506096] Courier dispatched
2022-01-14 09:28:52.639553+0100 OrderManagementSystem[9962:506096] Courier arrived
2022-01-14 09:28:52.639857+0100 OrderManagementSystem[9962:506096] Order prepared
2022-01-14 09:28:52.640185+0100 OrderManagementSystem[9962:506096] Order picked up
2022-01-14 09:28:52.640460+0100 OrderManagementSystem[9962:506096] Food wait time: 7000 ms
2022-01-14 09:28:52.640720+0100 OrderManagementSystem[9962:506096] Order prepared
2022-01-14 09:28:52.640954+0100 OrderManagementSystem[9962:506096] Courier arrived
2022-01-14 09:28:52.641194+0100 OrderManagementSystem[9962:506096] Order picked up
2022-01-14 09:28:52.641429+0100 OrderManagementSystem[9962:506096] Courier wait time: 5403 ms
2022-01-14 09:28:52.641672+0100 OrderManagementSystem[9962:506096] Order picked up
2022-01-14 09:28:52.641903+0100 OrderManagementSystem[9962:506096] Food wait time: 5000 ms
2022-01-14 09:28:52.927161+0100 OrderManagementSystem[9962:506098] Order prepared
2022-01-14 09:28:53.638839+0100 OrderManagementSystem[9962:506096] Order received
2022-01-14 09:28:53.639094+0100 OrderManagementSystem[9962:506096] Courier dispatched
2022-01-14 09:28:53.639580+0100 OrderManagementSystem[9962:506096] Order received
2022-01-14 09:28:53.639803+0100 OrderManagementSystem[9962:506096] Courier dispatched
2022-01-14 09:28:53.640156+0100 OrderManagementSystem[9962:506096] Order prepared
2022-01-14 09:28:53.640537+0100 OrderManagementSystem[9962:506096] Courier arrived
2022-01-14 09:28:53.640898+0100 OrderManagementSystem[9962:506096] Order picked up
2022-01-14 09:28:53.641215+0100 OrderManagementSystem[9962:506096] Courier wait time: 6000 ms
2022-01-14 09:28:53.641509+0100 OrderManagementSystem[9962:506096] Order prepared
2022-01-14 09:28:53.641785+0100 OrderManagementSystem[9962:506096] Order picked up
2022-01-14 09:28:53.642074+0100 OrderManagementSystem[9962:506096] Courier wait time: 8405 ms
2022-01-14 09:28:53.642342+0100 OrderManagementSystem[9962:506096] Order picked up
2022-01-14 09:28:53.642597+0100 OrderManagementSystem[9962:506096] Food wait time: 4000 ms
2022-01-14 09:28:54.637874+0100 OrderManagementSystem[9962:506096] Order received
2022-01-14 09:28:54.638176+0100 OrderManagementSystem[9962:506096] Courier dispatched
2022-01-14 09:28:54.638697+0100 OrderManagementSystem[9962:506096] Order received
2022-01-14 09:28:54.638965+0100 OrderManagementSystem[9962:506096] Courier dispatched
2022-01-14 09:28:55.637821+0100 OrderManagementSystem[9962:506098] Courier arrived
2022-01-14 09:28:55.638189+0100 OrderManagementSystem[9962:506098] Order received
2022-01-14 09:28:55.638527+0100 OrderManagementSystem[9962:506098] Order prepared
2022-01-14 09:28:55.638805+0100 OrderManagementSystem[9962:506098] Order picked up
2022-01-14 09:28:55.639036+0100 OrderManagementSystem[9962:506098] Food wait time: 2999 ms
2022-01-14 09:28:55.639118+0100 OrderManagementSystem[9962:506098] Courier dispatched
2022-01-14 09:28:55.639330+0100 OrderManagementSystem[9962:506098] Courier arrived
2022-01-14 09:28:55.639611+0100 OrderManagementSystem[9962:506098] Order received
2022-01-14 09:28:55.639738+0100 OrderManagementSystem[9962:506098] Courier dispatched
2022-01-14 09:28:55.639989+0100 OrderManagementSystem[9962:506098] Order picked up
2022-01-14 09:28:55.640215+0100 OrderManagementSystem[9962:506098] Courier wait time: 6999 ms
2022-01-14 09:28:55.640400+0100 OrderManagementSystem[9962:506098] Courier arrived
2022-01-14 09:28:55.640600+0100 OrderManagementSystem[9962:506098] Order picked up
2022-01-14 09:28:55.640812+0100 OrderManagementSystem[9962:506098] Food wait time: 7999 ms
2022-01-14 09:28:56.135204+0100 OrderManagementSystem[9962:497627] Courier arrived
2022-01-14 09:28:56.135606+0100 OrderManagementSystem[9962:497627] Order prepared
2022-01-14 09:28:56.638642+0100 OrderManagementSystem[9962:497627] Order received
2022-01-14 09:28:56.638789+0100 OrderManagementSystem[9962:497627] Courier dispatched
2022-01-14 09:28:56.639102+0100 OrderManagementSystem[9962:497627] Order received
2022-01-14 09:28:56.639191+0100 OrderManagementSystem[9962:497627] Courier dispatched
2022-01-14 09:28:56.639485+0100 OrderManagementSystem[9962:497627] Order prepared
2022-01-14 09:28:56.639746+0100 OrderManagementSystem[9962:497627] Courier arrived
2022-01-14 09:28:56.640000+0100 OrderManagementSystem[9962:497627] Order picked up
2022-01-14 09:28:56.640203+0100 OrderManagementSystem[9962:497627] Courier wait time: 11000 ms
2022-01-14 09:28:56.917552+0100 OrderManagementSystem[9962:505471] Order prepared
2022-01-14 09:28:56.918052+0100 OrderManagementSystem[9962:505471] Order prepared
2022-01-14 09:28:56.919201+0100 OrderManagementSystem[9962:505471] Order picked up
2022-01-14 09:28:56.919673+0100 OrderManagementSystem[9962:505471] Courier wait time: 783 ms
2022-01-14 09:28:56.920199+0100 OrderManagementSystem[9962:505471] Order picked up
2022-01-14 09:28:56.920649+0100 OrderManagementSystem[9962:505471] Courier wait time: 5991 ms
2022-01-14 09:28:57.638634+0100 OrderManagementSystem[9962:505471] Order received
2022-01-14 09:28:57.638778+0100 OrderManagementSystem[9962:505471] Courier dispatched
2022-01-14 09:28:57.639146+0100 OrderManagementSystem[9962:505471] Order received
2022-01-14 09:28:57.639286+0100 OrderManagementSystem[9962:505471] Courier dispatched
2022-01-14 09:28:57.639569+0100 OrderManagementSystem[9962:505471] Courier arrived
2022-01-14 09:28:57.639802+0100 OrderManagementSystem[9962:505471] Order picked up
2022-01-14 09:28:57.640019+0100 OrderManagementSystem[9962:505471] Food wait time: 7001 ms
2022-01-14 09:28:58.030580+0100 OrderManagementSystem[9962:505471] Courier arrived
2022-01-14 09:28:58.637838+0100 OrderManagementSystem[9962:505471] Order received
2022-01-14 09:28:58.638044+0100 OrderManagementSystem[9962:505471] Courier dispatched
2022-01-14 09:28:58.638429+0100 OrderManagementSystem[9962:505471] Order received
2022-01-14 09:28:58.638554+0100 OrderManagementSystem[9962:505471] Courier dispatched
2022-01-14 09:28:58.638880+0100 OrderManagementSystem[9962:505471] Order prepared
2022-01-14 09:28:58.639196+0100 OrderManagementSystem[9962:505471] Courier arrived
2022-01-14 09:28:58.639461+0100 OrderManagementSystem[9962:505471] Order picked up
2022-01-14 09:28:58.639733+0100 OrderManagementSystem[9962:505471] Courier wait time: 3000 ms
2022-01-14 09:28:58.640042+0100 OrderManagementSystem[9962:505471] Order prepared
2022-01-14 09:28:58.640275+0100 OrderManagementSystem[9962:505471] Order prepared
2022-01-14 09:28:58.640495+0100 OrderManagementSystem[9962:505471] Order picked up
2022-01-14 09:28:58.640703+0100 OrderManagementSystem[9962:505471] Courier wait time: 0 ms
2022-01-14 09:28:58.927023+0100 OrderManagementSystem[9962:506096] Order prepared
2022-01-14 09:28:58.927504+0100 OrderManagementSystem[9962:506096] Order prepared
2022-01-14 09:28:58.927973+0100 OrderManagementSystem[9962:506096] Courier arrived
2022-01-14 09:28:59.638701+0100 OrderManagementSystem[9962:506096] Order received
2022-01-14 09:28:59.638896+0100 OrderManagementSystem[9962:506096] Courier dispatched
2022-01-14 09:28:59.639412+0100 OrderManagementSystem[9962:506096] Order received
2022-01-14 09:28:59.639695+0100 OrderManagementSystem[9962:506096] Courier dispatched
2022-01-14 09:28:59.640126+0100 OrderManagementSystem[9962:506096] Order prepared
2022-01-14 09:28:59.640571+0100 OrderManagementSystem[9962:506096] Courier arrived
2022-01-14 09:28:59.640907+0100 OrderManagementSystem[9962:506096] Order picked up
2022-01-14 09:28:59.641189+0100 OrderManagementSystem[9962:506096] Courier wait time: 11000 ms
2022-01-14 09:28:59.641473+0100 OrderManagementSystem[9962:506096] Order prepared
2022-01-14 09:28:59.641715+0100 OrderManagementSystem[9962:506096] Order prepared
2022-01-14 09:28:59.642001+0100 OrderManagementSystem[9962:506096] Courier arrived
2022-01-14 09:28:59.642248+0100 OrderManagementSystem[9962:506096] Order picked up
2022-01-14 09:28:59.642463+0100 OrderManagementSystem[9962:506096] Courier wait time: 3000 ms
2022-01-14 09:28:59.642683+0100 OrderManagementSystem[9962:506096] Courier arrived
2022-01-14 09:28:59.642910+0100 OrderManagementSystem[9962:506096] Order picked up
2022-01-14 09:28:59.645705+0100 OrderManagementSystem[9962:506096] Food wait time: 6712 ms
2022-01-14 09:29:00.638327+0100 OrderManagementSystem[9962:506096] Order received
2022-01-14 09:29:00.638516+0100 OrderManagementSystem[9962:506096] Courier dispatched
2022-01-14 09:29:00.639181+0100 OrderManagementSystem[9962:506096] Order received
2022-01-14 09:29:00.639322+0100 OrderManagementSystem[9962:506096] Courier dispatched
2022-01-14 09:29:00.639744+0100 OrderManagementSystem[9962:506096] Order prepared
2022-01-14 09:29:00.640153+0100 OrderManagementSystem[9962:506096] Order picked up
2022-01-14 09:29:00.640652+0100 OrderManagementSystem[9962:506096] Courier wait time: 9000 ms
2022-01-14 09:29:00.641023+0100 OrderManagementSystem[9962:506096] Order prepared
2022-01-14 09:29:00.641328+0100 OrderManagementSystem[9962:506096] Order prepared
2022-01-14 09:29:00.641606+0100 OrderManagementSystem[9962:506096] Order prepared
2022-01-14 09:29:00.641905+0100 OrderManagementSystem[9962:506096] Order prepared
2022-01-14 09:29:00.642233+0100 OrderManagementSystem[9962:506096] Order picked up
2022-01-14 09:29:00.642466+0100 OrderManagementSystem[9962:506096] Courier wait time: 999 ms
2022-01-14 09:29:01.638302+0100 OrderManagementSystem[9962:506098] Courier arrived
2022-01-14 09:29:01.638630+0100 OrderManagementSystem[9962:506098] Order prepared
2022-01-14 09:29:01.638980+0100 OrderManagementSystem[9962:506098] Order received
2022-01-14 09:29:01.639255+0100 OrderManagementSystem[9962:506098] Courier arrived
2022-01-14 09:29:01.639466+0100 OrderManagementSystem[9962:506098] Courier arrived
2022-01-14 09:29:01.639742+0100 OrderManagementSystem[9962:506098] Order picked up
2022-01-14 09:29:01.639987+0100 OrderManagementSystem[9962:506098] Courier wait time: 1999 ms
2022-01-14 09:29:01.640097+0100 OrderManagementSystem[9962:506098] Courier dispatched
2022-01-14 09:29:01.640326+0100 OrderManagementSystem[9962:506098] Order received
2022-01-14 09:29:01.640439+0100 OrderManagementSystem[9962:506098] Courier dispatched
2022-01-14 09:29:01.640655+0100 OrderManagementSystem[9962:506098] Order picked up
2022-01-14 09:29:01.640869+0100 OrderManagementSystem[9962:506098] Food wait time: 1000 ms
2022-01-14 09:29:01.641068+0100 OrderManagementSystem[9962:506098] Order picked up
2022-01-14 09:29:01.641247+0100 OrderManagementSystem[9962:506098] Food wait time: 2711 ms
2022-01-14 09:29:01.643721+0100 OrderManagementSystem[9962:506098] Order picked up
2022-01-14 09:29:01.644168+0100 OrderManagementSystem[9962:506098] Food wait time: 3000 ms
2022-01-14 09:29:01.822783+0100 OrderManagementSystem[9962:497627] Order prepared
2022-01-14 09:29:01.823072+0100 OrderManagementSystem[9962:497627] Courier arrived
2022-01-14 09:29:02.637884+0100 OrderManagementSystem[9962:505471] Courier arrived
2022-01-14 09:29:02.638229+0100 OrderManagementSystem[9962:505471] Order received
2022-01-14 09:29:02.638520+0100 OrderManagementSystem[9962:505471] Courier arrived
2022-01-14 09:29:02.638794+0100 OrderManagementSystem[9962:505471] Order prepared
2022-01-14 09:29:02.639047+0100 OrderManagementSystem[9962:505471] Courier arrived
2022-01-14 09:29:02.639139+0100 OrderManagementSystem[9962:505471] Courier dispatched
2022-01-14 09:29:02.639368+0100 OrderManagementSystem[9962:505471] Order received
2022-01-14 09:29:02.639457+0100 OrderManagementSystem[9962:505471] Courier dispatched
2022-01-14 09:29:02.639699+0100 OrderManagementSystem[9962:505471] Order picked up
2022-01-14 09:29:02.639920+0100 OrderManagementSystem[9962:505471] Courier wait time: 0 ms
2022-01-14 09:29:03.638019+0100 OrderManagementSystem[9962:505471] Order received
2022-01-14 09:29:03.638474+0100 OrderManagementSystem[9962:505471] Courier arrived
2022-01-14 09:29:03.638995+0100 OrderManagementSystem[9962:505471] Order picked up
2022-01-14 09:29:03.639490+0100 OrderManagementSystem[9962:505471] Food wait time: 3999 ms
2022-01-14 09:29:03.639624+0100 OrderManagementSystem[9962:505471] Courier dispatched
2022-01-14 09:29:03.639919+0100 OrderManagementSystem[9962:505471] Order received
2022-01-14 09:29:03.640064+0100 OrderManagementSystem[9962:505471] Courier dispatched
2022-01-14 09:29:03.640376+0100 OrderManagementSystem[9962:505471] Courier arrived
2022-01-14 09:29:03.640715+0100 OrderManagementSystem[9962:505471] Order picked up
2022-01-14 09:29:03.640995+0100 OrderManagementSystem[9962:505471] Food wait time: 3000 ms
2022-01-14 09:29:04.516671+0100 OrderManagementSystem[9962:506096] Order prepared
2022-01-14 09:29:04.517165+0100 OrderManagementSystem[9962:506096] Courier arrived
2022-01-14 09:29:04.517605+0100 OrderManagementSystem[9962:506096] Order prepared
2022-01-14 09:29:04.518047+0100 OrderManagementSystem[9962:506096] Order picked up
2022-01-14 09:29:04.518394+0100 OrderManagementSystem[9962:506096] Food wait time: 8382 ms
2022-01-14 09:29:04.518791+0100 OrderManagementSystem[9962:506096] Order picked up
2022-01-14 09:29:04.519099+0100 OrderManagementSystem[9962:506096] Courier wait time: 5590 ms
2022-01-14 09:29:04.519419+0100 OrderManagementSystem[9962:506096] Order picked up
2022-01-14 09:29:04.519779+0100 OrderManagementSystem[9962:506096] Courier wait time: 2694 ms
2022-01-14 09:29:04.638705+0100 OrderManagementSystem[9962:506096] Order received
2022-01-14 09:29:04.638871+0100 OrderManagementSystem[9962:506096] Courier dispatched
2022-01-14 09:29:04.639252+0100 OrderManagementSystem[9962:506096] Order received
2022-01-14 09:29:04.639384+0100 OrderManagementSystem[9962:506096] Courier dispatched
2022-01-14 09:29:04.639748+0100 OrderManagementSystem[9962:506096] Order prepared
2022-01-14 09:29:04.640154+0100 OrderManagementSystem[9962:506096] Courier arrived
2022-01-14 09:29:04.640492+0100 OrderManagementSystem[9962:506096] Order prepared
2022-01-14 09:29:04.640751+0100 OrderManagementSystem[9962:506096] Order picked up
2022-01-14 09:29:04.641046+0100 OrderManagementSystem[9962:506096] Courier wait time: 2001 ms
2022-01-14 09:29:04.641297+0100 OrderManagementSystem[9962:506096] Order prepared
2022-01-14 09:29:04.641518+0100 OrderManagementSystem[9962:506096] Courier arrived
2022-01-14 09:29:04.641718+0100 OrderManagementSystem[9962:506096] Courier arrived
2022-01-14 09:29:04.641936+0100 OrderManagementSystem[9962:506096] Order prepared
2022-01-14 09:29:04.642134+0100 OrderManagementSystem[9962:506096] Order picked up
2022-01-14 09:29:04.642308+0100 OrderManagementSystem[9962:506096] Food wait time: 4001 ms
2022-01-14 09:29:04.642526+0100 OrderManagementSystem[9962:506096] Courier arrived
2022-01-14 09:29:05.710862+0100 OrderManagementSystem[9962:505470] Order prepared
2022-01-14 09:29:05.711355+0100 OrderManagementSystem[9962:505470] Order prepared
2022-01-14 09:29:05.711754+0100 OrderManagementSystem[9962:505470] Order picked up
2022-01-14 09:29:05.712204+0100 OrderManagementSystem[9962:505470] Courier wait time: 7680 ms
2022-01-14 09:29:06.638943+0100 OrderManagementSystem[9962:505643] Courier arrived
2022-01-14 09:29:06.639319+0100 OrderManagementSystem[9962:505643] Courier arrived
2022-01-14 09:29:06.639770+0100 OrderManagementSystem[9962:505643] Order picked up
2022-01-14 09:29:06.640117+0100 OrderManagementSystem[9962:505643] Food wait time: 2000 ms
2022-01-14 09:29:06.640488+0100 OrderManagementSystem[9962:505643] Order prepared
2022-01-14 09:29:06.640852+0100 OrderManagementSystem[9962:505643] Order picked up
2022-01-14 09:29:06.641150+0100 OrderManagementSystem[9962:505643] Courier wait time: 2000 ms
2022-01-14 09:29:07.935470+0100 OrderManagementSystem[9962:506097] Courier arrived
2022-01-14 09:29:07.935907+0100 OrderManagementSystem[9962:506097] Order prepared
2022-01-14 09:29:07.936304+0100 OrderManagementSystem[9962:506097] Courier arrived
2022-01-14 09:29:07.936594+0100 OrderManagementSystem[9962:506097] Order prepared
2022-01-14 09:29:07.936821+0100 OrderManagementSystem[9962:506097] Courier arrived
2022-01-14 09:29:07.937035+0100 OrderManagementSystem[9962:506097] Order picked up
2022-01-14 09:29:07.937228+0100 OrderManagementSystem[9962:506097] Food wait time: 3297 ms
2022-01-14 09:29:07.937474+0100 OrderManagementSystem[9962:506097] Order picked up
2022-01-14 09:29:07.937678+0100 OrderManagementSystem[9962:506097] Courier wait time: 0 ms
2022-01-14 09:29:09.026421+0100 OrderManagementSystem[9962:505643] Order prepared
2022-01-14 09:29:09.027011+0100 OrderManagementSystem[9962:505643] Courier arrived
2022-01-14 09:29:09.027447+0100 OrderManagementSystem[9962:505643] Order picked up
2022-01-14 09:29:09.027795+0100 OrderManagementSystem[9962:505643] Food wait time: 1090 ms
2022-01-14 09:29:10.510640+0100 OrderManagementSystem[9962:497627] Courier arrived
2022-01-14 09:29:10.511218+0100 OrderManagementSystem[9962:497627] Courier arrived
2022-01-14 09:29:11.630629+0100 OrderManagementSystem[9962:506096] Courier arrived
2022-01-14 09:29:11.631016+0100 OrderManagementSystem[9962:506096] Courier arrived
2022-01-14 09:29:11.631393+0100 OrderManagementSystem[9962:506096] Order picked up
2022-01-14 09:29:11.631738+0100 OrderManagementSystem[9962:506096] Food wait time: 12704 ms
2022-01-14 09:29:11.632089+0100 OrderManagementSystem[9962:506096] Order prepared
2022-01-14 09:29:11.632358+0100 OrderManagementSystem[9962:506096] Order picked up
2022-01-14 09:29:11.632637+0100 OrderManagementSystem[9962:506096] Food wait time: 6992 ms
2022-01-14 09:29:11.632913+0100 OrderManagementSystem[9962:506096] Order picked up
2022-01-14 09:29:11.633188+0100 OrderManagementSystem[9962:506096] Courier wait time: 3695 ms
2022-01-14 09:29:12.335554+0100 OrderManagementSystem[9962:505643] Order prepared
2022-01-14 09:29:12.336125+0100 OrderManagementSystem[9962:505643] Order prepared
2022-01-14 09:29:12.336511+0100 OrderManagementSystem[9962:505643] Order picked up
2022-01-14 09:29:12.336864+0100 OrderManagementSystem[9962:505643] Courier wait time: 1824 ms
2022-01-14 09:29:12.337210+0100 OrderManagementSystem[9962:505643] Courier arrived
2022-01-14 09:29:12.337630+0100 OrderManagementSystem[9962:505643] Order prepared
2022-01-14 09:29:12.338006+0100 OrderManagementSystem[9962:505643] Courier arrived
2022-01-14 09:29:12.338354+0100 OrderManagementSystem[9962:505643] Order prepared
2022-01-14 09:29:12.338632+0100 OrderManagementSystem[9962:505643] Order prepared
2022-01-14 09:29:12.338968+0100 OrderManagementSystem[9962:505643] Order picked up
2022-01-14 09:29:12.339263+0100 OrderManagementSystem[9962:505643] Courier wait time: 9697 ms
2022-01-14 09:29:12.339564+0100 OrderManagementSystem[9962:505643] Order picked up
2022-01-14 09:29:12.339875+0100 OrderManagementSystem[9962:505643] Courier wait time: 1824 ms
2022-01-14 09:29:12.340171+0100 OrderManagementSystem[9962:505643] Order picked up
2022-01-14 09:29:12.342410+0100 OrderManagementSystem[9962:505643] Food wait time: 10512 ms
2022-01-14 09:29:12.342685+0100 OrderManagementSystem[9962:505643] Order picked up
2022-01-14 09:29:12.342948+0100 OrderManagementSystem[9962:505643] Courier wait time: 7696 ms
2022-01-14 09:29:13.935297+0100 OrderManagementSystem[9962:506032] Order prepared
2022-01-14 09:29:13.936003+0100 OrderManagementSystem[9962:506032] Courier arrived
2022-01-14 09:29:13.936521+0100 OrderManagementSystem[9962:506032] Order picked up
2022-01-14 09:29:13.936862+0100 OrderManagementSystem[9962:506032] Food wait time: 8224 ms
2022-01-14 09:29:13.937206+0100 OrderManagementSystem[9962:506032] Order picked up
2022-01-14 09:29:13.937539+0100 OrderManagementSystem[9962:506032] Courier wait time: 9296 ms
2022-01-14 09:29:15.727021+0100 OrderManagementSystem[9962:505643] Order prepared
2022-01-14 09:29:15.727416+0100 OrderManagementSystem[9962:505643] Order prepared
2022-01-14 09:29:15.727825+0100 OrderManagementSystem[9962:505643] Courier arrived
2022-01-14 09:29:15.728183+0100 OrderManagementSystem[9962:505643] Order picked up
2022-01-14 09:29:15.728542+0100 OrderManagementSystem[9962:505643] Courier wait time: 3392 ms
2022-01-14 09:29:15.728892+0100 OrderManagementSystem[9962:505643] Order picked up
2022-01-14 09:29:15.729168+0100 OrderManagementSystem[9962:505643] Courier wait time: 9088 ms
2022-01-14 09:29:15.729488+0100 OrderManagementSystem[9962:505643] Order picked up
2022-01-14 09:29:15.729786+0100 OrderManagementSystem[9962:505643] Food wait time: 6701 ms
2022-01-14 09:29:17.638827+0100 OrderManagementSystem[9962:506097] Courier arrived
2022-01-14 09:29:17.639201+0100 OrderManagementSystem[9962:506097] Order picked up
2022-01-14 09:29:17.639612+0100 OrderManagementSystem[9962:506097] Food wait time: 5304 ms
2022-01-14 09:29:17.639932+0100 OrderManagementSystem[9962:506097] Average order wait time: 4567 ms
2022-01-14 09:29:17.640170+0100 OrderManagementSystem[9962:506097] Average courier wait time: 4694 ms

```

</details>


## Author

[Amer Hukić](https://amerhukic.com)

## License

OrderManagementSystem is licensed under the MIT license. Check the [LICENSE](LICENSE) file for details.
