CREATE CONSTRAINT ON (a:AnatomyStructure) ASSERT a.id IS UNIQUE;
CREATE CONSTRAINT ON (e:Assay) ASSERT e.id IS UNIQUE;
CREATE CONSTRAINT ON (au:Author) ASSERT au.name IS UNIQUE;
CREATE CONSTRAINT ON (g:Gene) ASSERT g.id IS UNIQUE;
CREATE CONSTRAINT ON (s:Source) ASSERT s.id IS UNIQUE;
CREATE CONSTRAINT ON (sp:Specimen) ASSERT sp.id IS UNIQUE;
CREATE CONSTRAINT ON (st:Stage) ASSERT st.id IS UNIQUE;

// Create Sources
USING PERIODIC COMMIT 1000
LOAD CSV WITH HEADERS FROM "file:/home/callum/Documents/Uni/F20PA/Project/Neo4j/Data/Sources.csv" AS row

MERGE (source:Source {sourceID: TOINT(row.source_id)})

SET source.sourceName = row.name

;

// Create Stage
USING PERIODIC COMMIT 1000
LOAD CSV WITH HEADERS FROM "file:/home/callum/Documents/Uni/F20PA/Project/Neo4j/Data/Stages.csv" AS row

CREATE (stage:Stage {stageID: TOINT(row.id)})

SET stage.theilerStage = TOINT(row.theilerstage),
	stage.dpc = row.dpc

;

// Create Specimen
USING PERIODIC COMMIT 1000
LOAD CSV WITH HEADERS FROM "file:/home/callum/Documents/Uni/F20PA/Project/Neo4j/Data/Specimens.csv" AS row

MATCH (stage:Stage {stageID: TOINT(row.stage_id)}) 

CREATE (specimen:Specimen {specimenID: TOINT(row.id)})

SET specimen.strain = row.strain,
	specimen.type = row.type

CREATE (specimen)-[:HAS]->(stage)

;

// Create AnatomyStructure
USING PERIODIC COMMIT 1000
LOAD CSV WITH HEADERS FROM "file:/home/callum/Documents/Uni/F20PA/Project/Neo4j/Data/AnatomyStructures.csv" AS row

MATCH (stage:Stage {stageID: TOINT(row.stage_id)})

CREATE (anatomyStructure:AnatomyStructure {structureID: TOINT(row.id)})

SET anatomyStructure.accession = TOINT(row.accession),
	anatomyStructure.term = row.term

CREATE (anatomyStructure)-[:HAS]->(stage)
;


// Create Assays
USING PERIODIC COMMIT 1000
LOAD CSV WITH HEADERS FROM "file:/home/callum/Documents/Uni/F20PA/Project/Neo4j/Data/Assays.csv" AS row

MATCH (source:Source {sourceID : TOINT(row.source_id)})
MATCH (specimen:Specimen {specimenID : TOINT(row.specimen_id)})
MATCH (stage:Stage {stageID : TOINT(row.stage_id)})

CREATE (assay:Assay {emageID: TOINT(row.emage_id)})
SET assay.probeID = row.probe_id,
	assay.type = row.type

CREATE (assay)-[:COMES_FROM]->(source)
CREATE (assay)-[:HAS]->(specimen)
CREATE (assay)-[:HAS]->(stage)

;


// Create Publications
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:/home/callum/Documents/Uni/F20PA/Project/Neo4j/Data/Publications.csv" AS row

MATCH (assay:Assay {emageID : TOINT(row.emage_id)})

CREATE (publication:Publication { accession: TOINT(row.accession)})
SET publication.title = row.title,
 	publication.author = row.author

CREATE (publication)-[:DESCRIBES]->(assay)

;

// Create Genes
USING PERIODIC COMMIT 1000
LOAD CSV WITH HEADERS FROM "file:/home/callum/Documents/Uni/F20PA/Project/Neo4j/Data/Genes.csv" AS row
MERGE (gene:Gene {geneID: TOINT(row.id), accession: row.accession, name: row.name});

// Create TextAnnotation
USING PERIODIC COMMIT 1000
LOAD CSV WITH HEADERS FROM "file:/home/callum/Documents/Uni/F20PA/Project/Neo4j/Data/TextAnnotations.csv" AS row

MATCH (assay:Assay {emageID : TOINT(row.emage_id)})
MATCH (structureID:AnatomyStructure {structureID: TOINT(row.structure_id)})
MATCH (gene:Gene {geneID: TOINT(row.gene_id)})

CREATE (annotation:TextAnnotation {
	strength: row.strength
	})

CREATE (annotation)-[r:REPORTS]->(assay)
CREATE (annotation)-[:HAS]->(anatomyStructure)
CREATE (annotation)-[:HAS]->(gene)

SET r.detected = CASE TOINT(line.detected) WHEN 1 THEN true ELSE false END 

;