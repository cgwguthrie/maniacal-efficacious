import csv
import pprint
#This first function 'getTerm', takes in a file stream and returns an array of lines describing the GO term.
# It does so by extracting lines after the block header
#([Term] or [Typedef]) and stopping at the next block header.

def getTerm(stream):
  block = []
  for line in stream:
    if line.strip() == "[Term]" or line.strip() == "[Typedef]":
      break
    else:
      if line.strip() != "":
        block.append(line.strip())

  return block

#The second function parses each block returned by the 'getTerm' function into a dictionary of tag-value pairs.
def parseTagValue(term):
  data = {}
  for line in term:
    tag = line.split(': ',1)[0]
    value = line.split(': ',1)[1]
    if not data.has_key(tag):
      data[tag] = []

    data[tag].append(value)

  return data
oboFile = open('EMAPA.obo','r') 

# declare a blank dictionary# keys are the goids
terms = {}
#skip the file header lines
getTerm(oboFile)
tmp = []
part_of_list = []
#infinite loop to go through the obo file.
#Breaks when the term returned is empty, indicating end of file
while 1:
  #get the term using the two parsing functions
  term = parseTagValue(getTerm(oboFile))
  if len(term) != 0:
    termID = term['id'][0]
    if term.has_key('relationship'):
      tmp.append([p.split()[1] for p in term['relationship']])
      print tmp[1:-1]
    #only add to the structure if the term has a is_a tag
    #the is_a value contain GOID and term definition
    #we only want the GOID
    if term.has_key('is_a'):
      termParents = [p.split()[0] for p in term['is_a']]

      if not terms.has_key(termID):
        #each goid will have two arrays of parents and children
        terms[termID] = {'p':[],'c':[]}

      #append parents of the current term
      terms[termID]['p'] = termParents

      #for every parent term, add this current term as children
      for termParent in termParents:
        if not terms.has_key(termParent):
          terms[termParent] = {'p':[],'c':[]}
        terms[termParent]['c'].append(termID)
  else:
    break
def getDescendents(goid):
  recursiveArray = [goid]
  if terms.has_key(goid):
    children = terms[goid]['c']
    if len(children) > 0:
      for child in children:
        recursiveArray.extend(getDescendents(child))

  return set(recursiveArray)

def getAncestors(goid):
  recursiveArray = [goid]
  if terms.has_key(goid):
    parents = terms[goid]['p']
    if len(parents) > 0:
      for parent in parents:
        recursiveArray.extend(getAncestors(parent))

  return set(recursiveArray)

