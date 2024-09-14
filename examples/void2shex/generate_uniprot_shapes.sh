# Generate SHACL shapes
sparql --query void2shapes.sparql --data cached_void_uniprot.ttl > generated_uniprot_shacl_shapes.ttl