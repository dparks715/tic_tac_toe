﻿# tic_tac_toe

2 Games of Tic Tac Toe, one for Powershell/console, another as a web app.

Code is centered on using classes to instantiate the objects needed to play.  Any time a new game is started a new board class and two player classes are created.  These classes have access to all their respective functions that tie the actions of the game together.  A final file creates a loop that instantiates the required classes and executes their function in the order needed to play, until a winner or tie is reached.

App uses most of the same methods listed above.  Uses sinatra for web app to navigate routes in the order needed to play rather than using a game loop.
