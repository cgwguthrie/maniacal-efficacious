// Assays, Specimens, Source, Stage
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM
'file:/home/callum/Documents/Uni/F20PA/Project/Neo4j/Data/emage_submissions.csv' AS line WITH line

CREATE (assay:Assay {id : TOINT(line.emage_id)})

MERGE (specimen:Specimen {type : (line.specimentype)})
MERGE (source:Source {name : (line.source)})
MERGE (stage:Stage {theilerstage: TOINT((line.theilerstage))})

CREATE (assay)-[:HAS]->(source)
CREATE (assay)-[:HAS]->(specimen)
CREATE (assay)-[:HAS]->(stage)

;