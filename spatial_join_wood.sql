select 
    --s.parcel as parcel_id,
min(s.taxpname) as owner,
--min(s.address) as prop_addr,
--min(s.mail_addr) as mail_addr,    
array_to_string(array_agg(distinct taxpattent),',') as attn, --|| ' ' ||
--array_to_string(array_agg(distinct ),',')  array_to_string(array_agg(distinct ),',') as addr0,-- ||' ' ||
array_to_string( array_agg( distinct(concat_ws(' ',taxpstre_1, taxpstreet, taxpstre_2, taxpstre_3))),',')  as addr1, --||' ' || array_to_string(array_agg(distinct taxpstre_3),',') as addr1, --||' ' || 
array_to_string(array_agg(distinct taxpstre_4),','), --||' ' || 
array_to_string(array_agg(distinct taxpsecond),',') as addr2, --||' ' ||
array_to_string(array_agg(distinct taxpcity),',') as city, --||' ' || 
array_to_string(array_agg(distinct taxpstate),',') as state_, --|| ' ' ||
array_to_string(array_agg(distinct taxpzipcod),',') as zipcode,--) as owner_address,
--array_agg(distinct s.address) as addresses, 
array_to_string(array_agg(distinct b.wshd_name), ',') as wshds,
array_to_string(array_agg(distinct s.mpropertyn), ',') as parcel_ids
from portage_wood_cauv s 
join portage_touss_boundary b
on ST_intersects(s.geom,b.geom)
group by s.taxpstre_1
order by wshds desc;

--select * from portage_wood_cauv where taxpname like 'OBERMYER%';