.libPaths("/share/ceph/wym219group/shared/libraries/R4") #add path to custom libraries to searched locations
library(RERconverge)
source("Src/Reu/cmdArgImport.R")


args = c('a=Output/PhangornTestOut', 'o=Output/UNICORNsMainTrees.txt', 't=Data/zoonomiaMasterTreeScientific.tree', 'm=F') #This is a debug argument set. It is used to set arguments locally, when not running the code through a bash script.
args = commandArgs(trailingOnly = TRUE)

alignFolder = cmdArgImport('a')
outputFile = cmdArgImport('o')
masterTree = cmdArgImport('t')
addMaster = cmdArgImport('m')
noFilename = cmdArgImport('n')

fileList = list.files(alignFolder)
multiphylo = data.frame()

outFile = file(outputFile, "wt")

if(addMaster){
  alignmentPath = paste(masterTree)
  algnmentName = "MasterTree"
  treeString = readLines(alignmentPath)
  writeLines(paste(algnmentName, treeString, sep = "\t"), outFile)
}

for(i in 1:length(fileList)){
  currentAlignment = fileList[i]
  alignmentPath = paste(alignFolder, "/", currentAlignment, sep="")
  algnmentName = elementName = strsplit(currentAlignment, "\\.")[[1]][1]
  treeString = readLines(alignmentPath)
  if(noFilename){
    writeLines(treeString, outFile)
  }else{
    writeLines(paste(algnmentName, treeString, sep = "\t"), outFile)
  }

  
}
close(outFile)


#readTrees(outputFile)
