// Create AnatomyStructure
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:/home/callum/Documents/Uni/F20PA/Project/Neo4j/Data/AnatomyStructures.csv" AS row
CREATE (:AnatomyStructure {structureID: toInt(row.anatomystructure_id), accession: toInt(row.term_id), term: row.term, stage: toInt(row.stage_id)})

// Create Assays
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:/home/callum/Documents/Uni/F20PA/Project/Neo4j/Data/Assays.csv" AS row
CREATE (:Assay {emageID: toInt(row.assay_emage_id), probeID: row.probe_id, type: row.type, source:toInt(row.source_id)});

// Create Genes
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:/home/callum/Documents/Uni/F20PA/Project/Neo4j/Data/Genes.csv" AS row
CREATE (:Gene {geneID: toInt(row.gene_id), accession: row.accession, name: row.symbol});

// Create Publications
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:/home/callum/Documents/Uni/F20PA/Project/Neo4j/Data/Publications.csv" AS row
CREATE (:Publication {publicationID: toInt(row.id), accession: row.publication_id, title: row.title, author : row.author, emageID: toInt(row.emage_id)});

// Create Sources
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:/home/callum/Documents/Uni/F20PA/Project/Neo4j/Data/Sources.csv" AS row
CREATE (:Source {sourceID: toInt(row.source_id), sourceName: row.name});

// Create Specimen
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:/home/callum/Documents/Uni/F20PA/Project/Neo4j/Data/Specimens.csv" AS row
CREATE (:Specimen {specimenID: toInt(row.id), strain: row.strain, type: row.type, emageID: toInt(row.emage_id), stage:toInt(row.stage_id)});

// Create Stage
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:/home/callum/Documents/Uni/F20PA/Project/Neo4j/Data/Stages.csv" AS row
CREATE (:Stage {stageID: toInt(row.stage_id), theilerStage: row.theilerstage, dpc: row.dpc, emageID: toInt(row.emage_id)});

// Create TextAnnotation
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:/home/callum/Documents/Uni/F20PA/Project/Neo4j/Data/TextAnnotations.csv" AS row
CREATE (:TextAnnotation {annotationID: toInt(row.id), strength: row.strength, emageID: toInt(row.emage_id), structureID: toInt(row.structure_id), geneID:toInt(row.gene_id), detected: toInt(row.detected)});

CREATE INDEX ON :AnatomyStructure(structureID);
CREATE INDEX ON :AnatomyStructure(stage);
CREATE INDEX ON :Assay(source);
CREATE INDEX ON :Gene(geneID);
CREATE INDEX ON :Publication(emageID);
CREATE INDEX ON :Sources(sourceID);
CREATE INDEX ON :Specimen(emageID);
CREATE INDEX ON :Specimen(stage);
CREATE INDEX ON :Stage(emageID);
CREATE INDEX ON :TextAnnotation(emageID);
CREATE INDEX ON :TextAnnotation(structureID);
CREATE INDEX ON :TextAnnotation(geneID);