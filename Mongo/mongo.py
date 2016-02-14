import csv

from pymongo import MongoClient

connection = MongoClient()

db = connection["mongomodel3"]
emage = db["emage"]

with open("emage_submissions.tsv") as file1:
    reader1 = csv.DictReader(file1, delimiter="\t")
    for row in reader1:
      emage.insert({
         '_id': int(row['EMAGE_ID']),
         'probe_id':row['Probe_ID'],
         'assay_type':row['Assay_Type'],
         'assay_source':row['Assay_Source'],
         'specimen' : {'specimen_type':row['Specimen_Type'],'specimen_strain':row['Specimen_Strain']},
         'stage' : {'theiler_stage':row['Theiler_Stage'],'user_stage':row['User_Stage']}})

with open("emage_publications.tsv") as file2:
   reader2 = csv.DictReader(file2, delimiter="\t")
   for row in reader2:
      emage.update_many({'_id': int(row['EMAGE_ID'])},
         {'$push' : {'publication' : {'publication_id' : row['Publication_ID'], 'publication_title' : row['Title'], 'publication_author' : row['Authors']}}},
         upsert=False)

with open("emage_annotations.tsv") as file3:
   reader3 = csv.DictReader(file3, delimiter="\t")
   for row in reader3:
      emage.update_many({'_id': int(row['EMAGE_ID'])},
         {'$push' : { 'textannotation' : {'strength' : row['Strength'],
         'anatomystructure' : {'term_id' : int(row['Term_ID']),'term' : row['Term']},
         'gene' : {'gene_id' : row['Gene_ID'],'symbol' : row['Symbol']}}}},
         upsert=False)