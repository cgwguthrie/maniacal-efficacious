CREATE CONSTRAINT ON (a:AnatomyStructure) ASSERT a.id IS UNIQUE;
CREATE CONSTRAINT ON (e:Assay) ASSERT e.id IS UNIQUE;
CREATE CONSTRAINT ON (g:Gene) ASSERT g.id IS UNIQUE;
CREATE CONSTRAINT ON (s:Source) ASSERT s.id IS UNIQUE;
CREATE CONSTRAINT ON (sp:Specimen) ASSERT sp.id IS UNIQUE;
CREATE CONSTRAINT ON (st:Stage) ASSERT st.id IS UNIQUE;

CREATE INDEX ON :AnatomyStructure(structureID);
CREATE INDEX ON :Assay(emageID);
CREATE INDEX ON :Gene(geneID);
CREATE INDEX ON :Specimen(specimenID);
CREATE INDEX ON :Stage(stageID);
CREATE INDEX ON :TextAnnotation(strength);

// Create Sources
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:/home/callum/Documents/Uni/F20PA/Project/Neo4j/Data/Sources.csv" AS row

MERGE (source:Source {sourceID: TOINT(row.source_id)})

SET source.sourceName = row.name

;

// Create Stage
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:/home/callum/Documents/Uni/F20PA/Project/Neo4j/Data/Stages.csv" AS row

MERGE (stage:Stage {stageID: TOINT(row.id)})
SET stage.theilerStage = TOINT(row.theilerstage),
	stage.dpc = row.dpc

;

// Create Specimen
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:/home/callum/Documents/Uni/F20PA/Project/Neo4j/Data/Specimens.csv" AS row

MATCH (stage:Stage {stageID: TOINT(row.stage_id)}) 

MERGE (specimen:Specimen {specimenID: TOINT(row.id)})
SET stage.strain = row.strain,
	stage.type = row.type

CREATE (specimen)-[:GROUPED_BY]->(stage)

;

// Create AnatomyStructure
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:/home/callum/Documents/Uni/F20PA/Project/Neo4j/Data/AnatomyStructures.csv" AS row

MATCH (stage:Stage {stageID: TOINT(row.stage_id)})

MERGE (anatomyStructure:AnatomyStructure {structureID: TOINT(row.id)})
SET anatomyStructure.accession = TOINT(row.accession),
anatomyStructure.term = row.term

CREATE (anatomyStructure)-[:GROUPED_BY]->(stage)
;

// Create Assays
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:/home/callum/Documents/Uni/F20PA/Project/Neo4j/Data/Assays.csv" AS row

MATCH (source:Source {sourceID : TOINT(row.source_id)})
MATCH (specimen:Specimen {specimenID : TOINT(row.specimen_id)})
MATCH (stage:Stage {stageID : TOINT(row.stage_id)})

CREATE (assay:Assay {emageID: TOINT(row.emage_id)})
SET assay.probeID = row.probe_id,
	assay.type = row.type

CREATE (assay)-[:COMES_FROM]->(source)
CREATE (assay)-[:CLASSIFIED_AS]->(specimen)
CREATE (assay)-[:GROUPED_BY]->(stage)

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
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:/home/callum/Documents/Uni/F20PA/Project/Neo4j/Data/Genes.csv" AS row
MERGE (gene:Gene {geneID: TOINT(row.id), accession: row.accession, name: row.name});

// Create TextAnnotation
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:/home/callum/Documents/Uni/F20PA/Project/Neo4j/Data/TextAnnotations.csv" AS row

MATCH (assay:Assay {emageID : TOINT(row.emage_id)})
MATCH (structureID:AnatomyStructure {structureID: TOINT(row.structure_id)})
MATCH (gene:Gene {geneID: TOINT(row.gene_id)})

CREATE (annotation:TextAnnotation {
	strength: row.strength
	})

CREATE (annotation)-[:HAS]->(structureID)
CREATE (annotation)-[:RECORDS]->(gene)
CREATE (annotation)-[r:REPORTS]->(assay)

SET r.detected = CASE row.detected WHEN 1 THEN true ELSE false END

;

// Create Closure
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:/home/callum/Documents/Uni/F20PA/Project/EMAPA/results.csv" AS row

MERGE(parent:Parent {parentID : TOINT(row.parent_id)})
SET parent.term = row.parent_term
MERGE(child:Child{childID : TOINT(row.child_id)})
SET child.term = row.child_term

CREATE (child)-[:PART_OF]->(parent)

;

