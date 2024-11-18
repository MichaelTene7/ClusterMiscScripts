.libPaths("/share/ceph/wym219group/shared/libraries/R4")
library(RERconverge)
mainTrees = readTrees("Output/newZoonomiaAlignmentSpecies.tsv", reestimateBranches = T, minTreesAll = 5)
saveRDS(mainTrees, "Output/zoonomiaAllMammalsTrees.rds")
