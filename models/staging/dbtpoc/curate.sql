{{ config(materialized='table',alias='CURATED_Stage') }}

with TPCH_SF1_Stage as (

    select * 
    from {{source ('TPCH_SF1','CUSTOMER')}}


),
TPCH_SF001_Stage as (

    select * 
    from {{source ('TPCH_SF001','CUSTOMER')}}


),
 CURATED_Stage as (

    select a.c_custkey,a.C_NAME,a.c_acctbal  
    from TPCH_SF1_Stage a 
	left join TPCH_SF001_Stage b on a.c_custkey=b.c_custkey


)


select *
from CURATED_Stage

