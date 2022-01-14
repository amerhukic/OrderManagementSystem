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

1. 
<details> 
  <summary>FIFO strategy simulation</summary>
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
</details>

## Author

[Amer Hukić](https://amerhukic.com)

## License

OrderManagementSystem is licensed under the MIT license. Check the [LICENSE](LICENSE) file for details.
