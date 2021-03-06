library(ggplot2)
library(cowplot)

thepath="chromopainterparsedout"

# par(mfrow=c(1,2))
args<-commandArgs(TRUE)

for ( i in 1:length(args) ){
chr=args[i]


fileblocks<-paste0(chr,'_parsedGM_BLOCKSIZES')
print(fileblocks)

blocklen<-read.table(paste(thepath,"/",fileblocks,sep=''),header=F)
head(blocklen)
tail(blocklen)

p<-ggplot(data=blocklen) +geom_histogram(color="black",fill="black",aes(x = blocklen),bins = 50)+theme_cowplot()+ggtitle(chr)
q<-ggplot(data=blocklen) +geom_histogram(color="black",fill="black",aes(x = log10(blocklen+1)) ,bins = 50)+theme_cowplot()+ggtitle(chr)

# pdf(useDingbats=FALSE,file=paste("chr",chr,"_block_length_distribution.pdf",sep=""),height=5,width=7)
z<-plot_grid(p,q,ncol = 2)
ggsave(plot = z,filename=paste("plots/chr",chr,"_block_length_distribution.pdf",sep=""),height = 4,width = 8,useDingbats=F)


}
