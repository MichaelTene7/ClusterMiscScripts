.libPaths("/share/ceph/wym219group/shared/libraries/R4")
library(RERconverge)
mainTrees = readTrees("Output/newZoonomiaAlignmentSpecies.tsv", masterTree = "/share/ceph/wym219group/shared/projects/MammalDiet/Zoonomia/NewZoonomiaMasterTreePrunedToAlignmentSpecies.nwk", reestimateBranches = T)
saveRDS(mainTrees, "Output/zoonomiaAllMammalsTrees.rds")
