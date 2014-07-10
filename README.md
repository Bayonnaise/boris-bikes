## Boris Bikes

In week 3 at Makers Academy we started on OOP, building a Boris Bike rental system using Bike, DockingStation, Van, Garage and Person classes.

--

# Version 1:
First we used the Chicago style, using RSpec tests that required other classes in order to function.

--

# Version 2:
Once that was complete we went back to try rebuilding the system using London style testing, making each spec file self-contained through the use of doubles and shared_examples. It proved messy, as the original design wasn't really made with these techniques in mind.

--

# Version 3:
Instead I started from scratch on my own, this time designing the classes and tests from the outside-in, using doubles to test the actions of each class before its collaborators had been implemented.
