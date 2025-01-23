# Load necessary libraries
library(dplyr)

# Load the datasets
aapl <- read.csv("C:\\Users\\Areez\\Downloads\\STock\\AAPL.csv")
banf <- read.csv("C:\\Users\\Areez\\Downloads\\STock\\BANF.csv")
costco <- read.csv("C:\\Users\\Areez\\Downloads\\STock\\COST.csv")

# Add a column to identify the stock
aapl$Stock <- "Apple"
banf$Stock <- "BANF"
costco$Stock <- "Costco"

# Combine all datasets into one
data <- bind_rows(aapl, banf, costco)
View(data)

# Convert Date column to Date format
data$Date <- as.Date(data$Date, format = "%d-%m-%Y")

data <- data %>%
  group_by(Stock) %>%
  mutate(Percentage_Change = (Adjusted.Close - first(Adjusted.Close)) / first(Adjusted.Close) * 100)

ggplot(data, aes(x = Date, y = Percentage_Change, fill = Stock)) +
  geom_area(alpha = 0.6, position = "identity") +
  labs(title = "Cumulative Percentage Change Over Time",
       x = "Date",
       y = "Percentage Change (%)",
       fill = "Stock") +
  theme_minimal()

data <- data %>%
  group_by(Stock) %>%
  mutate(Rolling_Avg_7 = zoo::rollmean(Adjusted.Close, 7, fill = NA, align = "right"),
         Rolling_Avg_30 = zoo::rollmean(Adjusted.Close, 30, fill = NA, align = "right"))

ggplot(data, aes(x = Date)) +
  geom_line(aes(y = Rolling_Avg_7, color = Stock), linetype = "solid") +
  geom_line(aes(y = Rolling_Avg_30, color = Stock), linetype = "dashed") +
  labs(title = "Rolling Averages (7-day and 30-day) of Adjusted Close Prices",
       x = "Date",
       y = "Adjusted Close Price",
       color = "Stock") +
  theme_minimal()
###
data <- data %>%
  mutate(Price_Range = High - Low)

ggplot(data, aes(x = Stock, y = Price_Range, fill = Stock)) +
  geom_boxplot(alpha = 0.7) +
  labs(title = "Daily Price Volatility by Stock",
       x = "Stock",
       y = "Price Range",
       fill = "Stock") +
  theme_minimal()

ggplot(data, aes(x = Volume, y = Adjusted.Close, color = Stock)) +
  geom_point(alpha = 0.5) +
  geom_smooth(method = "lm", se = FALSE, linetype = "dashed") +
  labs(title = "Volume vs Adjusted Close Price",
       x = "Trading Volume",
       y = "Adjusted Close Price",
       color = "Stock") +
  theme_minimal()
# Adjust Volume to log scale and add transparency
ggplot(data, aes(x = Volume, y = Adjusted.Close, color = Stock)) +
  geom_point(alpha = 0.5, size = 2) +  # Transparency and point size
  scale_x_log10() +  # Logarithmic scale for Volume
  geom_smooth(method = "lm", se = FALSE, linetype = "dashed") +
  labs(title = "Volume vs Adjusted Close Price (Log Scale)",
       x = "Trading Volume (Log Scale)",
       y = "Adjusted Close Price",
       color = "Stock") +
  theme_minimal()

# Save the scatter plot
ggsave("C:\\Users\\Areez\\Downloads\\STock\\volume_vs_adjusted_close.png", width = 10, height = 6)

# Filter out rows with zero or missing Volume
data_filtered <- data %>%
  filter(Volume > 0, !is.na(Volume))

# Recreate the scatter plot
ggplot(data_filtered, aes(x = Volume, y = Adjusted.Close, color = Stock)) +
  geom_point(alpha = 0.5, size = 2) +
  scale_x_log10() +  # Logarithmic scale
  geom_smooth(method = "lm", se = FALSE, linetype = "dashed") +
  labs(title = "Volume vs Adjusted Close Price (Log Scale)",
       x = "Trading Volume (Log Scale)",
       y = "Adjusted Close Price",
       color = "Stock") +
  theme_minimal()

# Save the updated plot
ggsave("C:\\Users\\Areez\\Downloads\\STock\\volume_vs_adjusted_close_filtered.png", width = 10, height = 6)


# Load the scales package
library(scales)

# Adjust the scatter plot with better x-axis labels
ggplot(data, aes(x = Volume, y = Adjusted.Close, color = Stock)) +
  geom_point(alpha = 0.5, size = 2) +
  scale_x_log10(labels = scales::comma) +  # Format log scale with commas
  geom_smooth(method = "lm", se = FALSE, linetype = "dashed") +
  labs(title = "Volume vs Adjusted Close Price (Log Scale, Post-2007)",
       x = "Trading Volume (Log Scale)",
       y = "Adjusted Close Price",
       color = "Stock") +
  theme_minimal()

# Save the updated plot
ggsave("C:\\Users\\Areez\\Downloads\\STock\\volume_vs_adjusted_close_prettified.png", width = 10, height = 6)
