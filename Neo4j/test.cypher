// Create Sources
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM " file:/home/callum/Documents/Uni/F20PA/Project/Neo4j/" AS row
CREATE (:Source {sourceID: row.source_id, sourceName: row.name});