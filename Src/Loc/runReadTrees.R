.libPaths("/share/ceph/wym219group/shared/libraries/R4")
library(RERconverge)
mainTrees = readTrees("Output/newZoonomiaAlignmentSpecies.tsv")
saveRDS(mainTrees, "Output/zoonomiaAllMammalsTrees.rds")

