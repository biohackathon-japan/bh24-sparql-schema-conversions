# Generate SHACL shapes from Swisslipids void description
sparql --query void2shapes.sparql --data cached_void_swisslipids.ttl > generated_swisslipids_shacl_shapes.ttl