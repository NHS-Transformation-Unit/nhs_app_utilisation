<img src="images/TU_logo_large.png" alt="TU logo" width="200" align="right"/>

# NHS App Utilisation
This repository contains the data and code for the analysis of NHS App utilisation rates across different patient demographic groups.

<br/>

## Repository Structure
The current structure of the repository is detailed below:

``` plaintext

├─── data
     ├─── foi_received_raw
     ├─── mi_raw
     └─── reference
├─── documentation
├─── images
└─── src
     ├─── analysis
     ├─── config
     ├─── load
     ├─── outputs
     ├─── processing
     └─── requirements


```

### `data`
The data folder contains all extracts of data used to create this analysis. It is broken down into:

- `foi_received_raw`: Contains the raw data received on app utilisation by demographics as part of the FOI
- `mi_raw`: Contains raw extracts of the NHS App Management Information publication.
- `reference`: Contains useful reference data like lookups and population estimates.
  
### `documentation`
Contains documentation on the data sources used for the analysis and links to them.

### `images`
Contains the TU logo for the outputs.

### `src`
Contains the source code used for creating the analysis and outputs. Is broken down into:

- `analysis`: Contains the scripts for analysing app utilisation and creating visualisations.
- `config`: Contains the `.css` files for styling the quarto output and scripts for TU colour palettes.
- `load`: Contains the scripts for loading the datasets.
- `outputs`: Contains the full analysis and write-up within the `.qmd` file and the rendered `.html` output.
- `processing`: Contains scripts for processing the raw data ahead of analysis.
- `requirements`: Contains a script to install and load the required R packages.

<br/>

This repository has been created and developed by:

-   [Andy Wilson](https://github.com/ASW-Analyst)
