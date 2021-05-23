library("ape")
library("RColorBrewer")

lab <- scan("src/labels.txt", what= " ", sep="\n")
mat <- scan("src/dist_matrix.txt")
mat <- matrix(mat, ncol = sqrt(length(mat)), byrow = TRUE)
rownames(mat) <- lab
hc <- hclust(as.dist(mat), method="ward.D2")

n <- 60
qual_col_pals = brewer.pal.info[brewer.pal.info$category == 'qual',]
colors = unlist(mapply(brewer.pal, qual_col_pals$maxcolors, rownames(qual_col_pals)))

clus4 = cutree(hc, 60)
pdf("test.pdf")
plot(as.phylo(hc), type = "fan", tip.color = colors[clus4],
     label.offset = 0.01, cex=0.2)
dev.off()