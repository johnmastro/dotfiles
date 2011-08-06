directions = ['north', 'south', 'east', 'west', 'up', 'down', 'left', 'right']
verbs = ['go', 'eat', 'run', 'kill', 'walk', 'fight']
stops = ['the', 'in', 'of']
nouns = ['bear', 'princess', 'frog', 'knight']

def convert_number(s):
    try:
        return int(s)
    except ValueError:
        return None

class lexicon(object):

    @staticmethod
    def scan(sentence):
        result = []

        for word in sentence.split():
            if word in directions:
                result.append(('direction', word))
            elif word in verbs:
                result.append(('verb', word))
            elif word in stops:
                result.append(('stop', word))
            elif word in nouns:
                result.append(('noun', word))
            elif convert_number(word):
                result.append(('number', convert_number(word)))
            else:
                result.append(('error', word))

        return result

