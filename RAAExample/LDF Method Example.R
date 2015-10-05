suppressPackageStartupMessages(library(ChainLadder))
ataRAA <- ata(RAA)
selectedATA <- round(attr(ataRAA, "vwtd"), 3)
plot(log(selectedATA - 1))
x <-1:9
y <- log(selectedATA - 1)
lm(y~x)
abline(lm(y~x))
age <- 10:19
tail(cumprod(exp(0.9045 - 0.6340 * age) + 1), 1)
tail = 1.01
selectedATA[1] <- attr(ataRAA, 'smpl')[1]
CDF <- round(cumprod(rev(c(selectedATA, tail))), 3)
Latest = getLatestCumulative(RAA)
Ultimate = round(Latest * CDF, 0)
IBNR = Ultimate - Latest
LDEstimate <- data.frame(Latest, CDF, Ultimate, IBNR)
Total <- colSums(LDEstimate)
Total[2] <- NA
LDEstimate <- rbind(LDEstimate, Total = Total)
print(LDEstimate)

