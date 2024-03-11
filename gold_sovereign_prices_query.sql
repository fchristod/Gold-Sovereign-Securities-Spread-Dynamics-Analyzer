use goldsovereign;

SELECT *, ROUND((Gold_Ask_995 - Gold_Bid_995),2) AS Gold_Spread, ROUND((Sov_Old_Ask - Sov_Old_Bid),2) AS Sov_Old_Spread, ROUND((Sov_New_Upto1973_Ask - Sov_New_Upto1973_Bid),2) AS Sov_New_Upto1973_Spread, ROUND((Sov_New_Post1974_Ask - Sov_New_Post1974_Bid),2) AS Sov_New_Post1974_Spread
FROM bulletin_gold
WHERE (Gold_Ask_995 - Gold_Bid_995) > (SELECT AVG(Gold_Ask_995 - Gold_Bid_995) FROM bulletin_gold) or
 (Sov_Old_Ask - Sov_Old_Bid) > (SELECT AVG(Sov_Old_Ask - Sov_Old_Bid) FROM bulletin_gold) or
 (Sov_New_Upto1973_Ask - Sov_New_Upto1973_Bid) > (SELECT AVG(Sov_New_Upto1973_Ask - Sov_New_Upto1973_Bid) FROM bulletin_gold) or
 (Sov_New_Post1974_Ask - Sov_New_Post1974_Bid) > (SELECT AVG(Sov_New_Post1974_Ask - Sov_New_Post1974_Bid) FROM bulletin_gold)
ORDER BY Reference_Date;