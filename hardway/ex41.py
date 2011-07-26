from sys import exit
from random import randint

def death():
    quips = ["You died. You kinda suck at this.",
             "Nice job, you died... jackass.",
             "Such a loser.",
             "I have a small puppy that's better at this than you are."]

    print quips[randint(0, len(quips)-1)]
    exit(1)

corridor_txt = """
The Gothons of Planet Percal #25 have invaded your ship and destroyed your 
entire crew. You are the last surviving member and your last mission is to get
the neutron destruct bomb from the Weapons Armory, put it in the bridge, and 
blow the ship up after getting into an escape pod.

You're running down the central corridor to the Weapons Armory when a Gothon
jumps out, red scaly skin, dark grimy teeth, and evil clown custume flowing
about his hate-filled body. He's blocking the door to the Armory and about to
pull a weapon to blast you.
"""

corridor_shoot_txt = """
Quick on the draw you yank out your blaster and fire it at the Gothon. His 
clown custume is flowing and moving around his body, which throws off your aim.
Your laser hits his costume but misses him entirely. This complete ruins his
brand new costume which his mother bought him, which makes him fly into an
insane rage and blast you repeatedly in the face until you are dead. Then he 
eats you.
"""

corridor_dodge_txt = """
Like a world class boxer you dodge, weave, slip, and slide right as the 
Gothon's blaster cranks a laser past your head. In the middle of your artful
dodge your foot slips and you bang  your head on the metal wall and pass out.
You wake up shortly after, only to die as the Gothon stomps on your head and
eats you.
"""

corridor_joke_txt = """
Luckily for you, they made you learn Gothon insults in the academy. You tell
the one Gothon joke you know: Lbhe zbgure vf fb sng, jura fur fvgf nebhaq gur
ubhfr, fur fvgf nebhaq gur ubhfr. The Gothon stops, tries not to laugh, then
burts out laughing so hard he can't move. While he's laughing you run up and
shoot him square in the head, killing him, then jump through the Weapon Armory
door.
"""

def central_corridor():
    print corridor_txt

    action = raw_input("> ")

    if action == "shoot":
        print corridor_shoot_txt
        return 'death'

    elif action == "dodge":
        print corridor_dodge_txt
        return 'death'

    elif action == "tell a joke":
        print corridor_joke_txt
        return 'laser_weapon_armory'

armory_txt = """
You do a dive roll into the Weapon Armory, crouch and scan the room for more
Gothons that might be hiding. It's dead quiet, too quiet. You stand up and run
to the far side of the room and find the neutron bomb in its container. There's
a keypad lock on the box and you need the code to get the bomb out. If you get
the code wrong 10 times then the lock closes forever and you can't get the
bomb. The code is 3 digits.
"""

armory_right_code_txt = """
The container clicks open and the seal breaks, letting gas out. You grab the
neutron bomb and run as fast as you can to the bridge, where you must now place
it in the right spot.
"""

armory_wrong_code_txt = """
The lock buzzez one last time and then you hear a sickening melting sound as
the mechanism is fused together. You decide to sit there, and finally  the 
Gothons blow up the ship and you die.
"""

def laser_weapon_armory():
    print armory_txt
    code = '111'
    # code = "{}{}{}".format(randint(1,9), randint(1,9), randint(1,9))
    guess = raw_input("[keypad]> ")
    guesses = 0

    while guess != code and guesses < 10:
        print "BZZZZEDDD!"
        guesses += 1
        guess = raw_input("[keypad]> ")

    if guess == code:
        print armory_right_code_txt
        return 'the_bridge'
    else:
        print armory_wrong_code_txt
        return 'death'

bridge_txt = """
You burst onto the Bridge with the neutron destruct bomb under your arm and
surprise 5 Gothons who are trying to take control of the ship. Each of them has
an even uglier clown costume then the last. They haven't pulled their weapons
out yet, as they see the active bomb under your arm and don't want to set it
off.
"""

bridge_throw_txt = """
In a panic you throw the bomb at the group of Gothons and make a leap for the
door. Right as you drop it a Gothon shoots you in the back, killing you. As you
die you see another Gothon frantically try to disarm the bomb. You die knowing
they will probably blow up when it goes off.
"""

bridge_place_txt = """
You point your blaster at the bomb under your arm and the Gothons put their
hands up and start to sweat. You inch backward to the door, open it, and then
carefully place the bomb on the floor, pointing your blaster at it. You jump
back through the door, punch the close button, and blast the lock so the 
Gothons can't get out. Now that the bomb is in place you run to the escape pod
to get of this tin can.
"""

def the_bridge():
    print bridge_txt
    action = raw_input("> ")

    if action == "throw the bomb":
        print bridge_throw_txt
        return 'death'
    elif action == "slowly place the bomb":
        print bridge_place_txt
        return 'escape_pod'
    else:
        print "DOES NOT COMPUTE"
        return 'the_bridge'

escape_pod_txt = """
You run through the ship desperately  trying to each the escape pod before the
whole ship explodes. It seems like hardly any Gothons are on the ship, so your
run is clear of interference. You get to the chamber with the escape pods, and
now need to pick one to take. Some of them could be damaged but you don't have
time to look. There are 5 pods; which one do you take?
"""

bad_pod_txt = """
You jump into a pod and hit the eject button. The pod escapes into the void of
space, then implodes as the hull ruptures, crushing your body into jam jelly.
"""

good_pod_txt = """
You jump into a pod and hit the eject button. The pod easily slides out into
space, heading to the planet below. As it flies to the planet, you look back
and see yoru ship implode, then explode, like bright star. The Gothon ship is
taken out at the same time. 

You won!
"""

def escape_pod():
    print escape_pod_txt

    good_pod = 1
    # good_pod = randint(1,5)
    guess = raw_input("[pod #]> ")

    if int(guess) != good_pod:
        print bad_pod_txt
        return 'death'
    else:
        print good_pod_txt
        exit(0)

ROOMS = {
    'death': death,
    'central_corridor': central_corridor,
    'laser_weapon_armory': laser_weapon_armory,
    'the_bridge': the_bridge,
    'escape_pod': escape_pod
}

def runner(the_map, start):
    next = start

    while True:
        room = the_map[next]
        print "\n----------"
        next = room()

runner(ROOMS, 'central_corridor')


