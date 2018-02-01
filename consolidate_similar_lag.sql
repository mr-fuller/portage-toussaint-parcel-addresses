with dissolved as (select taxpname, array_agg(mpropertyn) as parcels from portage_wood_cauv group by taxpname)

select 
taxpname,
case when (taxpname Like lag((taxpname || '%')) over (order by taxpname) )
				then NULL
				ELSE taxpname
				end, parcels
		from dissolved;