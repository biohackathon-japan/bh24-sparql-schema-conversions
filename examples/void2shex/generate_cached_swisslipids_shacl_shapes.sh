# Generate cached swisslipids SHACL shapes
rsparql --service https://sparql.swisslipids.org/sparql --query void2shapes.sparql > cached_swisslipids_shacl_shapes.ttl