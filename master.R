################################################################################
# Vorlage für knitr-papers
# Autor: Helge Baumann
# R Version: 3.5.1 
# Letztes Update: 17.01.2018
################################################################################

# (1) Präambel----

# Pakete laden
pac <- "pacman" %in% rownames(installed.packages())
if(pac == FALSE) install.packages("pacman"); rm(pac)
library(pacman)
p_load("knitr", "stringr", "filesstrings")

# knitr Optionen
knitr::opts_chunk$set(echo = TRUE)
opts_knit$set(self.contained=FALSE) # parent/child-Struktur
opts_knit$set(root.dir = getwd()) # wichtig: knitr verändert sonst das Arbeitsv.

# (2) PDF-Dokument erzeugen----

# knitr Style-File in Outputordner verschieben (kann Warnung erzeugen)
file.move("knitr.sty", "./Output_PDF/") 

# knit2pdf
knit2pdf(
  input="./Rnw/master_rnw.Rnw",
  output=paste0(
    "./Output_PDF/",
    format(Sys.time(), "%y%m%d"),
    "_rnw.tex"
    ),
  encoding="UTF-8"
  )

# (3) Workspace bereinigen (nur behalten, was benötigt wird)----
# rm(list=setdiff(ls(), "x"))

# (4) Session Info----
dir.create("./Session_Info/", showWarnings=F)
writeLines(
  capture.output(sessionInfo()), 
  con=paste0("./Session_Info/sessionInfo_",format(Sys.time(), "%y%m%d"), ".txt")
  )




