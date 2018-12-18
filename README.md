# GS01, U. of Wisconsin-Madison
Analyses associated with

> Dill-McFarland KA, Weimer PJ, Breaker JD, Suen G. 2018. Diet influences early microbiota development in dairy calves without long-term impacts on milk production. *Appl Environ Microbiol* Epub ahead of print. doi: [10.1128/AEM.02141-18](https://aem.asm.org/content/early/2018/10/23/AEM.02141-18).

## Abstract
Gastrointestinal tract (GIT) microorganisms play important roles in the health of ruminant livestock and impact production of agriculturally relevant products, including milk and meat. Despite this link, interventions to alter the adult microbiota to improve production have proven ineffective as established microbial communities are resilient to change. In contrast, developing communities in young animals may be more easily altered but are less well-studied. Here, we measured the GIT-associated microbiota of 45 Holstein dairy cows from 2 weeks to first lactation using Illumina amplicon sequencing of bacterial (V4 16S), archaeal (V6-8 16S), and fungal (ITS1) communities. Fecal and rumen microbiota of cows raised on calf starter grains and/or corn silage were correlated to lifetime growth as well as milk production during the first lactation cycle in order to determine if early-life diets have long-term impacts. Significant diet-associated differences in total microbial communities and specific taxa were observed by weaning (8 weeks), but all animals reached an adult-like composition between weaning and 1-year. While some calf diet-driven differences were apparent in the microbiota of adult cows, these dissimilarities did not correlate with animal growth or milk production. This suggests that initial microbial community establishment is impacted by early-life diet, but post-weaning factors have a greater influence on adult communities and production outcomes.

## Significance
The gut microbiota is essential to the survival of many organisms, including ruminants that rely on microorganisms for nutrient acquisition from dietary inputs for the production of products like milk and meat. While alteration of the adult ruminant microbiota to improve production is possible, changes are often unstable and fail to persist. In contrast, the early-life microbiota may be more amenable to sustained modification. However, few studies have determined the impacts of early-life interventions on downstream production. Here, we investigated the impacts of agriculturally relevant calf diets, including calf starter and corn silage, on gut microbial communities, growth, and production through the first lactation cycle. Thus, this work serves to further our understanding of early-life microbiota acquisition as well as informs future practices in livestock management.

PMID: 30367001

## Key

In the first position:

* **A** or **Arc** = Archaea
* **B** or **Bac** = Bacteria
* **F** or **Fun** = Fungi

In the second position:
* **F** = fecal
* **L** = rumen liquids; if followed by a number (1-3), this indicates the order of 3-day consecutive samples
* **S** = rumen liquids; if followed by a number (1-3), this indicates the order of 3-day consecutive samples

## data
Metadata, short chain organic acid (mM and mF), and OTU tables with taxonomy. Archaea, bacteria, and fungi are separate.

## figures
Raw figure outputs from R.

## functions
R functions for:

* **Pairwise_adonis.r**: Pairwise PERMANOVA (adonis) tests of beta-diversity
		+ Original prints output to console and only allows 1 factor of interest
		+ 2 prints the output to a saved table and iterates through multiple factors
* **pairwise_permdisp.r**: PERMDSIP and pairwise tests of beta-diversity
* **R_krusk.R**: Kruskal-Wallis analyses of OTUs identified in SIMPER
* **simper_pretty.r**: Similarity percentages (SIMPER) analyses of OTUs

## results
R outputs from Rmarkdowns including:

* **adonis_OTU**: Pairwise PERMANOVA (adonis) results from Pairwise_adonis.R
* **beta_div**: Average Bray-Curtis diversity values within age groups
* **Kendall_milk**: Kendall correlations between OTUs and total efficiency or milk production efficiency (MPE)
* **Kendall_SCOA**: Kendall correlations between OTUs and SCOA concentrations (mM) across all rumen liquid samples or just at weaning (8 weeks)
* **KruskalWallis**: Kruskal-Wallis p-values of OTU relative abundance between diet:age groups. See R_krusk.R function for more details
* **permdisp_OTU**: PERMDISP and pairwise results from pairwise_permdisp.R
* **SIMPER**: SIMPER values for OTU relative abundances between diet:age groups. See simper_pretty.R function for more details
* **Other files**: Significant results from above analyses. Archaea, bacteria, and fungi are combined into 1 table.

## venn_data
Design and shared (OTU table) files for use in mothur for determining OTU lists in each diet:age group.

## Rmarkdowns
All analyses run from the environment created in data_manip. There are no other dependencies.

1. **data_manip**:  Data import and manipulation
		+ Final environment saved as GS01.data.RData
2. **animal_metrics**:  Animal metric analyses
		+ Calf supplement intake, repeated measures linear model
		+ Weight gain, repeated measures linear model
		+ Milk production metrics, ANOVA
3. **alpha_diversity**:  OTU alpha-diversity analyses
		+ Model 1, diet and age, ANOVA + TukeyHSD
		+ Model 2, milk production efficiency, ANOVA + TukeyHSD
4. **beta_diversity**:  OTU beta-diversity analyses
		+ Calculate average Bray-Curtis within diet:age groups
		+ Model 1, diet and age, PERMANOVA and PERMDISP
		+ Model 2, milk production efficiency, PERMANOVA
		+ Model 3, Calf scours, PERMANOVA
5. **OTUs**:  Individual OTU analyses
		+ Model 1, diet and age, SIMPER + Kruskal-Wallis
		+ Model 2, milk production efficiency, Kendall's correlation
6. **SCOA**:  SCOA analyses
		+ Model 1, diet and age, PERMANOVA
		+ Model 2, milk production efficiency, PERMANOVA
7. **covar_OTU_SCOA**:  Co-variance of OTUs and SCOAs
		+ Overal co-variation, Mantel's test
		+ Specific OTUs and SCOAs, Kendall's correlation
8. **figures**:  Figures 1-4
		+ Figure 1, Total fecal and ruminal microbiota in dairy cows raised on different diets
		+ Figure 2, Diversity of fecal and ruminal microbiota in cows raised on different diets
		+ Figure 3, Microbial taxa shared between calves and cows
		+ Figure 4, Calf diet impacts on weight gain and milk production
9. **figures_supp**:  Supplemental figures 1-3
		+ Figure S1, Supplement intake (g/day) by diet from birth to weaning
		+ Figure S2, Diversity of fecal and ruminal microbiota in cows raised on different diets
		+ Figure S3, SCOA mM and mF by age and diet
