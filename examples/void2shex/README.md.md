# Void 2 ShEx experiments

## Prerrequisites

In order to run the code that is contained in this folder it is neessary to download [Apache Jena](https://jena.apache.org/) and [rudof](https://rudof-project.github.io/rudof/).

Once downloaded, ensure that you can run the command line utilities from Apache Jena adding them to the PATH. We use `sparql` to run SPARQL queries on local RDF data and `rsparql` to run SPARQL queries on remote endpoints like Swisslipids.

## Steps to generate ShEx about Swisslipids

Step 1: Run a SPARQL query on SwissLipids beta SPARQL endpoint with `rsparql` to obtain the void description in a file called `cached_swisslipids_void.ttl`:

```sh
rsparql --service https://sparql.swisslipids.org/sparql --query void2shapes.sparql > cached_swisslipids_void.ttl
```

Step 2: Convert the void description file to SHACL shapes using the following SPARQL construct query that generates `cached_swisslipids_shacl_shapes.ttl`:

```sh
sparql --query void2shapes.sparql --data cached_swisslipids_void.ttl > cached_swisslipids_shacl_shapes.ttl 
```

Step 3: Convert the SHACL shapes to a ShEx schema using `rudof`. The result is `swisslipids.shex`:

```sh
rudof convert -m shacl -x shex -s cached_swisslipids_shacl_shapes.ttl -f turtle -o swisslipids.shex --force-overwrite 
```

Step 4: Obtain a simplified JSON version of the ShEx file which contains only the predicates employed:

```sh
 rudof shex -s swisslipids.shex -r simple -o swisslipids_simple.json
```

## Steps to generate ShEx about UniProt

Step 1. Obtain void description of Uniprot using the following SPARQL query over the endpoint.

```sh
rsparql --service https://sparql.uniprot.org/sparql --query void2shapes.sparql > cached_uniprot_void.ttl
```

Step 2: Convert the void description file to SHACL shapes using the following SPARQL construct query that generates `cached_uniprot_shacl_shapes.ttl`:

```sh
sparql --query void2shapes.sparql --data cached_uniprot_void.ttl > cached_uniprot_shacl_shapes.ttl 
```

Step 3: Convert the SHACL shapes to a ShEx schema using `rudof`. The result is `swisslipids.shex`:

```sh
rudof convert -m shacl -x shex -s cached_uniprot_shacl_shapes.ttl -f turtle -o uniprot.shex --force-overwrite 
```

Step 4: Obtain a simplified JSON version of the ShEx file which contains only the predicates employed:

```sh
 rudof shex -s uniprot.shex -r simple -o uniprot_simple.json
```
