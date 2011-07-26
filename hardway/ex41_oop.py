import gothontext as txt
from sys import exit
from random import randint


class Game(object):
    def __init__(self, start):
        self.quips = [
            "You died. You kinda suck at this.",
            "Nice job, you died... jackass.",
            "Such a loser.",
            "I have a small puppy that's better at this than you are."
        ]
        self.start = start

    def play(self):
        next = self.start

        while True:
            print "\n----------"
            room = getattr(self, next)
            next = room()

    def death(self):
        print self.quips[randint(0, len(self.quips)-1)]
        print
        exit(1)

    def central_corridor(self):
        print txt.corridor
    
        action = raw_input("> ")
    
        if action == "shoot":
            print txt.corridor_shoot
            return 'death'
    
        elif action == "dodge":
            print txt.corridor_dodge
            return 'death'
    
        elif action == "tell a joke":
            print txt.corridor_joke
            return 'laser_weapon_armory'

    def laser_weapon_armory(self):
        print txt.armory
        code = '111'
        # code = "{}{}{}".format(randint(1,9), randint(1,9), randint(1,9))
        guess = raw_input("[keypad]> ")
        guesses = 0
    
        while guess != code and guesses < 10:
            print "BZZZZEDDD!"
            guesses += 1
            guess = raw_input("[keypad]> ")
    
        if guess == code:
            print txt.armory_right_code
            return 'the_bridge'
        else:
            print txt.armory_wrong_code
            return 'death'

    def the_bridge(self):
        print txt.bridge
        action = raw_input("> ")
    
        if action == "throw the bomb":
            print txt.bridge_throw
            return 'death'
        elif action == "slowly place the bomb":
            print txt.bridge_place
            return 'escape_pod'
        else:
            print "DOES NOT COMPUTE"
            return 'the_bridge'

    def escape_pod(self):
        print txt.escape_pod
    
        good_pod = 1
        # good_pod = randint(1,5)
        guess = raw_input("[pod #]> ")
    
        if int(guess) != good_pod:
            print txt.bad_pod
            return 'death'
        else:
            print txt.good_pod
            exit(0)


a_game = Game("central_corridor")
a_game.play()
