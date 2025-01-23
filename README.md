# Data Visualization Project: Stock Performance Analysis

This project explores stock performance for Apple, Costco, and BANF through advanced data visualization techniques using R. It includes cumulative percentage changes, rolling averages, volatility analysis, and volume vs. price correlations.

## Repository Overview

GitHub Repository: [Data Visualization for Stock Analysis](https://github.com/areezmuhammed/DataVizStockDataStock.git)

This repository contains all scripts, datasets, and visualizations related to the stock analysis project. Clone or download the repository to explore and analyze the data.

## Project Features

- **Data Loading**: Imports stock data for Apple, Costco, and BANF.
- **Data Preprocessing**:
  - Combines datasets and adds stock identifiers.
  - Converts dates to appropriate formats.
  - Calculates percentage changes and rolling averages.
- **Visualizations**:
  - Cumulative percentage change over time.
  - Rolling averages (7-day and 30-day).
  - Daily price volatility comparisons.
  - Volume vs. adjusted close price (linear and log scales).
- **Filtered Analysis**: Refines visualizations by excluding rows with missing or zero volumes.

## Setup Instructions

### Prerequisites

- R (version 4.0 or higher)
- Required Libraries:
  - `ggplot2`
  - `dplyr`
  - `zoo`
  - `scales`

Install the libraries using the following command if not already installed:

```R
install.packages(c("ggplot2", "dplyr", "zoo", "scales"))
```

### Data Files

Ensure that the stock data files (`AAPL.csv`, `COST.csv`, `BANF.csv`) are placed in your working directory. Update file paths in the script if necessary.

### Running the Code

1. Clone this repository:

   ```bash
   git clone https://github.com/areezmuhammed/DataVizStockDataStock.git
   ```

2. Open the R script in your preferred editor (e.g., RStudio).
3. Update file paths in the script to match your directory structure.
4. Run the script to generate:
   - Cumulative percentage change charts.
   - Rolling average comparisons.
   - Price volatility boxplots.
   - Scatterplots for volume vs. price.

## Outputs

### Visualizations

- `cumulative_percentage_change.png`: Cumulative percentage change of stocks over time.
- `rolling_averages.png`: 7-day and 30-day rolling averages for adjusted close prices.
- `price_volatility_boxplot.png`: Daily price volatility comparisons across stocks.
- `volume_vs_price.png`: Scatterplot of volume vs. adjusted close price.
- `volume_vs_price_log.png`: Scatterplot with log scale for volume.
- `volume_vs_price_filtered.png`: Refined scatterplot with filtered data.

### Data Outputs

No additional data files are generated as outputs.

## Key Functions

- **Cumulative Percentage Change**:
  - Computes percentage changes for each stock relative to the starting price.
  - Creates area charts to visualize trends.
- **Rolling Averages**:
  - Computes 7-day and 30-day rolling averages of adjusted close prices.
  - Visualizes trends for each stock.
- **Price Volatility**:
  - Calculates the daily price range (High - Low).
  - Compares volatility across stocks using boxplots.
- **Volume vs. Price Correlation**:
  - Explores relationships between trading volume and adjusted close prices.
  - Includes scatterplots with linear and logarithmic scales.

## Insights

- Apple, Costco, and BANF stocks show distinct trends in cumulative percentage changes.
- Rolling averages provide smoothed trends for better stock performance analysis.
- BANF exhibits higher daily price volatility compared to Apple and Costco.
- Volume significantly correlates with price movements, highlighted in scatterplots.

## Contributing

Contributions are welcome! Fork the repository and submit a pull request for any improvements or new features.


