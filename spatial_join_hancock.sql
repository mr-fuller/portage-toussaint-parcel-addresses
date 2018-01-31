select 
    --s.parcel as parcel_id,
min(s.owner) as owner,
--min(s.address) as prop_addr,
--min(s.mail_addr) as mail_addr,    
array_agg(distinct s.address) as addresses, 
array_agg(distinct b.wshd_name) as wshds,
array_agg(distinct s.parcel) as parcel_ids
from portage_hanc_cauv s 
join portage_touss_boundary b
on ST_intersects(s.geom,b.geom)
group by owner
order by wshds desc;