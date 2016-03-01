CREATE TABLE assays(
   emageID int,
   assayType text,
   theilerStage int,
   dpc text,
   specimenType text,
   specimenStrain text,
   probeID text,
   source text,
   PRIMARY KEY (emageID)
   );

COPY assays (emageID,assayType,dpc,probeid,source,specimenstrain,specimentype,theilerstage)
FROM '~/Desktop/emage_submissions.csv'
WITH DELIMITER = ','
AND HEADER = TRUE;

CREATE TABLE assayByStage(
   emageID int,
   theilerStage int,
   dpc text,
   probeID text,
   source text,
   PRIMARY KEY (theilerStage, emageID)
   );

COPY assays (theilerstage,emageID,dpc,probeid,source)
FROM '~/Desktop/emage_submissions1.csv'
WITH DELIMITER = ','
AND HEADER = TRUE;

CREATE TABLE assayBySpecimen(
   emageID int,
   specimenType text,
   specimenStrain text,
   probeID text,
   source text,
   PRIMARY KEY (specimenType, emageID)
   );

COPY assays (specimenType,emageID,probeid,source,specimenstrain)
FROM '~/Desktop/emage_submissions2.csv'
WITH DELIMITER = ','
AND HEADER = TRUE;

CREATE TABLE publications(
	publicationID text,
	title text,
	author set <text>,
	emageID int,
	PRIMARY KEY(emageID)
	);

COPY publications (publicationID,title, emageID, author)
FROM '~/Desktop/emage_publications.csv'
WITH DELIMITER = ','
AND HEADER = TRUE;


CREATE TABLE structureByGeneTest1(
	structureID int,
	structureTerm text,
	detected boolean,
	geneName text,
	geneID text,
	emageID int,
	PRIMARY KEY (geneName, detected)
	);

CREATE INDEX idx_annotations_structureid ON structureByGeneTest1 (structureID);

COPY structureByGeneTest2 (geneName,structureID,detected,emageid,geneID,structureTerm) 
FROM '~/Desktop/emage_annotations3.csv'
WITH DELIMITER = ','
AND HEADER = TRUE;

CREATE TABLE structureByGeneTest2(
	structureID int,
	structureTerm text,
	detected boolean,
	geneName text,
	geneID text,
	emageID int,
	PRIMARY KEY ((geneName, structureID),detected)
	);

CREATE TABLE structureByStage(
	structureID int,
	structureTerm text,
	detected boolean,
	theilerStage int,
	dpc text,
	PRIMARY KEY ((theilerStage, detected), structureID)
	);

COPY structureByStage (theilerStage,detected,structureid,dpc,structureTerm) 
FROM '~/Desktop/emage_annotations2.csv'
WITH DELIMITER = ','
AND HEADER = TRUE;



CREATE TABLE textAnnotations(
	structureID int,
	structureTerm text,
	strength text,
	detected boolean,
	geneName text,
	geneID text,
	dpc text,
	theilerStage int,
	emageID int,
	PRIMARY KEY ((emageid,structureID,detected)
	);

COPY textAnnotations (emageid,structureID,detected,dpc,geneID,geneName,strength,structureTerm,theilerStage) 
FROM '~/Desktop/emage_annotations.csv'
WITH DELIMITER = ','
AND HEADER = TRUE;