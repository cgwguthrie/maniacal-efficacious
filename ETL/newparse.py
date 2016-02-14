from __future__ import division

import json
from collections import defaultdict

fname = "EMAPA.obo"
term_head = "[Term]"

#Keep the desired object data here
all_objects = {}

def add_object(d):
    #print(json.dumps(d, indent = 4) + '\n')
    #Ignore obsolete objects
    if "is_obsolete" in d:
        return

    #Gather desired data into a single list,
    # and store it in the main all_objects dict
    key = d["id"][0]
    is_a = d["is_a"]
    relationship = d["relationship"]
    print d["relationship"][0]
    #Remove the next line if you want to keep the is_a description info
    is_a = [s.partition(' ! ')[0] for s in is_a]
    relationship = [s.partition(' ! ')[0] for s in relationship]
    all_objects[key] = d["name"] + is_a + relationship

#A temporary dict to hold object data
current = defaultdict(list)

with open(fname) as f:
    #Skip header data
    for line in f:
        if line.rstrip() == term_head:
            break

    for line in f:
        line = line.rstrip()
        if not line:
            #ignore blank lines
            continue
        if line == term_head:
            #end of term
            add_object(current)
            current = defaultdict(list)
        else:
            #accumulate object data into current
            key, _, val = line.partition(": ")
            current[key].append(val)

if current:
    add_object(current)