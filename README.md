# Marketing Performance Optimization Case Study

## Overview

This project is an end-to-end marketing funnel analysis focused on improving revenue performance through operational and marketing efficiency rather than increased ad spend.

By integrating marketing, sales, and operations data into a unified reporting structure, this analysis identifies where revenue is being lost in the funnel and where strategic adjustments can drive significant growth.

The findings show that targeted improvements in funnel conversion, channel allocation, and upsell strategy could increase total lifetime value by more than 24 percent.

---

## Business Objective

The purpose of this case study was to answer a key leadership question:

**How can revenue and profitability be increased without raising total marketing spend?**

To answer this, the project focused on:

- Measuring full funnel performance from lead to closed deal  
- Identifying conversion bottlenecks  
- Evaluating marketing channel efficiency  
- Recommending high-impact optimization strategies  

---

## Data Infrastructure

A unified reporting layer was built to connect previously siloed datasets across the customer journey:

**Marketing Spend → Leads → Booked Calls → Show Ups → Closed Deals → Revenue**

This structure enabled true end-to-end funnel measurement and accurate performance attribution.

---

## Key Performance Metrics

| Metric | Value |
|--------|-------|
| Total Revenue | $13,015,500 |
| Total Leads | 3,000 |
| Closed Deals | 368 |
| Overall ROAS | 28.14 |
| Close Rate | 12.27% |
| Customer Acquisition Cost | $1,256.79 |

---

## Funnel Conversion Rates

| Funnel Stage | Conversion Rate |
|--------------|-----------------|
| Lead to Booked Call | 44.7% |
| Booked Call to Show Up | 71.0% |
| Show Up to Closed Deal | 38.7% |

The largest drop-off occurs between booked calls and show-ups, where 29 percent of scheduled calls result in no-shows.

---

## Channel Performance Comparison

| Channel | ROAS | Lead to Close % | LTV per Lead |
|---------|------|----------------|--------------|
| TikTok | 9.23 | 7.16% | $1,871 |
| LinkedIn | 23.47 | 21.22% | $7,315 |
| Meta | 28.26 | 11.14% | $4,140 |

TikTok drives volume but produces the lowest-quality leads, lowest conversion rates, and lowest return on ad spend among paid channels.

---

## Key Problems Identified

### Funnel Leakage from No-Shows  
A large percentage of booked calls do not attend, reducing sales efficiency and wasting marketing spend.

### Inefficient Channel Allocation  
Significant budget is allocated to TikTok despite it being the lowest-performing paid channel in both profitability and lead quality.

### Missed Upsell Revenue in Large Agencies  
The largest client segment generates the lowest upsell revenue relative to lifetime value, indicating a gap in expansion strategy.

### Slowing Lead Growth  
Lead volume continues to increase, but growth is decelerating, suggesting future plateau risk without strategic adjustment.

---

## Strategic Recommendations

### Improve Show-Up Rates  
Implement automated reminder sequences through SMS and email immediately after a call is booked to reduce no-shows.

### Reallocate Marketing Budget  
Reduce TikTok spend and shift investment toward higher-performing channels such as LinkedIn.

### Launch an Enterprise Upsell Program  
Develop a structured upsell strategy and sales playbook for large agency clients to increase expansion revenue.

### Scale High-Performing Channels  
Reinvest efficiency gains into channels with strong ROAS such as Meta and Google Search to sustain lead growth.

---

## Projected Impact

| Metric | Current | Projected | Improvement |
|--------|---------|-----------|-------------|
| Total LTV | $13.02M | $16.17M | +24.2% |
| Overall ROAS | 28.14 | 34.95 | +24.2% |
| Closed Deals | 368 | 454 | +23.4% |

These improvements are driven by better conversion efficiency and smarter allocation of existing budget.

---

## Tools Used

- **SQL** for data cleaning, transformation, and KPI calculation  
- **Tableau** for dashboard development and visualization  
- Spreadsheet tools for validation and reconciliation  

---

## Repository Structure

- `marketing-funnel-project.sql`  
  SQL used to build the unified reporting dataset  

- `analysis.csv`  
  Final aggregated dataset used for BI reporting  

- `Marketing Funnel BI Report.pdf`  
  Executive-style report containing visuals, findings, and projections  

- Raw CSV files  
  Source data for marketing spend, leads, operations, and sales  

---

## How to Reproduce

1. Load the raw CSV files into your SQL environment  
2. Run the SQL script to build the reporting tables  
3. Export the final dataset  
4. Connect the dataset to a BI tool to recreate the dashboard  

---

## Key Takeaway

Major revenue growth opportunities often come from improving efficiency, not increasing spend. By reducing funnel leakage, reallocating budget to higher-quality channels, and expanding revenue from existing customers, organizations can significantly increase profitability with the same marketing investment.

---

## Author

**Angel Macedo**  
Data Analyst specializing in marketing analytics, revenue optimization, and business intelligence  

[LinkedIn](http://linkedin.com/in/angelr-macedo)  
[GitHub](https://github.com/angelrmacedo1)
