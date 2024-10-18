filterString = filerString

unicornsMainTrees = readRDS("../MiscTempScripts/UNICORNsMainTrees.rds")
library(RERconverge)

hillerMain = read.tree("Data/newHillerMasterTree.txt")
is.binary(hillerMain)

saveRDS(hillerMain, "Data/newHillerMasterTree.rds")

hillerMainReload = readRDS("Data/newHillerMasterTree.rds")
is.binary(hillerMainReload)

hillerMain2 = read.tree("Data/newHillerMasterTree2.txt")
is.binary(hillerMain2)


clusterMaster = readRDS("Data/clusterMasterResult.rds")
is.binary(clusterMaster)
?is.binary

binaryHillerMaster = read.tree("Data/binaryMergedHillerTree.txt")

all.equal(binaryHillerMaster, clusterMaster)

startNodes = binaryHillerMaster$edge[,1]
startNodes = table(startNodes)
nonBinNodes = names(startNodes)[!startNodes ==2]


randomUnicorns = sample(183000, 100)
duplicated(randomUnicorns)
randomUnicorns = as.numeric(randomUnicorns)
dput(randomUnicorns)

RandUniString = "35603, 11457, 59248, 164990, 151346, 121346, 150815, 137443, 124916, 5843, 19409, 23309, 157227, 107650, 75382, 175831, 55405, 32289, 106791, 106444, 151649, 138523, 65115, 20956, 162914, 40525, 41173, 60691, 6435, 174100, 84485, 57374, 6207, 86932, 130347, 136234, 62038, 30686, 103646, 35822, 165018, 178209, 178056, 93878, 154573, 127355, 29903, 150422, 128843, 101576, 18842, 109488, 139351, 94661, 148148, 147842, 8735, 150687, 159047, 145754, 154962, 27065, 124981, 108075, 150469, 67068, 179295, 322, 158468, 17325, 178284, 44732, 24165, 97206, 31343, 181926, 63886, 52608, 51114, 96012, 9023, 105423, 31924, 28045, 121133, 174410, 166236, 155926, 109027, 149475, 66485, 102209, 165944, 70806, 179473, 35630, 97917, 57197, 117104, 61353"
RandUniString2 = gsub(", ", "\\,", RandUniString)

plot(binaryHillerMaster, show.node.label = T, show.tip.label = T, cex = 0.8)
nodelabels(col = "red", adj = c(0, -0), frame = "none")
tiplabels(col = "blue", frame = "none")
edgelabels(col = "darkgreen", frame = "none")
