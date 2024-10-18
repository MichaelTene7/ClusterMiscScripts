.libPaths("/share/ceph/wym219group/shared/libraries/R4")
library(RERconverge)
mainTrees = readTrees("Data/zoonomiaAllMammalsTrees.tsv")
saveRDS(mainTrees, "OUtput/zoonomiaAllMammalsTrees.rds")