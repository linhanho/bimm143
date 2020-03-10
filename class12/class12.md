Class 12: Structural Bioinformatics 1
================

## PDB Statistics

Here we inspect the types of structures in the main databse for 3D
biomolecular data - the PDB.

> Q1: Determine the percentage of structures solved by X-Ray and
> Electron Microscopy.

``` r
# read in file
stats <- read.csv("Data Export Summary.csv", row.names = 1)
stats
```

    ##                     Proteins Nucleic.Acids Protein.NA.Complex Other  Total
    ## Electron Microscopy     3241            35               1095     0   4371
    ## Multi Method             146             5                  2     1    154
    ## NMR                    11308          1317                265     8  12898
    ## Other                    284             4                  6    13    307
    ## X-Ray                 133756          2086               6884     8 142734

``` r
# calculate percentage values asked for
ans <- stats$Total/sum(stats$Total)*100
names(ans) <- rownames(stats)
round (ans, 2)
```

    ## Electron Microscopy        Multi Method                 NMR               Other 
    ##                2.72                0.10                8.04                0.19 
    ##               X-Ray 
    ##               88.95

X-Ray = 88.95%, electron microscopy = 2.72%

> Q2: Also can you determine what proportion of structures are protein?
> Aim to have a rendered GitHub document with working code that yields
> your answers.

``` r
# read in file
stats <- read.csv("Data Export Summary.csv", row.names = 1)
stats
```

    ##                     Proteins Nucleic.Acids Protein.NA.Complex Other  Total
    ## Electron Microscopy     3241            35               1095     0   4371
    ## Multi Method             146             5                  2     1    154
    ## NMR                    11308          1317                265     8  12898
    ## Other                    284             4                  6    13    307
    ## X-Ray                 133756          2086               6884     8 142734

``` r
# calculate percentage values asked for
sum(stats$Proteins)/sum(stats$Total)*100
```

    ## [1] 92.69057

92.69%

> Q3: Type HIV in the PDB website search box on the home page and
> determine how many HIV-1 protease structures are in the current PDB?

1289

\#Part 2

Read a single PDB structure into R

``` r
library(bio3d)

pdb <-  read.pdb("1hsg")
```

    ##   Note: Accessing on-line PDB file

``` r
pdb
```

    ## 
    ##  Call:  read.pdb(file = "1hsg")
    ## 
    ##    Total Models#: 1
    ##      Total Atoms#: 1686,  XYZs#: 5058  Chains#: 2  (values: A B)
    ## 
    ##      Protein Atoms#: 1514  (residues/Calpha atoms#: 198)
    ##      Nucleic acid Atoms#: 0  (residues/phosphate atoms#: 0)
    ## 
    ##      Non-protein/nucleic Atoms#: 172  (residues: 128)
    ##      Non-protein/nucleic resid values: [ HOH (127), MK1 (1) ]
    ## 
    ##    Protein sequence:
    ##       PQITLWQRPLVTIKIGGQLKEALLDTGADDTVLEEMSLPGRWKPKMIGGIGGFIKVRQYD
    ##       QILIEICGHKAIGTVLVGPTPVNIIGRNLLTQIGCTLNFPQITLWQRPLVTIKIGGQLKE
    ##       ALLDTGADDTVLEEMSLPGRWKPKMIGGIGGFIKVRQYDQILIEICGHKAIGTVLVGPTP
    ##       VNIIGRNLLTQIGCTLNF
    ## 
    ## + attr: atom, xyz, seqres, helix, sheet,
    ##         calpha, remark, call

## Select protein only atoms

Here I will use the `atom.select()` function to do this.

``` r
prot <- atom.select(pdb, "protein", value = TRUE)
lig <- atom.select(pdb, "ligand", value = TRUE)
```

And write out these new PDB objects with the `write.pdb()` function.

``` r
write.pdb(lig, file = "1hsg_ligand.pdb")
write.pdb(prot, file = "1hsg_protein.pdb")
```
