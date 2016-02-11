lineitem = LOAD '$input/lineitem' 
using OrcStorage() AS (extendedprice:double, discount:double);
 
SubLine = FOREACH lineitem GENERATE extendedprice*(1-discount) AS disc_price;

STORE SubLine INTO '$output/Q1_out' using PigStorage('|');