import csv

from pymongo import MongoClient

connection = MongoClient()

db = connection["mongomodel3"]
emage = db["emage"]

with open("Data/Assays.csv") as file1:
    reader1 = csv.DictReader(file1, delimiter=",")
    for row in reader1:
      emage.insert({
         '_id': int(row['emage_id']),
         'probeID':row['probe_id'],
         'type':row['assay_type'],
         'source':row['name'],
         'specimen' : {'type':row['type'],'strain':row['strain']},
         'stage' : {'theilerstage':int(row['theilerstage']),'dpc':row['dpc']}})


with open("Data/Publications.csv") as file2:
   reader2 = csv.DictReader(file2, delimiter=",")
   for row in reader2:
      emage.update_many({'_id': int(row['emage_id'])},
         {'$push' : {'publication' : {'publicationID' : int(row['accession']), 'title' : row['title'], 'author' : row['author']}}},
         upsert=False)


with open("Data/TextAnnotations.csv") as file3:
   reader3 = csv.DictReader(file3, delimiter=",")
   for row in reader3:
      emage.update_many({'_id': int(row['emage_id'])},
         {'$push' : { 'textannotation' : {'strength' : row['strength'],
         'anatomystructure' : {'structureID' : int(row['EMAPA']),'term' : row['term']},
         'gene' : {'geneID' : row['accession'],'name' : row['name']}}}},
         upsert=False)