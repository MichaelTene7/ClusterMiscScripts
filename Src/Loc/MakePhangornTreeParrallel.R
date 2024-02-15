.libPaths("/share/ceph/wym219group/shared/libraries/R4") #add path to custom libraries to searched locations
library(RERconverge)
source("Src/Reu/cmdArgImport.R")


args = c('i=c(1:10)', 'a=DemoData/UNICORNs_alignments/alignments', 'o=Output/PhangornTestOut', 't=Data/zoonomiaMasterTreeScientific.tree', 's=F', 'd=T') #This is a debug argument set. It is used to set arguments locally, when not running the code through a bash script.

args = c('i=c(1:184000)', 'a=DemoData/UNICORNs_alignments/alignments', 'o=Output/UnicornsOverlap', 't=Data/zoonomiaMasterTreeScientific.tree', 's=T', 'd=T', 'f=Data/Dev/unicornsFilter.rds') #This is a debug argument set. It is used to set arguments locally, when not running the code through a bash script.


args = c('i=c(1:10)', 'a=/share/ceph/scratch/mit221/10934053/Alignments/alignments', 'o=Output/UNICORNsTreeFiles', 't=Data/zoonomiaMasterTreeScientific.tree', 's=F', 'd=T') #This is a debug argument set. It is used to set arguments locally, when not running the code through a bash script.
args = commandArgs(trailingOnly = TRUE)

fileNumber = as.numeric(cmdArgImport('i'))
alignmentDirectory = cmdArgImport('a')
outputDirectory = cmdArgImport('o')
masterTree = cmdArgImport('t')
bySingles = cmdArgImport('s')
isDNA = cmdArgImport('d')
filterFile = cmdArgImport('f')

if(!dir.exists(outputDirectory)){                                      #Make output directory if it does not exist
  dir.create(outputDirectory)
}

if(isDNA){
  typeVal = "DNA"
  modelVal = "GTR"
}else{
  typeVal = "AA"
  modelVal = "LG"
}

if(!is.na(filterFile)){
  filterString = readRDS(filterFile)
}

if(bySingles){
  fileList = list.files(alignmentDirectory)
  for(i in  fileNumber){
    print(i)
    currentAlignment = fileList[i]
    if(!is.na(filterFile)){
      includedFiles = 0
      if(!currentAlignment %in% filterString){message("skip"); next}else(message(currentAlignment); includedFiles = includedFiles+1)
    }
    alignmentFile = paste(alignmentDirectory, "/", currentAlignment, sep="")
    treeObject <- estimatePhangornTree(alnfile = alignmentFile, treefile = masterTree, submodel = modelVal, type = typeVal, format = "fasta", k = 4)
    
    elementName = strsplit(currentAlignment, "\\.")[[1]][1]
    outFileName = paste(outputDirectory, "/", elementName, ".tree", sep="") 
    treeString = write.tree(treeObject$tree, outFileName)
  }
  if(!is.na(filterFile)){message(paste("Complete. Number of files created: ", includedFiles))}
}else{
  estimatePhangornTreeAll(alndir = alignmentDirectory, treefile = masterTree, output.file = paste(outputDirectory, "AllTree.tree"), type = typeVal, submodel = modelVal)
}
