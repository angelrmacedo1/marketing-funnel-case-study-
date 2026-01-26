CREATE TABLE leads_v2 (
    lead_id VARCHAR(50) PRIMARY KEY,
    created_at TIMESTAMP,
    channel VARCHAR(50),
    agency_size VARCHAR(50),
    lead_score INTEGER,
    setter_id VARCHAR(50),
    closer_id VARCHAR(50)
);

CREATE TABLE operations_v2 (
    lead_id VARCHAR(50) PRIMARY KEY,
    booked_call BOOLEAN,
    showed_up BOOLEAN,
    time_to_first_contact_mins INTEGER,
    follow_up_attempts INTEGER
);

CREATE TABLE sales_v2 (
    sale_id VARCHAR(50) PRIMARY KEY,
    lead_id VARCHAR(50) REFERENCES leads_v2(lead_id),
    sale_date DATE,
    product_type VARCHAR(50),
    setup_fee NUMERIC,
    monthly_retainer NUMERIC,
    months_retained INTEGER,
    upsell_revenue NUMERIC,
    csm_id VARCHAR(50)
);

CREATE TABLE marketing_spend_v2 (
    month_start DATE,
    channel VARCHAR(50),
    ad_spend NUMERIC,
    impressions INTEGER,
    clicks INTEGER,
    PRIMARY KEY (month_start, channel)
);

SELECT 
    (SELECT COUNT(*) FROM leads_v2) as leads,
    (SELECT COUNT(*) FROM operations_v2) as ops,
    (SELECT COUNT(*) FROM sales_v2) as sales;

-- THE REPORTING LAYER (CLEAN SUMMARY VIEW)
CREATE OR REPLACE VIEW reporting_summary_v2 AS
WITH Lead_Metrics AS (
    SELECT 
        TO_CHAR(L.created_at, 'YYYY-MM') AS report_month,
        L.channel,
        L.agency_size,
        COUNT(L.lead_id) AS total_leads,
        ROUND(AVG(L.lead_score), 2) AS avg_lead_score,
        SUM(CASE WHEN O.booked_call = TRUE THEN 1 ELSE 0 END) AS booked_calls,
        SUM(CASE WHEN O.showed_up = TRUE THEN 1 ELSE 0 END) AS show_ups,
        SUM(CASE WHEN S.lead_id IS NOT NULL THEN 1 ELSE 0 END) AS closed_deals,
        SUM(COALESCE(S.setup_fee, 0)) AS setup_revenue,
        SUM(COALESCE(S.monthly_retainer, 0) * COALESCE(S.months_retained, 0)) AS retainer_revenue,
        SUM(COALESCE(S.upsell_revenue, 0)) AS upsell_revenue,
        SUM(COALESCE(S.setup_fee, 0) + (COALESCE(S.monthly_retainer, 0) * COALESCE(S.months_retained, 0)) + COALESCE(S.upsell_revenue, 0)) AS total_ltv
    FROM leads_v2 L
    LEFT JOIN operations_v2 O ON L.lead_id = O.lead_id
    LEFT JOIN sales_v2 S ON L.lead_id = S.lead_id
    GROUP BY 1, 2, 3
),
Marketing_Metrics AS (
    SELECT 
        TO_CHAR(month_start, 'YYYY-MM') AS report_month,
        channel,
        SUM(ad_spend) AS total_monthly_spend,
        SUM(impressions) AS total_monthly_impressions,
        SUM(clicks) AS total_monthly_clicks
    FROM marketing_spend_v2
    GROUP BY 1, 2
),
Allocation_Logic AS (
    SELECT 
        report_month,
        channel,
        COUNT(DISTINCT agency_size) as segment_count
    FROM Lead_Metrics
    GROUP BY 1, 2
)
SELECT 
    LM.*,
    ROUND(COALESCE(MM.total_monthly_spend / AL.segment_count, 0), 2) AS allocated_spend,
    ROUND(COALESCE(MM.total_monthly_impressions / AL.segment_count, 0), 0) AS allocated_impressions,
    ROUND(COALESCE(MM.total_monthly_clicks / AL.segment_count, 0), 0) AS allocated_clicks
FROM Lead_Metrics LM
LEFT JOIN Marketing_Metrics MM 
    ON LM.report_month = MM.report_month 
    AND LM.channel = MM.channel
LEFT JOIN Allocation_Logic AL
    ON LM.report_month = AL.report_month
    AND LM.channel = AL.channel
ORDER BY LM.report_month DESC, LM.channel, LM.agency_size;


SELECT * FROM reporting_summary_v2;
