# Boris Bikes

In week 3 at Makers Academy we started learning about OOP, building a Boris Bike rental system using Bike, DockingStation, Van, Garage and Person classes.

--

### Version 1:
First we used the Chicago style of testing, using RSpec tests that required other classes in order to function.

### Version 2:
Once that was complete we went back to try rebuilding the system using London style testing, making each spec file self-contained through the use of doubles and shared_examples. It proved messy, as the original design wasn't really made with these techniques in mind.

### Version 3:
Instead I started from scratch on my own, this time designing the classes and tests with the London style in mind, using doubles to test the actions of each class before its collaborators had been implemented.

--

### How to run tests
```shell
git clone https://github.com/Bayonnaise/boris-bikes.git
cd boris-bikes/Version_3
rspec
```
